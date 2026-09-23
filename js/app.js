/* =====================================================================
   ACAMPAMENTO DESBRAVADORES — app.js
   Site estático (GitHub Pages) + Supabase (banco, login e tempo real).
   ===================================================================== */
(() => {
  'use strict';

  // ---------- CONFIGURAÇÃO ----------
  const cfg = window.APP_CONFIG || {};
  const DEMO = !cfg.SUPABASE_URL || !cfg.SUPABASE_ANON_KEY;
  let sb = null;
  if (!DEMO) {
    if (!window.supabase) {
      document.getElementById('app').innerHTML =
        '<p class="vazio">Não foi possível carregar a biblioteca do Supabase. Verifique a internet e recarregue.</p>';
      return;
    }
    sb = window.supabase.createClient(cfg.SUPABASE_URL, cfg.SUPABASE_ANON_KEY);
  }

  const TABELAS = ['dias', 'atividades', 'rodizios', 'estacoes', 'requisitos', 'tarefas'];
  const STATUS = { pendente: 'Pendente', andamento: 'Em andamento', concluida: 'Concluída' };
  const PROXIMO_STATUS = { pendente: 'andamento', andamento: 'concluida', concluida: 'pendente' };
  const CLASSES = { AM: 'am', CO: 'co', PE: 'pe', PI: 'pi', EX: 'ex', GU: 'gu' };
  const NOMES_CLASSE = { AM: 'Amigo', CO: 'Companheiro', PE: 'Pesquisador', PI: 'Pioneiro', EX: 'Excursionista', GU: 'Guia' };
  const FASES = { ANTES: 'Antes do acampamento', DEPOIS: 'Depois do acampamento', FORA: 'Fica para outra saída' };
  const ABAS = ['programacao', 'requisitos', 'tarefas'];

  const state = {
    dados: Object.fromEntries(TABELAS.map(t => [t, []])),
    carregado: false,
    user: null,
    editor: DEMO,           // no modo demonstração qualquer um testa a edição
    aba: ABAS.includes(location.hash.slice(1)) ? location.hash.slice(1) : 'programacao',
    diaId: null,
    busca: '',
    abertos: new Set(),     // detalhes de atividades abertos
    form: null,             // { tabela, registro }
  };

  // ---------- UTILITÁRIOS ----------
  const $ = (s, el = document) => el.querySelector(s);
  const esc = s => String(s ?? '').replace(/[&<>"']/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
  const nl = s => esc(s).replace(/\n/g, '<br>');
  const fmtGuia = s => esc(s)
    .replace(/^(Material e preparo|Tempo sugerido|Conteúdo pronto|O que falar|Passo a passo|Erros comuns|Segurança|Como avaliar|Fontes):/gm, '<strong>$1:</strong>')
    .replace(/(https?:\/\/[^\s<]+)/g, '<a href="$1" target="_blank" rel="noopener">$1</a>')
    .replace(/\n/g, '<br>');
  const porOrdem = (a, b) => (a.ordem ?? 0) - (b.ordem ?? 0) || a.id - b.id;
  const pad = n => String(n).padStart(2, '0');
  const hojeISO = () => { const d = new Date(); return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`; };
  const minutos = h => { const m = /^(\d{1,2}):(\d{2})/.exec(h || ''); return m ? +m[1] * 60 + +m[2] : null; };
  const agoraMin = () => { const d = new Date(); return d.getHours() * 60 + d.getMinutes(); };
  const diffDias = (a, b) => Math.round((new Date(b + 'T12:00') - new Date(a + 'T12:00')) / 864e5);

  let toastTimer;
  function toast(msg, erro = false) {
    const t = $('#toast');
    t.textContent = msg;
    t.className = 'toast show' + (erro ? ' erro' : '');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => (t.className = 'toast'), erro ? 5000 : 2500);
  }

  // ---------- DADOS ----------
  const dias = () => [...state.dados.dias].sort((a, b) => a.data.localeCompare(b.data) || porOrdem(a, b));
  const diaPorId = id => state.dados.dias.find(d => d.id === id);
  function atividadesDoDia(id) {
    return state.dados.atividades
      .filter(a => a.dia_id === id)
      .sort((a, b) => (minutos(a.inicio) ?? 0) - (minutos(b.inicio) ?? 0) || porOrdem(a, b));
  }
  function fimEfetivo(lista, i) {
    const a = lista[i];
    return minutos(a.fim) ?? minutos(lista[i + 1]?.inicio) ?? (minutos(a.inicio) + 30);
  }

  async function carregar() {
    try {
      if (DEMO) {
        if (!state.carregado) {
          const d = JSON.parse(JSON.stringify(window.DADOS_EXEMPLO || {}));
          TABELAS.forEach(t => (state.dados[t] = d[t] || []));
        }
      } else {
        const res = await Promise.all(TABELAS.map(t => sb.from(t).select('*').order('ordem').order('id')));
        res.forEach((r, i) => { if (r.error) throw r.error; state.dados[TABELAS[i]] = r.data; });
      }
      state.carregado = true;
      if (!diaPorId(state.diaId)) {
        const hoje = dias().find(d => d.data === hojeISO());
        state.diaId = (hoje || dias()[0] || {}).id ?? null;
      }
      render();
    } catch (e) {
      console.error(e);
      $('#app').innerHTML = `<p class="vazio">Erro ao carregar os dados: ${esc(e.message || e)}<br>
        Confira o <code>js/config.js</code> e se os scripts SQL foram rodados no Supabase.</p>`;
    }
  }

  let demoSeq = 100000;
  async function salvar(tabela, reg) {
    if (DEMO) {
      const lista = state.dados[tabela];
      if (reg.id) Object.assign(lista.find(x => x.id === reg.id), reg);
      else lista.push({ ...reg, id: ++demoSeq });
      render();
      return true;
    }
    const { id, ...campos } = reg;
    const q = id ? sb.from(tabela).update(campos).eq('id', id).select() : sb.from(tabela).insert(campos).select();
    const { data, error } = await q;
    if (error) { toast('Erro ao salvar: ' + error.message, true); return false; }
    if (!data || !data.length) { toast('Sem permissão para alterar. Seu e-mail está na lista de editores?', true); return false; }
    await carregar();
    return true;
  }

  async function excluir(tabela, id) {
    if (DEMO) {
      state.dados[tabela] = state.dados[tabela].filter(x => x.id !== id);
      if (tabela === 'dias') {
        state.dados.atividades = state.dados.atividades.filter(a => a.dia_id !== id);
        state.dados.rodizios = state.dados.rodizios.filter(r => r.dia_id !== id);
      }
      if (tabela === 'rodizios') state.dados.estacoes = state.dados.estacoes.filter(e => e.rodizio_id !== id);
      render();
      return true;
    }
    const { error } = await sb.from(tabela).delete().eq('id', id);
    if (error) { toast('Erro ao excluir: ' + error.message, true); return false; }
    await carregar();
    return true;
  }

  const proximaOrdem = (tabela, filtro = () => true) =>
    Math.max(0, ...state.dados[tabela].filter(filtro).map(x => x.ordem || 0)) + 1;

  // ---------- "AGORA" ----------
  function situacao() {
    const ds = dias();
    if (!ds.length) return null;
    const hoje = hojeISO();
    if (hoje < ds[0].data) return { fase: 'antes', faltam: diffDias(hoje, ds[0].data) };
    if (hoje > ds[ds.length - 1].data) return { fase: 'depois' };
    const dia = ds.find(d => d.data === hoje);
    if (!dia) return { fase: 'durante' };
    const lista = atividadesDoDia(dia.id);
    const n = agoraMin();
    let atual = null, proxima = null;
    lista.forEach((a, i) => {
      const ini = minutos(a.inicio);
      if (ini <= n && n < fimEfetivo(lista, i)) atual = a;
      if (ini > n && !proxima) proxima = a;
    });
    return { fase: 'durante', dia, atual, proxima };
  }

  function renderAgora() {
    const s = situacao();
    const el = $('#agora');
    if (!s) { el.innerHTML = ''; return; }
    if (s.fase === 'antes') {
      el.innerHTML = `<div class="agora-card"><span>⛺ Faltam <b>${s.faltam} ${s.faltam === 1 ? 'dia' : 'dias'}</b> para o acampamento. Sempre Alerta!</span></div>`;
    } else if (s.fase === 'depois') {
      el.innerHTML = `<div class="agora-card"><span>🔥 Acampamento encerrado. Obrigado a todos os desbravadores e líderes!</span></div>`;
    } else {
      const partes = [];
      if (s.atual) partes.push(`<span class="agora-item"><span class="agora-pulso"></span><span>Agora: <b>${esc(s.atual.titulo)}</b> (${esc(s.atual.inicio)}${s.atual.fim ? '–' + esc(s.atual.fim) : ''})</span></span>`);
      if (s.proxima) partes.push(`<span>Depois: <b>${esc(s.proxima.titulo)}</b> às ${esc(s.proxima.inicio)}</span>`);
      if (!partes.length) partes.push('<span>Sem atividades agora.</span>');
      if (s.atual) partes.push(`<button class="agora-link" data-acao="ir-agora" data-id="${s.atual.id}">ver</button>`);
      el.innerHTML = `<div class="agora-card">${partes.join('')}</div>`;
    }
  }

  // ---------- RENDER ----------
  function render() {
    $('#nome-clube').textContent = cfg.NOME_CLUBE || '';
    $('#titulo-acamp').textContent = cfg.TITULO || 'Acampamento';
    $('#datas-acamp').textContent = cfg.DATAS || '';
    document.title = `${cfg.TITULO || 'Acampamento'} · ${cfg.NOME_CLUBE || 'Desbravadores'}`;
    $('#aviso-demo').hidden = !DEMO;

    const btn = $('#btn-login');
    const us = $('#usuario');
    if (DEMO) { btn.hidden = true; }
    else if (state.user) {
      btn.textContent = 'Sair'; btn.dataset.acao = 'sair';
      us.hidden = false; us.textContent = (state.editor ? '✎ ' : '') + state.user.email;
    } else {
      btn.textContent = 'Entrar'; btn.dataset.acao = 'login'; us.hidden = true;
    }

    document.querySelectorAll('.abas button').forEach(b => b.classList.toggle('ativa', b.dataset.aba === state.aba));
    renderAgora();
    if (!state.carregado) return;
    const views = { programacao: vProgramacao, requisitos: vRequisitos, tarefas: vTarefas };
    $('#app').innerHTML = views[state.aba]();
    if (state.aba === 'programacao') {
      const b = $('#busca');
      if (b) b.value = state.busca;
    }
  }

  function chipsClasses(txt) {
    const itens = String(txt || '').split(/[,;]/).map(s => s.trim()).filter(Boolean);
    if (!itens.length) return '';
    return `<div class="chips">${itens.map(s => {
      const cod = s.replace('+', '').toUpperCase().slice(0, 2);
      const cls = CLASSES[cod];
      const nome = NOMES_CLASSE[cod] ? NOMES_CLASSE[cod] + (s.includes('+') ? ' (avançada)' : '') : s;
      return `<span class="chip ${cls || 'todos'}" title="${esc(nome)}">${esc(s)}</span>`;
    }).join('')}</div>`;
  }

  function statusEl(tabela, reg) {
    const st = reg.status || 'pendente';
    if (!state.editor) return `<span class="status ${st}">${STATUS[st]}</span>`;
    return `<button class="status ${st}" data-acao="status" data-tabela="${tabela}" data-id="${reg.id}"
      title="Toque para mudar o status">${STATUS[st]}</button>`;
  }

  function cardAtividade(a, { agoraId, mostrarDia = false } = {}) {
    const temDetalhe = a.conducao || a.requisitos || a.material || a.responsavel;
    const eAgora = a.id === agoraId;
    const classes = ['ativ', a.sabado ? 'sabado' : '', eAgora ? 'agora' : '', 'st-' + (a.status || 'pendente'), temDetalhe ? '' : 'simples'].join(' ');
    const dia = mostrarDia ? `<div class="ativ-dia">${esc(diaPorId(a.dia_id)?.rotulo || '')}</div>` : '';
    const hora = `<div class="ativ-hora">${dia}<strong>${esc(a.inicio)}</strong>${a.fim ? `<span>até ${esc(a.fim)}</span>` : ''}</div>`;
    const tags = (eAgora ? '<span class="tag-agora">AGORA</span>' : '') + (a.sabado ? '<span class="tag-sabado">☀ sábado</span>' : '');
    const acoes = state.editor ? `<div class="ativ-acoes"><button class="btn btn-peq" data-acao="editar" data-tabela="atividades" data-id="${a.id}">✎ Editar</button></div>` : '';

    if (!temDetalhe) {
      return `<article class="${classes}" id="a-${a.id}">${hora}
        <div><h3>${esc(a.titulo)}${tags}</h3>${chipsClasses(a.classes)}${acoes}</div>
        ${statusEl('atividades', a)}</article>`;
    }
    const bloco = (t, v, extra = '') => v ? `<div class="bloco ${extra}"><h4>${t}</h4><p>${nl(v)}</p></div>` : '';
    return `<article class="${classes}" id="a-${a.id}">${hora}
      <details data-id="${a.id}" ${state.abertos.has(a.id) ? 'open' : ''}>
        <summary><h3>${esc(a.titulo)}${tags}</h3>${chipsClasses(a.classes)}<div class="ativ-seta"></div></summary>
        <div class="ativ-corpo">
          ${bloco('Como conduzir', a.conducao)}
          ${bloco('Requisitos e especialidades', a.requisitos, 'req')}
          ${bloco('Material', a.material)}
          ${bloco('Responsável', a.responsavel)}
          ${acoes}
        </div>
      </details>
      ${statusEl('atividades', a)}</article>`;
  }

  function vProgramacao() {
    const ds = dias();
    if (!ds.length) {
      return `<p class="vazio">Nenhum dia cadastrado.</p>${state.editor ? '<div class="acoes"><button class="btn btn-pri" data-acao="novo" data-tabela="dias">+ Novo dia</button></div>' : ''}`;
    }
    const hoje = hojeISO();
    const chips = ds.map(d => {
      const n = atividadesDoDia(d.id).length;
      return `<button class="dia-chip ${d.id === state.diaId ? 'sel' : ''} ${d.data === hoje ? 'hoje' : ''}" data-acao="dia" data-id="${d.id}">
        <strong>${esc(d.rotulo)}</strong><small>${n} atividades</small></button>`;
    }).join('');

    const s = situacao();
    const agoraId = s?.atual?.id;
    let corpo;

    if (state.busca.trim()) {
      const termo = state.busca.trim().toLowerCase();
      const achados = ds.flatMap(d => atividadesDoDia(d.id)).filter(a =>
        [a.titulo, a.conducao, a.requisitos, a.classes, a.material, a.responsavel].join(' ').toLowerCase().includes(termo));
      corpo = `<div class="secao-topo"><div><h2>Busca: “${esc(state.busca)}”</h2><p>${achados.length} atividade(s) em todos os dias</p></div></div>
        <div class="lista">${achados.map(a => cardAtividade(a, { agoraId, mostrarDia: true })).join('') || '<p class="vazio">Nada encontrado.</p>'}</div>`;
    } else {
      const d = diaPorId(state.diaId) || ds[0];
      const lista = atividadesDoDia(d.id);
      const feitas = lista.filter(a => a.status === 'concluida').length;
      const pct = lista.length ? Math.round((feitas / lista.length) * 100) : 0;
      const acoes = `<div class="acoes">
          ${state.editor ? `<button class="btn btn-pri" data-acao="novo" data-tabela="atividades">+ Atividade</button>
          <button class="btn" data-acao="editar" data-tabela="dias" data-id="${d.id}">✎ Dia</button>
          <button class="btn" data-acao="novo" data-tabela="dias">+ Dia</button>` : ''}
          <button class="btn" data-acao="imprimir">🖨 Imprimir</button>
        </div>`;
      corpo = `<div class="secao-topo">
          <div><h2>${esc(d.titulo)}</h2>${d.subtitulo ? `<p>${esc(d.subtitulo)}</p>` : ''}</div>${acoes}
        </div>
        <div class="progresso" style="margin-bottom:14px"><span>${feitas} de ${lista.length} concluídas</span><div class="barra"><i style="width:${pct}%"></i></div><span>${pct}%</span></div>
        <div class="lista">${lista.map(a => cardAtividade(a, { agoraId })).join('') || '<p class="vazio">Nenhuma atividade neste dia.</p>'}</div>`;
    }

    return `<div class="dias">${chips}</div>
      <input id="busca" class="busca" type="search" placeholder="Buscar em todos os dias (ex.: abrigo, fogueira, nós, Pioneiro)…" autocomplete="off">
      <div id="prog-corpo">${corpo}</div>`;
  }

  function vRodizios() {
    const rods = [...state.dados.rodizios].sort(porOrdem);
    const novo = state.editor ? `<div class="acoes"><button class="btn btn-pri" data-acao="novo" data-tabela="rodizios">+ Rodízio</button></div>` : '';
    const topo = `<div class="secao-topo"><div><h2>Rodízios de estações</h2>
      <p>O clube é dividido em grupos (G1, G2…). Cada grupo passa por todas as estações.</p></div>${novo}</div>`;
    if (!rods.length) return topo + '<p class="vazio">Nenhum rodízio cadastrado.</p>';

    return topo + rods.map(r => {
      const ests = state.dados.estacoes.filter(e => e.rodizio_id === r.id).sort(porOrdem);
      const hs = Array.isArray(r.horarios) ? r.horarios : [];
      const n = ests.length;
      const grade = n && hs.length ? `<div class="tabela-rolagem"><table class="grade">
          <thead><tr><th>Horário</th>${ests.map(e => `<th>${esc(e.codigo)} ${esc(e.nome)}</th>`).join('')}</tr></thead>
          <tbody>${hs.map((h, i) => `<tr><td>${esc(h)}</td>${ests.map((_, j) => {
            const g = ((j - i) % n + n) % n + 1;
            return `<td><span class="grupo g${((g - 1) % 8) + 1}">G${g}</span></td>`;
          }).join('')}</tr>`).join('')}</tbody></table></div>` : '<p class="ajuda">Cadastre horários e estações para montar a grade.</p>';

      const cards = ests.map(e => `<div class="estacao">
          <h4><span class="cod">${esc(e.codigo)}</span>${esc(e.nome)}</h4>
          ${e.o_que_fazer ? `<div class="bloco"><h4>O que fazer</h4><p>${nl(e.o_que_fazer)}</p></div>` : ''}
          ${e.requisitos ? `<div class="bloco req"><h4>Requisitos</h4><p>${nl(e.requisitos)}</p></div>` : ''}
          ${e.material ? `<div class="bloco"><h4>Material</h4><p>${nl(e.material)}</p></div>` : ''}
          <div class="instrutor">Instrutor: <strong>${esc(e.instrutor) || '—'}</strong></div>
          ${state.editor ? `<div><button class="btn btn-peq" data-acao="editar" data-tabela="estacoes" data-id="${e.id}">✎ Editar</button></div>` : ''}
        </div>`).join('');

      const dia = diaPorId(r.dia_id);
      return `<section class="rodizio">
        <div class="rodizio-topo"><div><h3>${esc(r.titulo)}</h3><p>${dia ? esc(dia.titulo) + ' · ' : ''}${n} estações · ${hs.length} horários</p></div>
          ${state.editor ? `<div class="acoes"><button class="btn btn-peq" data-acao="editar" data-tabela="rodizios" data-id="${r.id}">✎ Rodízio</button>
          <button class="btn btn-peq" data-acao="novo" data-tabela="estacoes" data-rodizio="${r.id}">+ Estação</button></div>` : ''}
        </div>${grade}<div class="estacoes">${cards}</div></section>`;
    }).join('');
  }

  const CLASSES_ORDEM = ['AM', 'AM+', 'CO', 'CO+', 'PE', 'PE+', 'PI', 'PI+', 'EX', 'EX+', 'GU', 'GU+'];
  const CLASSES_NOMES = {
    AM: 'Amigo', 'AM+': 'Amigo da Natureza',
    CO: 'Companheiro', 'CO+': 'Companheiro de Excursionismo',
    PE: 'Pesquisador', 'PE+': 'Pesquisador de Campo e Bosque',
    PI: 'Pioneiro', 'PI+': 'Pioneiro de Novas Fronteiras',
    EX: 'Excursionista', 'EX+': 'Excursionista na Mata',
    GU: 'Guia', 'GU+': 'Guia de Exploração',
  };

  function vRequisitos() {
    const reqs = [...state.dados.requisitos].sort(porOrdem);
    const feitos = reqs.filter(r => r.status === 'concluida').length;
    const pct = reqs.length ? Math.round((feitos / reqs.length) * 100) : 0;
    const topo = `<div class="secao-topo"><div><h2>Controle de requisitos</h2><p>Especialidades e requisitos trabalhados no acampamento, organizados por classe.</p></div>
      ${state.editor ? '<div class="acoes"><button class="btn btn-pri" data-acao="novo" data-tabela="requisitos">+ Requisito</button></div>' : ''}</div>
      <div class="progresso" style="margin-bottom:14px"><span>${feitos} de ${reqs.length} concluídos</span><div class="barra"><i style="width:${pct}%"></i></div><span>${pct}%</span></div>`;

    const linhaReq = r => {
      const st = r.status || 'pendente';
      const lado = state.editor
        ? `<div class="lado"><select class="sel-status" data-acao="req-status" data-id="${r.id}" aria-label="Status">
            ${Object.entries(STATUS).map(([k, v]) => `<option value="${k}" ${k === st ? 'selected' : ''}>${v}</option>`).join('')}
           </select><button class="btn-icone" data-acao="editar" data-tabela="requisitos" data-id="${r.id}" aria-label="Editar">✎</button></div>`
        : `<span class="status ${st}">${STATUS[st]}</span>`;
      const cabecalho = `<div class="titulo"><span class="tipo">${esc(r.tipo)}</span>${esc(r.item)}</div>${lado}
        <div class="meta"><span>🕒 ${esc(r.quando) || '—'}</span></div>`;
      if (!r.guia_instrutor) {
        return `<div class="linha-req">${cabecalho}</div>`;
      }
      return `<div class="linha-req linha-req-guia">
        <details><summary>${cabecalho}<div class="ativ-seta"></div></summary>
          <div class="bloco"><h4>Guia do instrutor</h4><p>${fmtGuia(r.guia_instrutor)}</p></div>
        </details>
      </div>`;
    };

    const classesDe = r => (r.classes || '').split(',').map(s => s.trim()).filter(Boolean);

    const grupos = CLASSES_ORDEM.map(cod => {
      const itens = reqs.filter(r => classesDe(r).includes(cod));
      if (!itens.length) return '';
      return `<section class="fase"><h3>${cod} — ${CLASSES_NOMES[cod]} <span style="font-weight:400;color:var(--txt-2);font-size:13px">(${itens.length})</span></h3>
        <div class="tabela-lista">${itens.map(linhaReq).join('')}</div></section>`;
    }).join('');

    const semClasse = reqs.filter(r => !classesDe(r).length);
    const extra = semClasse.length
      ? `<section class="fase"><h3>Sem classe definida</h3><div class="tabela-lista">${semClasse.map(linhaReq).join('')}</div></section>`
      : '';

    return topo + (grupos + extra || '<p class="vazio">Nenhum requisito cadastrado.</p>');
  }

  function vTarefas() {
    const ts = [...state.dados.tarefas].sort(porOrdem);
    const topo = `<div class="secao-topo"><div><h2>Antes e depois do acampamento</h2><p>Preparação, relatórios e o que fica para outra saída.</p></div>
      ${state.editor ? '<div class="acoes"><button class="btn btn-pri" data-acao="novo" data-tabela="tarefas">+ Tarefa</button></div>' : ''}</div>`;
    return topo + Object.entries(FASES).map(([fase, nome]) => {
      const itens = ts.filter(t => t.fase === fase);
      if (!itens.length) return '';
      return `<section class="fase"><h3>${nome}</h3>${itens.map(t => `
        <div class="tarefa ${t.feito ? 'feito' : ''}">
          <input type="checkbox" ${t.feito ? 'checked' : ''} ${state.editor ? '' : 'disabled'} data-acao="tarefa-feito" data-id="${t.id}" aria-label="Feito">
          <div><div class="desc">${nl(t.descricao)}</div>${t.requisitos ? `<div class="req">${esc(t.requisitos)}</div>` : ''}</div>
          ${state.editor ? `<button class="btn-icone" data-acao="editar" data-tabela="tarefas" data-id="${t.id}" aria-label="Editar">✎</button>` : '<span></span>'}
        </div>`).join('')}</section>`;
    }).join('');
  }

  // ---------- FORMULÁRIOS ----------
  const FORMS = {
    dias: { nome: 'dia', campos: [
      { k: 'rotulo', l: 'Nome curto (aparece no botão)', req: 1, ph: 'Sex 09/10', meia: 1 },
      { k: 'data', l: 'Data', t: 'date', req: 1, meia: 1 },
      { k: 'titulo', l: 'Título', req: 1, ph: 'Sexta-feira, 09/10' },
      { k: 'subtitulo', l: 'Observação do dia' },
    ] },
    atividades: { nome: 'atividade', campos: [
      { k: 'dia_id', l: 'Dia', t: 'dia', req: 1 },
      { k: 'inicio', l: 'Início', t: 'time', req: 1, meia: 1 },
      { k: 'fim', l: 'Fim (opcional)', t: 'time', meia: 1 },
      { k: 'titulo', l: 'Atividade', req: 1 },
      { k: 'conducao', l: 'Como conduzir', t: 'area' },
      { k: 'requisitos', l: 'Requisitos e especialidades trabalhados', t: 'area' },
      { k: 'classes', l: 'Classes atendidas (AM, CO, PE, PI, EX, GU; "+" = avançada)', ph: 'AM, CO+, PI' },
      { k: 'material', l: 'Material', t: 'area' },
      { k: 'responsavel', l: 'Responsável', meia: 1 },
      { k: 'status', l: 'Status', t: 'status', meia: 1 },
      { k: 'sabado', l: 'Horário de sábado (destaque amarelo)', t: 'check' },
    ] },
    rodizios: { nome: 'rodízio', campos: [
      { k: 'titulo', l: 'Título', req: 1 },
      { k: 'dia_id', l: 'Dia', t: 'dia' },
      { k: 'horarios', l: 'Horários (um por linha)', t: 'lista', ph: '14:00–14:40\n14:45–15:25' },
      { k: 'ordem', l: 'Ordem na página', t: 'number' },
    ] },
    estacoes: { nome: 'estação', campos: [
      { k: 'rodizio_id', l: 'Rodízio', t: 'rodizio', req: 1 },
      { k: 'codigo', l: 'Código', ph: 'E1', meia: 1 },
      { k: 'ordem', l: 'Ordem (coluna na grade)', t: 'number', meia: 1 },
      { k: 'nome', l: 'Nome da estação', req: 1 },
      { k: 'o_que_fazer', l: 'O que fazer', t: 'area' },
      { k: 'requisitos', l: 'Requisitos', t: 'area' },
      { k: 'material', l: 'Material', t: 'area' },
      { k: 'instrutor', l: 'Instrutor' },
    ] },
    requisitos: { nome: 'requisito', campos: [
      { k: 'item', l: 'Item', req: 1 },
      { k: 'tipo', l: 'Tipo', t: 'sel', opts: ['Especialidade', 'Requisito'], meia: 1 },
      { k: 'status', l: 'Status', t: 'status', meia: 1 },
      { k: 'quando', l: 'Quando', ph: 'Dom 14:00' },
      { k: 'classes', l: 'Classe(s) (AM, AM+, CO, CO+, PE, PE+, PI, PI+, EX, EX+, GU, GU+)', ph: 'AM, EX+' },
      { k: 'guia_instrutor', l: 'Guia do instrutor (passo a passo + o que falar)', t: 'area' },
      { k: 'instrutor', l: 'Instrutor' },
      { k: 'ordem', l: 'Ordem na lista', t: 'number' },
    ] },
    tarefas: { nome: 'tarefa', campos: [
      { k: 'fase', l: 'Quando', t: 'sel', opts: Object.keys(FASES), nomes: FASES },
      { k: 'descricao', l: 'O que fazer', t: 'area', req: 1 },
      { k: 'requisitos', l: 'Requisitos relacionados' },
      { k: 'feito', l: 'Feito', t: 'check' },
      { k: 'ordem', l: 'Ordem na lista', t: 'number' },
    ] },
  };

  function campoHTML(c, v) {
    const req = c.req ? 'required' : '';
    const ph = c.ph ? `placeholder="${esc(c.ph)}"` : '';
    const opt = (val, txt, sel) => `<option value="${esc(val)}" ${sel ? 'selected' : ''}>${esc(txt)}</option>`;
    let input;
    switch (c.t) {
      case 'area': input = `<textarea name="${c.k}" ${req} ${ph}>${esc(v)}</textarea>`; break;
      case 'lista': input = `<textarea name="${c.k}" ${ph}>${esc((v || []).join('\n'))}</textarea>`; break;
      case 'time': input = `<input type="time" name="${c.k}" value="${esc(v)}" ${req}>`; break;
      case 'date': input = `<input type="date" name="${c.k}" value="${esc(v)}" ${req}>`; break;
      case 'number': input = `<input type="number" name="${c.k}" value="${esc(v)}">`; break;
      case 'check': return `<label class="campo-check"><input type="checkbox" name="${c.k}" ${v ? 'checked' : ''}> ${esc(c.l)}</label>`;
      case 'status': input = `<select name="${c.k}">${Object.entries(STATUS).map(([k, t]) => opt(k, t, (v || 'pendente') === k)).join('')}</select>`; break;
      case 'sel': input = `<select name="${c.k}">${c.opts.map(o => opt(o, c.nomes?.[o] || o, v === o)).join('')}</select>`; break;
      case 'dia': input = `<select name="${c.k}" ${req}>${c.req ? '' : opt('', '—', !v)}${dias().map(d => opt(d.id, d.titulo, d.id === v)).join('')}</select>`; break;
      case 'rodizio': input = `<select name="${c.k}" ${req}>${[...state.dados.rodizios].sort(porOrdem).map(r => opt(r.id, r.titulo, r.id === v)).join('')}</select>`; break;
      default: input = `<input type="text" name="${c.k}" value="${esc(v)}" ${req} ${ph}>`;
    }
    return `<label class="campo"><span>${esc(c.l)}</span>${input}</label>`;
  }

  function abrirForm(tabela, registro) {
    const def = FORMS[tabela];
    state.form = { tabela, registro };
    $('#form-titulo').textContent = (registro.id ? 'Editar ' : 'Nova(o) ') + def.nome;
    // agrupa campos "meia" lado a lado
    let html = '', buffer = [];
    const flush = () => { if (buffer.length) { html += `<div class="linha2">${buffer.join('')}</div>`; buffer = []; } };
    def.campos.forEach(c => {
      const h = campoHTML(c, registro[c.k]);
      if (c.meia) { buffer.push(h); if (buffer.length === 2) flush(); } else { flush(); html += h; }
    });
    flush();
    $('#form-campos').innerHTML = html;
    $('#form-excluir').hidden = !registro.id;
    $('#dlg-form').showModal();
  }

  function lerForm() {
    const { tabela, registro } = state.form;
    const f = $('#form-edicao').elements;
    const out = { ...registro };
    FORMS[tabela].campos.forEach(c => {
      const el = f[c.k];
      if (!el) return;
      if (c.t === 'check') out[c.k] = el.checked;
      else if (['number', 'dia', 'rodizio'].includes(c.t)) out[c.k] = el.value === '' ? (c.t === 'number' ? 0 : null) : Number(el.value);
      else if (c.t === 'lista') out[c.k] = el.value.split('\n').map(s => s.trim()).filter(Boolean);
      else out[c.k] = el.value.trim();
    });
    return out;
  }

  function novoRegistro(tabela, alvo) {
    switch (tabela) {
      case 'dias': return { data: '', rotulo: '', titulo: '', subtitulo: '', ordem: proximaOrdem('dias') };
      case 'atividades': return { dia_id: state.diaId, inicio: '', fim: '', titulo: '', status: 'pendente', sabado: false, ordem: proximaOrdem('atividades', a => a.dia_id === state.diaId) };
      case 'rodizios': return { titulo: '', dia_id: null, horarios: [], ordem: proximaOrdem('rodizios') };
      case 'estacoes': {
        const rid = Number(alvo.dataset.rodizio) || state.dados.rodizios[0]?.id;
        const ordem = proximaOrdem('estacoes', e => e.rodizio_id === rid);
        return { rodizio_id: rid, codigo: 'E' + ordem, nome: '', ordem };
      }
      case 'requisitos': return { item: '', tipo: 'Requisito', status: 'pendente', quando: '', instrutor: '', ordem: proximaOrdem('requisitos') };
      case 'tarefas': return { fase: 'ANTES', descricao: '', feito: false, ordem: proximaOrdem('tarefas') };
    }
  }

  // ---------- EVENTOS ----------
  document.addEventListener('click', async ev => {
    const el = ev.target.closest('[data-acao]');
    if (!el || el.tagName === 'SELECT' || el.type === 'checkbox') return;
    const acao = el.dataset.acao;
    const id = Number(el.dataset.id);
    const tabela = el.dataset.tabela;

    switch (acao) {
      case 'aba':
        state.aba = el.dataset.aba; history.replaceState(null, '', '#' + state.aba); render(); break;
      case 'dia':
        state.diaId = id; state.busca = ''; render(); break;
      case 'ir-agora': {
        const a = state.dados.atividades.find(x => x.id === id);
        if (!a) return;
        state.aba = 'programacao'; state.diaId = a.dia_id; state.busca = ''; state.abertos.add(a.id);
        history.replaceState(null, '', '#programacao'); render();
        document.getElementById('a-' + id)?.scrollIntoView({ behavior: 'smooth', block: 'center' });
        break;
      }
      case 'status': {
        ev.preventDefault();
        const reg = state.dados[tabela].find(x => x.id === id);
        if (reg) await salvar(tabela, { id, status: PROXIMO_STATUS[reg.status || 'pendente'] });
        break;
      }
      case 'editar': {
        ev.preventDefault();
        const reg = state.dados[tabela].find(x => x.id === id);
        if (reg) abrirForm(tabela, JSON.parse(JSON.stringify(reg)));
        break;
      }
      case 'novo': abrirForm(tabela, novoRegistro(tabela, el)); break;
      case 'excluir-form': {
        const { tabela: t, registro } = state.form;
        const aviso = t === 'dias' ? '\n\nTodas as atividades deste dia também serão apagadas.'
          : t === 'rodizios' ? '\n\nTodas as estações deste rodízio também serão apagadas.' : '';
        if (!confirm(`Excluir “${registro.titulo || registro.nome || registro.item || registro.descricao || registro.rotulo}”?${aviso}`)) return;
        if (await excluir(t, registro.id)) { $('#dlg-form').close(); toast('Excluído.'); }
        break;
      }
      case 'fechar': el.closest('dialog').close(); break;
      case 'imprimir': window.print(); break;
      case 'login': $('#dlg-login').showModal(); break;
      case 'sair': await sb.auth.signOut(); toast('Você saiu.'); break;
    }
  });

  document.addEventListener('change', async ev => {
    const el = ev.target;
    if (el.dataset.acao === 'req-status') await salvar('requisitos', { id: Number(el.dataset.id), status: el.value });
    if (el.dataset.acao === 'tarefa-feito') await salvar('tarefas', { id: Number(el.dataset.id), feito: el.checked });
  });

  document.addEventListener('toggle', ev => {
    const d = ev.target;
    if (d.tagName !== 'DETAILS' || !d.dataset.id) return;
    const id = Number(d.dataset.id);
    d.open ? state.abertos.add(id) : state.abertos.delete(id);
  }, true);

  document.addEventListener('input', ev => {
    if (ev.target.id !== 'busca') return;
    state.busca = ev.target.value;
    const pos = ev.target.selectionStart;
    render();
    const b = $('#busca');
    b.focus(); b.setSelectionRange(pos, pos);
  });

  $('#form-edicao').addEventListener('submit', async ev => {
    ev.preventDefault();
    const reg = lerForm();
    if (await salvar(state.form.tabela, reg)) { $('#dlg-form').close(); toast('Salvo!'); }
  });

  $('#form-login').addEventListener('submit', async ev => {
    ev.preventDefault();
    const f = ev.target.elements;
    const { error } = await sb.auth.signInWithPassword({ email: f.email.value.trim(), password: f.senha.value });
    if (error) { toast('Não foi possível entrar: ' + (error.message === 'Invalid login credentials' ? 'e-mail ou senha incorretos.' : error.message), true); return; }
    f.senha.value = '';
    $('#dlg-login').close();
  });

  // abre todos os detalhes na impressão
  window.addEventListener('beforeprint', () => document.querySelectorAll('.ativ details').forEach(d => (d.open = true)));
  window.addEventListener('afterprint', () => render());

  // ---------- LOGIN E TEMPO REAL ----------
  async function atualizarUsuario(session) {
    state.user = session?.user || null;
    state.editor = false;
    if (state.user) {
      const { data, error } = await sb.rpc('eh_editor');
      state.editor = !error && data === true;
      if (!state.editor) toast('Você entrou, mas este e-mail não está na lista de editores.', true);
      else toast('Modo edição ativado.');
    }
    render();
  }

  if (!DEMO) {
    sb.auth.onAuthStateChange((_evento, session) => setTimeout(() => atualizarUsuario(session), 0));
    let t;
    sb.channel('acampamento')
      .on('postgres_changes', { event: '*', schema: 'public' }, () => { clearTimeout(t); t = setTimeout(carregar, 400); })
      .subscribe();
  }

  // atualiza o "Agora" a cada minuto
  setInterval(() => {
    const ativo = document.activeElement;
    if ($('#dlg-form').open || $('#dlg-login').open || (ativo && ativo.id === 'busca')) { renderAgora(); return; }
    render();
  }, 60000);

  render();
  carregar();
})();
