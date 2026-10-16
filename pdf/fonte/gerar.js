// Gera, a partir do conteúdo desta pasta (cronograma.js, guias-1.js, guias-2.js):
//   - js/dados-exemplo.js e supabase/02_cronograma.sql (dados do site)
//   - pdf/Cronograma_Resumido_Acampamento_2026.pdf
//   - pdf/Cronograma_Completo_Guia_do_Instrutor_2026.pdf
// Uso:  node pdf/fonte/gerar.js        (precisa do Chrome ou do Edge instalado)
const fs = require('fs');
const os = require('os');
const path = require('path');
const { execFileSync } = require('child_process');
const { dias, atividades, requisitos, tarefas, G, CLASSES_ORDEM, CLASSES_NOMES, SIT } = require('./modelo.js');

const RAIZ = path.join(__dirname, '..', '..');
const CLUBE = 'Clube Apocalipse', TITULO = 'Acampamento 2026', DATAS = '09 a 12 de outubro de 2026';
const REVISAO = '09/10/2026';

// ------------------------------------------------------------------ dados do site
const SUFIXO = { C: '', D: ' (fecha com a entrega)', P: ' (parcial)', T: ' (treino)' };
const reqSite = requisitos.map(e => ({
  id: e.id, item: e.item.replace(/\.$/, '') + SUFIXO[e.sit], tipo: e.tipo, quando: e.quando, classes: e.classe, instrutor: '', status: 'pendente', ordem: e.ordem,
}));
const CAMPOS_ATIV = ['id', 'dia_id', 'inicio', 'fim', 'titulo', 'conducao', 'requisitos', 'classes', 'material', 'responsavel', 'sabado', 'status', 'ordem'];
const linhaJS = (o, campos = Object.keys(o)) => '  { ' + campos.map(k => `${JSON.stringify(k)}: ${JSON.stringify(o[k])}`).join(', ') + ' }';
const blocoJS = (nome, lista, campos) => ` ${JSON.stringify(nome)}: [${lista.length ? '\n' + lista.map(o => linhaJS(o, campos)).join(',\n') + '\n ' : ''}]`;

function gravarDadosExemplo() {
  const guias = atividades.filter(a => a.guia_instrutor).map(a => ` ${JSON.stringify(String(a.id))}: ${JSON.stringify(a.guia_instrutor)}`).join(',\n');
  const txt = `// Dados usados no MODO DEMONSTRAÇÃO (quando o Supabase ainda não foi configurado).
// São os mesmos dados do arquivo supabase/02_cronograma.sql.
// Revisão de ${REVISAO}: conferido com os cartões de classe e o Manual Administrativo (DSA, ed. 2020).
// Arquivo gerado por pdf/fonte/gerar.js: para mudar o cronograma, edite os arquivos de pdf/fonte e rode de novo.
window.DADOS_EXEMPLO = {
${[blocoJS('dias', dias), blocoJS('atividades', atividades, CAMPOS_ATIV), blocoJS('rodizios', []), blocoJS('estacoes', []),
    blocoJS('requisitos', reqSite), blocoJS('tarefas', tarefas)].join(',\n')}
};

// Guia do instrutor de cada atividade (mesmo texto do 02_cronograma.sql)
(function () {
 const guias = {
${guias}
};
 window.DADOS_EXEMPLO.atividades.forEach(a => { a.guia_instrutor = guias[a.id] || ''; });
})();
`;
  fs.writeFileSync(path.join(RAIZ, 'js', 'dados-exemplo.js'), txt, 'utf8');
}

const q = v => typeof v === 'string' ? `'${v.replace(/'/g, "''")}'` : String(v);
const valores = (lista, campos) => lista.map(o => '  (' + campos.map(k => q(o[k])).join(', ') + ')').join(',\n');
const setval = t => `select setval(pg_get_serial_sequence('public.${t}','id'), (select max(id) from public.${t}));`;
const NOME_DIA = { 1: 'SEXTA', 2: 'SÁBADO', 3: 'DOMINGO', 4: 'SEGUNDA' };

function gravarSQL() {
  const ativ = dias.map(d => `  -- ${NOME_DIA[d.id]}\n` + valores(atividades.filter(a => a.dia_id === d.id), CAMPOS_ATIV)).join(',\n\n');
  const guias = atividades.filter(a => a.guia_instrutor).map(a => {
    if (a.guia_instrutor.includes('$$')) throw new Error('guia com $$: atividade ' + a.id);
    return `update public.atividades set guia_instrutor = $$${a.guia_instrutor}$$ where id = ${a.id};`;
  }).join('\n\n');
  const txt = `-- =====================================================================
--  ACAMPAMENTO DESBRAVADORES — CARGA DO CRONOGRAMA (09 a 12/10/2026)
--  Rode DEPOIS do 01_estrutura.sql.
--  ATENÇÃO: este script APAGA o cronograma atual e recoloca o original.
--  (A tabela de editores NÃO é apagada.)
--
--  Revisão de ${REVISAO}: conferido com os cartões de classe e com o
--  Manual Administrativo do Clube de Desbravadores (DSA, ed. 2020).
--  Nas horas do sábado não há instrução técnica; o clube faz cada
--  atividade junto, em sequência. Só a Segurança e técnica de domingo
--  continua em 2 grupos que trocam entre si.
--  Arquivo gerado por pdf/fonte/gerar.js.
-- =====================================================================

truncate public.estacoes, public.rodizios, public.atividades, public.dias, public.requisitos, public.tarefas restart identity cascade;

insert into public.dias (id, data, rotulo, titulo, subtitulo, ordem) values
${valores(dias, ['id', 'data', 'rotulo', 'titulo', 'subtitulo', 'ordem'])};
${setval('dias')}

insert into public.atividades (${CAMPOS_ATIV.join(', ')}) values
${ativ};
${setval('atividades')}

-- Sem rodízio de estações nesta versão: o clube faz cada atividade junto, em sequência.
-- As tabelas rodizios/estacoes ficam vazias (já foram limpas pelo truncate acima).

insert into public.requisitos (id, item, tipo, quando, classes, instrutor, status, ordem) values
${valores(reqSite, ['id', 'item', 'tipo', 'quando', 'classes', 'instrutor', 'status', 'ordem'])};
${setval('requisitos')}

-- Guia do instrutor de cada atividade (reúne a orientação de todos os requisitos que ela cumpre)
${guias}

insert into public.tarefas (id, fase, descricao, requisitos, feito, ordem) values
${valores(tarefas, ['id', 'fase', 'descricao', 'requisitos', 'feito', 'ordem'])};
${setval('tarefas')}
`;
  fs.writeFileSync(path.join(RAIZ, 'supabase', '02_cronograma.sql'), txt, 'utf8');
}

// ------------------------------------------------------------------ PDFs
const esc = s => String(s ?? '').replace(/[&<>"]/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));
const COR = { AM: 'am', CO: 'co', PE: 'pe', PI: 'pi', EX: 'ex', GU: 'gu' };
const chip = s => `<span class="chip ${COR[s.replace('+', '')] || 'todos'}">${esc(s)}</span>`;
const chips = txt => String(txt || '').split(',').map(s => s.trim()).filter(Boolean).map(chip).join('');
const sit = s => `<span class="sit s${s}">${SIT[s]}</span>`;
const horario = at => `${esc(at.inicio)}${at.fim ? '–' + esc(at.fim) : ''}`;
const maiuscula = s => s ? s[0].toUpperCase() + s.slice(1) : '';
const CSS_BASE = `
* { box-sizing: border-box; -webkit-print-color-adjust: exact; print-color-adjust: exact; }
body { font-family: "Segoe UI", Arial, sans-serif; color: #1c2430; margin: 0; }
.topo { display: flex; justify-content: space-between; align-items: flex-end; border-bottom: 2.5px solid #1f4e79; padding-bottom: 5px; }
h1 { margin: 0; color: #1f4e79; line-height: 1.05; }
.sub { font-size: 10pt; color: #3b4656; margin-top: 2px; }
.rev { font-size: 7.8pt; color: #5b6676; text-align: right; }
.chip { display: inline-block; font-size: 7.6pt; font-weight: 700; color: #fff; border-radius: 9px; padding: 1px 6px; margin-left: 3px; }
.am { background: #1f6fc4; } .co { background: #c6392c; } .pe { background: #2f8f55; }
.pi { background: #6b7482; } .ex { background: #7a3f9d; } .gu { background: #e3b21b; color: #2a2300; }
.todos { background: #fff; color: #33414f; border: .8px solid #8793a1; }
.hora { font-weight: 700; font-variant-numeric: tabular-nums; white-space: nowrap; }`;

function htmlResumo() {
  const bloco = d => `<section class="dia ${d.id === 3 ? 'quebra' : ''}"><h2>${esc(d.titulo)}<small>${esc(d.subtitulo)}</small></h2>
    <table><thead><tr><th class="h">Horário</th><th>Atividade</th><th class="c">Classes</th><th class="r">Responsável</th></tr></thead><tbody>
    ${atividades.filter(x => x.dia_id === d.id).map(x => `<tr class="${x.sabado ? 'sab' : ''} ${!x.classes && !x.requisitos ? 'simples' : ''}">
      <td class="h hora">${horario(x)}</td><td class="t">${esc(x.titulo)}</td><td class="c">${chips(x.classes)}</td><td class="r">${esc(maiuscula(x.responsavel))}</td></tr>`).join('')}
    </tbody></table></section>`;
  return `<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><title>Cronograma resumido - ${CLUBE}</title><style>
@page { size: A4; margin: 10mm 11mm 10mm; }
${CSS_BASE}
body { font-size: 10pt; line-height: 1.25; } h1 { font-size: 18pt; }
.legenda { font-size: 8.2pt; color: #333; margin: 5px 0 4px; } .legenda .chip { margin: 0 2px 0 5px; }
.amostra { display: inline-block; width: 14px; height: 9px; background: #ffe9a8; border: .6px solid #d9b84a; vertical-align: -1px; }
.avisos { font-size: 8.3pt; background: #eef4fb; border-left: 3px solid #1f4e79; padding: 4px 8px; margin-bottom: 2px; } .avisos span { display: block; }
.dia { margin-top: 8px; break-inside: avoid; } .dia.quebra { break-before: page; margin-top: 0; }
.dia h2 { font-size: 12.5pt; margin: 0; background: #1f4e79; color: #fff; padding: 4px 9px; border-radius: 5px 5px 0 0; }
.dia h2 small { font-weight: 400; font-size: 8.6pt; margin-left: 9px; opacity: .95; }
table { width: 100%; border-collapse: collapse; }
th { font-size: 7.6pt; text-transform: uppercase; letter-spacing: .4px; color: #5b6676; text-align: left; padding: 3px 6px 2px; border-bottom: 1px solid #9aa7b6; font-weight: 700; }
td { padding: 3.6px 6px; border-bottom: .6px solid #d3dae3; vertical-align: middle; }
.h { width: 25mm; } .c { width: 55mm; text-align: right; } th.c { text-align: right; }
.r { width: 24mm; font-size: 8.6pt; color: #333; } td.r { border-left: .6px dotted #b9c2cd; }
td.t { font-weight: 600; } tr.simples td.t { font-weight: 400; color: #4d5766; } tr.sab td { background: #fff3c9; }
td.c .chip { margin: 1px 0 1px 3px; }
</style></head><body>
<header class="topo"><div><h1>Cronograma resumido</h1><div class="sub">${CLUBE} · ${TITULO} · ${DATAS}</div></div>
  <div class="rev">Revisado em ${REVISAO} pelos cartões de classe<br>e pelo Manual Administrativo (DSA, ed. 2020)</div></header>
<div class="legenda"><b>Classes:</b>${chip('AM')} Amigo${chip('CO')} Companheiro${chip('PE')} Pesquisador${chip('PI')} Pioneiro${chip('EX')} Excursionista${chip('GU')} Guia
  &nbsp;·&nbsp; <b>+</b> = classe avançada &nbsp;·&nbsp; <span class="amostra"></span> horas do sábado</div>
<div class="avisos"><b>Lembretes:</b>
  <span>1) Horas do sábado (fundo amarelo): só atividades espirituais e de natureza; nós, fogo, ferramentas e Ordem Unida ficam para depois do pôr do sol.</span>
  <span>2) Confirme o pôr do sol do local (São Paulo e Brasília: perto de 18h10); a Oficina do Fogo só começa depois dele.</span>
  <span>3) Sexta à noite: montar só o essencial para dormir, sem aula de requisito.</span></div>
${dias.map(bloco).join('\n')}
</body></html>`;
}

function htmlCompleto() {
  const passo = p => {
    const m = /^\(([^)]*min[^)]*)\)\s*(.*)$/.exec(p);
    const t = m ? `<span class="min">${esc(m[1])}</span> ${esc(m[2])}` : esc(p);
    return t.replace(/^(OFICINA [AB] \([^)]*\)|BÚSSOLA \([^)]*\)|PISTA \([^)]*\)):/, '<b>$1:</b>');
  };
  const lista = itens => `<ul>${itens.map(x => `<li${/^\d+\./.test(x) ? ' class="num"' : ''}>${esc(x)}</li>`).join('')}</ul>`;
  const cartao = at => {
    const g = G[at.id];
    if (!g) {
      return `<div class="linha ${at.sabado ? 'sab' : ''}"><span class="hora">${horario(at)}</span><span class="tit">${esc(at.titulo)}</span>
        <span class="desc">${esc(at.conducao)}</span><span class="cps">${chips(at.classes)}</span></div>`;
    }
    const reqs = (g.req || []).length ? `<table class="req"><thead><tr><th>Classe</th><th>Requisito do cartão</th><th>Situação</th></tr></thead><tbody>
      ${g.req.map(r => `<tr><td class="cl">${chip(r.classe)}</td><td>${esc(r.texto)}${r.obs ? `<span class="obs">${esc(r.obs)}</span>` : ''}</td><td class="st">${sit(r.sit)}</td></tr>`).join('')}
      </tbody></table>` : '';
    return `<article class="ativ ${at.sabado ? 'sab' : ''}">
      <header><span class="hora">${horario(at)}</span><h3>${esc(at.titulo)}</h3><span class="cps">${chips(at.classes)}</span></header>
      <div class="corpo">
        <p class="obj">${esc(g.objetivo || '')}</p>
        <p class="resumo"><b>Em resumo:</b> ${esc(at.conducao)}</p>
        ${reqs}
        ${at.material ? `<p class="mat"><b>Separe antes:</b> ${esc(at.material)}.</p>` : ''}
        ${g.fala ? `<p class="fala"><b>Fale assim:</b> “${esc(g.fala)}”</p>` : ''}
        ${(g.passos || []).length ? `<h4>Passo a passo</h4><ol class="passos">${g.passos.map(p => `<li>${passo(p)}</li>`).join('')}</ol>` : ''}
        ${(g.cola || []).length ? `<h4>Cola do instrutor</h4><div class="colas ${g.cola.length === 1 ? 'uma' : ''}">${g.cola.map(([t, itens]) => `<div class="cola ${itens.length >= 4 ? 'longa' : ''}"><h5>${esc(t)}</h5>${lista(itens)}</div>`).join('')}</div>` : ''}
        ${(g.cuidado || []).length ? `<div class="cuidado"><h5>Cuidado</h5>${lista(g.cuidado)}</div>` : ''}
        ${(g.avaliar || []).length ? `<div class="avaliar"><h5>Como avaliar e quando assinar</h5>${lista(g.avaliar)}</div>` : ''}
      </div></article>`;
  };
  const blocoDia = (d, i) => `<section class="dia ${i ? '' : 'primeiro'}"><h2>${esc(d.titulo)}<small>${esc(d.subtitulo)}</small></h2>
    ${atividades.filter(x => x.dia_id === d.id).map(cartao).join('\n')}</section>`;

  const abertura = `<section class="abertura">
  <header class="topo"><div><h1>Cronograma completo</h1><div class="sub2">com o guia do instrutor</div>
    <div class="sub">${CLUBE} · ${TITULO} · ${DATAS}</div></div>
    <div class="rev">Revisado em ${REVISAO} pelos cartões de classe<br>e pelo Manual Administrativo do Clube de Desbravadores<br>(Divisão Sul-Americana, edição 2020)</div></header>
  <h2 class="sec">Como usar este guia</h2>
  <div class="duas">
    <div><p>Cada atividade com requisito tem sempre os mesmos blocos, na mesma ordem:</p>
      <ul class="blocos"><li><b>Em resumo</b>: o que vai acontecer.</li><li><b>Requisito do cartão</b>: quem cumpre o quê.</li>
      <li><b>Separe antes</b>: o material.</li><li><b>Fale assim</b>: uma frase para começar.</li>
      <li><b>Passo a passo</b>: o que fazer, na ordem.</li><li><b>Cola do instrutor</b>: o conteúdo pronto para consultar.</li>
      <li><b>Cuidado</b>: segurança.</li><li><b>Como avaliar</b>: quando pode assinar.</li></ul></div>
    <div><p><b>Situação de cada requisito</b></p>
      <p>${sit('C')} O desbravador que fizer a atividade cumpre o requisito. Pode assinar.</p>
      <p>${sit('D')} Falta entregar um relatório ou texto. Assina quando entregar.</p>
      <p>${sit('P')} Só uma parte foi feita. Não assina: anote o que foi feito e o que falta.</p>
      <p>${sit('T')} É preparação para uma saída futura. Não assina.</p>
      <p class="leg"><b>Classes:</b> ${chip('AM')} Amigo ${chip('CO')} Companheiro ${chip('PE')} Pesquisador ${chip('PI')} Pioneiro ${chip('EX')} Excursionista ${chip('GU')} Guia. O sinal <b>+</b> indica a classe avançada. Fundo amarelo = horas do sábado.</p></div>
  </div>
  <h2 class="sec">Regras que valem o acampamento inteiro (Manual Administrativo)</h2>
  <div class="regras">
    <div class="regra"><h5>Sábado</h5><ul>
      <li>Vai do pôr do sol de sexta ao pôr do sol de sábado. Receba e despeça o sábado no horário, com culto.</li>
      <li>Nessas horas: culto, cânticos, histórias bíblicas, natureza e descanso.</li>
      <li>Não se faz: aula técnica (nós, Ordem Unida, fogueiras), esporte, brincadeira na água nem caminhada cansativa.</li>
      <li>Evite ao máximo: apanhar lenha, montar barraca, buscar água e cozinhar comida trabalhosa. Deixe pronto antes.</li></ul></div>
    <div class="regra"><h5>Segurança</h5><ul>
      <li>Autorização assinada e ficha de saúde de todos, em uma pasta com os líderes.</li>
      <li>Seguro anual em dia e saída aprovada pela comissão da igreja.</li>
      <li>Caixa de primeiros socorros sempre à mão. Emergência: 192 (SAMU) e 193 (Bombeiros).</li>
      <li>Fogo e ferramentas de corte são de alto risco: só com adulto ao lado.</li></ul></div>
    <div class="regra"><h5>Convivência</h5><ul>
      <li>Meninas e meninos em alas separadas, com as barracas dos líderes entre elas.</li>
      <li>Horário de silêncio é para dormir. Sem barulho alto à noite.</li>
      <li>Nada de contato físico de namoro. Palavras limpas, mesmo na hora de corrigir.</li>
      <li>Seriedade com alegria: somos Desbravadores, não militares.</li></ul></div>
    <div class="regra"><h5>Natureza, comida e cartões</h5><ul>
      <li>Não cortar árvores: usar bambu. Recolocar a grama das fogueiras. Lixo seco volta para casa.</li>
      <li>Cardápio sem carne. Água para beber e cozinhar: filtrada ou fervida.</li>
      <li>O instrutor só assina o requisito cumprido por inteiro e avaliado.</li>
      <li>Na saída, pente-fino: o lugar fica melhor do que estava.</li></ul></div>
  </div>
  <h2 class="sec">O que mudou nesta revisão</h2>
  <ol class="mudou">
    <li><b>Sexta à noite sem aula.</b> As 10 regras de caminhada e os 6 segredos foram para a roda de conversa de domingo, 19:30. Pontos cardeais: segunda, 09:10. Mochila do Pioneiro: segunda, na desmontagem. Barraca do Amigo: domingo, na inspeção.</li>
    <li><b>Chegada à noite.</b> O Manual pede chegar e montar antes do pôr do sol de sexta. Desta vez, monte só o essencial; nos próximos acampamentos, planeje sair mais cedo.</li>
    <li><b>Purificar água</b> é requisito do Amigo (classe regular), e inclui o parágrafo sobre Jesus, a água da vida.</li>
    <li><b>Almoço das unidades</b> conta como 1 das 2 refeições do Pesquisador e 1 das 3 do Guia. Não vale pelas 3.</li>
    <li><b>Anotações e discussão da expedição</b> são do Excursionista (classe regular) e aqui são só treino: o requisito pede 20 km com pernoite.</li>
    <li><b>Abrigos</b> é requisito só do Guia de Exploração, e agora fecha: o Guia desenha 3, explica e usa 1.</li>
    <li><b>Entraram requisitos que o acampamento já cumpria:</b> caminhada de 5 km (Amigo), caminhada ecológica (Companheiro), comandos de ordem unida (Pesquisador de Campo e Bosque), animais peçonhentos (Excursionista na Mata) e a especialidade Acampamento I (Amigo).</li>
    <li><b>Cruzeiro do Sul.</b> Em outubro ele não aparece no começo da noite. A orientação é feita pelo sol, na segunda.</li>
  </ol></section>`;

  const tabelaReq = `<section class="final"><h2 class="sec">Requisitos por classe</h2>
  <p class="nota">Use esta tabela no encerramento. Só assine o que está como “Fecha aqui” e foi cumprido pelo desbravador.</p>
  ${CLASSES_ORDEM.map(c => {
    const itens = requisitos.filter(x => x.classe === c);
    return itens.length ? `<div class="classe"><h3>${chip(c)} ${esc(CLASSES_NOMES[c])}</h3><table class="req tot"><tbody>
      ${itens.map(e => `<tr><td>${esc(e.item)}${e.obs ? `<span class="obs">${esc(e.obs)}</span>` : ''}</td><td class="qd">${esc(e.quando)}</td><td class="st">${sit(e.sit)}</td></tr>`).join('')}
      </tbody></table></div>` : '';
  }).join('')}</section>`;

  const FASES = { ANTES: 'Antes do acampamento', DEPOIS: 'Depois do acampamento', FORA: 'Fica para outra saída' };
  const fim = `<section class="final segue"><h2 class="sec">Antes e depois do acampamento</h2>
  ${Object.entries(FASES).map(([f, nome]) => `<h3 class="fase">${nome}</h3><ul class="tarefas">
    ${tarefas.filter(t => t.fase === f).map(t => `<li><span class="cx"></span><span>${esc(t.descricao)}${t.requisitos ? ` <i>(${esc(t.requisitos)})</i>` : ''}</span></li>`).join('')}</ul>`).join('')}
  <h2 class="sec">Fontes usadas na revisão</h2>
  <ul class="fontes">
    <li>Cartões das classes de Amigo, Companheiro, Pesquisador, Pioneiro, Excursionista e Guia, regulares e avançadas (texto do MDAWiki, mda.wiki.br, versão de junho de 2026).</li>
    <li>Manual Administrativo do Clube de Desbravadores, Divisão Sul-Americana, edição 2020: 4.1.4 Avaliação, 4.5 Ordem Unida e 4.9 Atividades campestres (caminhadas, acampamentos, o sábado no acampamento, fogo, alimentação, regras e fogo do conselho).</li>
    <li>Requisitos das especialidades Acampamento I, II e III, Arte de Acampar, Fogueiras e Cozinha ao Ar Livre, Pioneirias, Primeiros Socorros – básico, Resgate Básico, Vida Silvestre, Ordem Unida e Mapa e Bússola (MDAWiki).</li>
  </ul>
  <p class="nota">Antes de assinar, confira sempre no cartão impresso do desbravador: é ele que vale para a investidura.</p></section>`;

  return `<!doctype html><html lang="pt-BR"><head><meta charset="utf-8"><title>Cronograma completo com guia do instrutor - ${CLUBE}</title><style>
@page { size: A4; margin: 12mm 12mm 14mm;
  @bottom-left { content: "${CLUBE} · ${TITULO} · Guia do instrutor"; font: 7.5pt "Segoe UI", Arial, sans-serif; color: #6b7482; }
  @bottom-right { content: "Página " counter(page) " de " counter(pages); font: 7.5pt "Segoe UI", Arial, sans-serif; color: #6b7482; } }
${CSS_BASE}
body { font-size: 9.8pt; line-height: 1.33; } h1 { font-size: 21pt; }
p { margin: 0 0 4px; } ul, ol { margin: 0; padding-left: 16px; } li { margin: 1.2px 0; }
.sub2 { font-size: 13pt; color: #1f4e79; font-weight: 600; }
h2.sec { font-size: 12.5pt; color: #1f4e79; margin: 12px 0 5px; border-bottom: 1px solid #b7c6d8; padding-bottom: 2px; }
.duas { display: grid; grid-template-columns: 1fr 1.25fr; gap: 10mm; }
.blocos li { margin: 1.5px 0; } .leg { margin-top: 6px; font-size: 8.8pt; }
.regras { display: grid; grid-template-columns: 1fr 1fr; gap: 6px 8mm; }
.regra { background: #f3f6fa; border-left: 3px solid #1f4e79; padding: 5px 8px; break-inside: avoid; }
.regra h5, .cola h5, .cuidado h5, .avaliar h5 { margin: 0 0 2px; font-size: 9.6pt; }
.mudou li { margin: 3px 0; }
.dia { break-before: page; } .dia.primeiro { break-before: auto; margin-top: 12px; }
.dia h2 { font-size: 14pt; margin: 0 0 7px; background: #1f4e79; color: #fff; padding: 5px 10px; border-radius: 5px; }
.dia h2 small { font-weight: 400; font-size: 9pt; margin-left: 10px; opacity: .95; }
.linha { display: grid; grid-template-columns: 24mm 52mm 1fr auto; gap: 6px; align-items: baseline; padding: 3.5px 8px; border: .6px solid #d3dae3; border-radius: 4px; margin-bottom: 4px; break-inside: avoid; }
.linha .tit { font-weight: 600; } .linha .desc { color: #4d5766; font-size: 9pt; }
.sab.linha, .ativ.sab > header { background: #fff3c9; }
.ativ { border: 1px solid #9fb0c3; border-radius: 6px; margin: 8px 0 10px; }
.ativ > header { display: flex; align-items: center; gap: 9px; padding: 5px 9px; background: #e6eef7; border-bottom: 1px solid #9fb0c3; border-radius: 6px 6px 0 0; break-after: avoid; }
.ativ h3 { margin: 0; font-size: 12pt; flex: 1; color: #16324f; } .ativ > header .hora { font-size: 11pt; color: #16324f; }
.corpo { padding: 6px 9px 7px; } .obj { font-style: italic; color: #33414f; } .resumo { margin-bottom: 5px; }
h4 { font-size: 10.3pt; margin: 7px 0 3px; color: #1f4e79; text-transform: uppercase; letter-spacing: .3px; break-after: avoid; }
table.req { width: 100%; border-collapse: collapse; margin: 4px 0 5px; font-size: 9.2pt; }
table.req th { text-align: left; font-size: 7.4pt; text-transform: uppercase; letter-spacing: .4px; color: #5b6676; padding: 2px 5px; border-bottom: 1px solid #9aa7b6; }
table.req td { padding: 3px 5px; border-bottom: .6px solid #d3dae3; vertical-align: top; } table.req tr { break-inside: avoid; }
td.cl { width: 14mm; } td.st { width: 34mm; text-align: right; } td.qd { width: 40mm; font-size: 8.4pt; color: #3b4656; }
.obs { display: block; font-size: 8.5pt; color: #5b6676; }
.sit { display: inline-block; font-size: 7.6pt; font-weight: 700; border-radius: 3px; padding: 1.5px 5px; white-space: nowrap; }
.sC { background: #dff3e4; color: #17603a; border: .7px solid #7cc494; } .sD { background: #dfeaf8; color: #1f4e79; border: .7px solid #8fb0d6; }
.sP { background: #ffe8cc; color: #8a4b00; border: .7px solid #e3a45b; } .sT { background: #eceff3; color: #47525f; border: .7px solid #a9b3bf; }
.mat { background: #f6f7f9; padding: 3px 6px; border-radius: 3px; }
.fala { border-left: 3px solid #2f8f55; padding: 2px 7px; color: #1d4a30; background: #f1f8f3; }
ol.passos { padding-left: 19px; } ol.passos li { margin: 2.6px 0; padding-left: 2px; }
.min { display: inline-block; font-size: 7.8pt; font-weight: 700; background: #1f4e79; color: #fff; border-radius: 3px; padding: 0 4px; margin-right: 2px; }
.colas { columns: 2; column-gap: 7mm; }
.colas.uma { columns: 1; } .colas.uma .cola.longa ul { columns: 2; column-gap: 8mm; } .colas.uma .cola li { break-inside: avoid; }
.cola { break-inside: avoid; background: #f7f9fc; border: .7px solid #c5d0dc; border-radius: 4px; padding: 4px 7px 5px; margin-bottom: 5px; font-size: 9.2pt; }
.cola li.num { list-style: none; margin-left: -12px; }
.cuidado { background: #fdeeee; border-left: 3px solid #c6392c; padding: 4px 8px; margin-top: 5px; break-inside: avoid; font-size: 9.3pt; } .cuidado h5 { color: #8e2219; }
.avaliar { background: #eef7f0; border-left: 3px solid #2f8f55; padding: 4px 8px; margin-top: 5px; break-inside: avoid; font-size: 9.3pt; } .avaliar h5 { color: #1d5a37; }
.leg .chip, .classe h3 .chip, td.cl .chip { margin-left: 0; margin-right: 2px; }
.final { break-before: page; } .final.segue { break-before: auto; margin-top: 10px; }
.classe { break-inside: avoid; margin-bottom: 7px; } .classe h3 { font-size: 10.6pt; margin: 6px 0 1px; }
.nota { font-size: 9pt; color: #47525f; } h3.fase { font-size: 10.6pt; margin: 8px 0 3px; }
ul.tarefas { list-style: none; padding: 0; } ul.tarefas li { display: flex; gap: 7px; margin: 3px 0; break-inside: avoid; }
.cx { flex: none; width: 10px; height: 10px; border: 1px solid #47525f; border-radius: 2px; margin-top: 3px; }
.tarefas i { color: #5b6676; font-size: 8.8pt; } .fontes li { margin: 3px 0; font-size: 9.2pt; }
</style></head><body>
${abertura}
${dias.map(blocoDia).join('\n')}
${tabelaReq}
${fim}
</body></html>`;
}

function imprimir(html, nomePdf) {
  const navegador = ['C:/Program Files/Google/Chrome/Application/chrome.exe', 'C:/Program Files (x86)/Google/Chrome/Application/chrome.exe',
    'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe', 'C:/Program Files/Microsoft/Edge/Application/msedge.exe'].find(p => fs.existsSync(p));
  if (!navegador) throw new Error('Chrome ou Edge não encontrado para gerar o PDF.');
  const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'acampamento-pdf-'));
  const htmlPath = path.join(tmp, 'pagina.html');
  fs.writeFileSync(htmlPath, html, 'utf8');
  const pdfPath = path.join(RAIZ, 'pdf', nomePdf);
  execFileSync(navegador, ['--headless=new', '--disable-gpu', '--no-pdf-header-footer', '--user-data-dir=' + path.join(tmp, 'perfil'),
    '--print-to-pdf=' + pdfPath, 'file:///' + htmlPath.replace(/\\/g, '/')], { stdio: 'ignore', timeout: 120000 });
  console.log('PDF:', path.relative(RAIZ, pdfPath), Math.round(fs.statSync(pdfPath).size / 1024) + ' KB');
}

gravarDadosExemplo();
gravarSQL();
console.log('Dados do site: js/dados-exemplo.js e supabase/02_cronograma.sql');
imprimir(htmlResumo(), 'Cronograma_Resumido_Acampamento_2026.pdf');
imprimir(htmlCompleto(), 'Cronograma_Completo_Guia_do_Instrutor_2026.pdf');
