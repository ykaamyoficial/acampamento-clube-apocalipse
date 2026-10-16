// Junta o cronograma (base.js) com os guias e monta: requisitos por classe, tarefas e o texto do guia para o site.
const { dias, atividades } = require('./cronograma.js');
const G = { ...require('./guias-1.js'), ...require('./guias-2.js') };

const CLASSES_ORDEM = ['AM', 'AM+', 'CO', 'CO+', 'PE', 'PE+', 'PI', 'PI+', 'EX', 'EX+', 'GU', 'GU+'];
const CLASSES_NOMES = {
  AM: 'Amigo', 'AM+': 'Amigo da Natureza', CO: 'Companheiro', 'CO+': 'Companheiro de Excursionismo',
  PE: 'Pesquisador', 'PE+': 'Pesquisador de Campo e Bosque', PI: 'Pioneiro', 'PI+': 'Pioneiro de Novas Fronteiras',
  EX: 'Excursionista', 'EX+': 'Excursionista na Mata', GU: 'Guia', 'GU+': 'Guia de Exploração',
};
const SIT = { C: 'Fecha aqui', D: 'Fecha com a entrega', P: 'Parcial', T: 'Treino' };
const DIA_CURTO = { 1: 'Sex', 2: 'Sáb', 3: 'Dom', 4: 'Seg' };

// chave para juntar o mesmo requisito que aparece em mais de uma atividade
const CHAVES = [
  [/14 nós/, 'am-nos'], [/9 nós/, 'co-nos'], [/comandos de ordem unida/, 'pe+-ou'],
  [/caminhada de 6 km/i, 'co+-6km'], [/seis segredos/i, 'pe-segredos'], [/quatro amarras/, 'pe+-amarras'],
  [/20 km/, 'ex-20km'], [/Especialidade de Ordem Unida/, 'esp-ordem-unida'],
];
const ROTULOS = {
  'ex-20km': 'Expedição de 20 km com uma noite fora: planejamento, anotações de terreno, flora e fauna e discussão em grupo.',
};
function chave(q) {
  for (const [re, k] of CHAVES) if (re.test(q.texto)) return q.classe + '|' + k;
  return q.classe + '|' + rotulo(q);
}
const ehEsp = t => /^(Completar a )?[Ee]specialidade/.test(t);
function rotulo(q) {
  const m = /^(?:Completar a e|E)specialidade (?:de )?([^:.]+?)(?::|\.|$)/.exec(q.texto);
  return m ? 'Especialidade ' + m[1].trim() : q.texto;
}

const porId = Object.fromEntries(atividades.map(x => [x.id, x]));
const mapa = new Map();
for (const at of atividades) {
  const g = G[at.id];
  if (!g) continue;
  for (const q of g.req || []) {
    const k = chave(q);
    const quando = `${DIA_CURTO[at.dia_id]} ${at.inicio}`;
    if (!mapa.has(k)) mapa.set(k, { classe: q.classe, item: ROTULOS[k.split('|')[1]] || rotulo(q), tipo: ehEsp(q.texto) ? 'Especialidade' : 'Requisito', sit: q.sit, quando: [quando], obs: q.obs });
    else {
      const e = mapa.get(k);
      if (!e.quando.includes(quando)) e.quando.push(quando);
      e.sit = e.tipo === 'Especialidade' ? 'P' : q.sit;   // vale a situação da última atividade
      if (q.obs && e.tipo !== 'Especialidade') e.obs = q.obs;
    }
  }
}
const requisitos = [];
for (const c of CLASSES_ORDEM) {
  const itens = [...mapa.values()].filter(e => e.classe === c);
  itens.sort((a, b) => (a.tipo === 'Especialidade') - (b.tipo === 'Especialidade'));
  for (const e of itens) {
    if (e.tipo === 'Especialidade') e.obs = 'Marque na ficha de controle os itens feitos. A especialidade só é concluída com todos os itens.';
    requisitos.push({ ...e, quando: e.quando.join(' · ') });
  }
}
requisitos.forEach((x, i) => { x.id = i + 1; x.ordem = i + 1; });

const tarefas = [
  ['ANTES', 'Cada unidade planeja o cardápio (sem carne) da refeição que vai cozinhar no domingo e faz a lista de compras.', 'Planejar a refeição (Pesquisador, Guia)'],
  ['ANTES', 'Os Guias planejam o acampamento com a liderança: o que levar e o que vai acontecer.', 'Acampamento com estrutura de pioneiria (Guia)'],
  ['ANTES', 'Enviar aos pais o comunicado e a lista do que levar. Recolher a autorização de saída assinada e a ficha de saúde de cada desbravador.', 'Manual Administrativo'],
  ['ANTES', 'Conferir o seguro anual de todos os participantes e a aprovação da saída pela comissão da igreja.', 'Manual Administrativo'],
  ['ANTES', 'Treinar os nós e a fogueira nas reuniões antes do acampamento, para que lá seja só prática e avaliação.', 'Nós (Amigo, Companheiro); fogueiras (Manual Administrativo)'],
  ['ANTES', 'Liderança: separar bambus, sisal e lenha seca (no sábado não se apanha lenha), reconhecer a trilha de 6 km e montar o percurso dos azimutes.', ''],
  ['ANTES', 'Cada unidade prepara a sua atividade de natureza para o sábado à tarde. Quem vai dirigir devocional ou culto é avisado com 3 semanas de antecedência.', 'Excursionista na Mata; Manual Administrativo'],
  ['ANTES', 'Imprimir: lista dos nós, 10 regras das ferramentas, cartaz dos sinais de pista, 10 regras de caminhada, ficha de inspeção e ficha de controle dos requisitos.', ''],
  ['DEPOIS', 'Relatório escrito do acampamento, destacando o que mais impressionou.', 'Companheiro'],
  ['DEPOIS', 'Relatório de uma página da caminhada de 6 km.', 'Companheiro de Excursionismo'],
  ['DEPOIS', 'Parágrafo sobre Jesus, a água da vida, para quem não entregou no acampamento.', 'Amigo'],
  ['DEPOIS', 'Reunião da liderança, em até uma semana, para avaliar o acampamento (áreas física, mental e espiritual).', 'Manual Administrativo'],
  ['FORA', 'Caminhada de 10 km (Pesquisador de Campo e Bosque, Pioneiro de Novas Fronteiras); expedição de 20 km com pernoite (Excursionista); refeições que faltarem ao Pesquisador (2) e ao Guia (3); os outros 4 móveis (Excursionista na Mata); bússola ou GPS em zona urbana (Pesquisador); Excursionismo pedestre com mochila (Companheiro de Excursionismo); mestrado em Vida Campestre (Guia de Exploração); parte teórica de Ordem Unida; itens restantes das especialidades iniciadas no acampamento.', 'Programar uma saída específica'],
].map(([fase, descricao, requisitos], i) => ({ id: i + 1, fase, descricao, requisitos, feito: false, ordem: i + 1 }));

// ---- texto do guia para o site (mesmos rótulos que o app.js já destaca) ----
function guiaTexto(at) {
  const g = G[at.id];
  if (!g) return '';
  const L = [];
  if (g.objetivo) L.push('Objetivo: ' + g.objetivo, '');
  if (g.req && g.req.length) {
    L.push('Requisitos cumpridos nesta atividade:');
    for (const q of g.req) L.push(`- [${q.classe}] ${q.texto} (${SIT[q.sit]})${q.obs ? ' ' + q.obs : ''}`);
    L.push('');
  }
  if (at.material) L.push('Material e preparo: ' + at.material, '');
  L.push(`Tempo sugerido: ${at.inicio}${at.fim ? ' às ' + at.fim : ''}`, '');
  if (g.fala) L.push(`O que falar: "${g.fala}"`, '');
  if (g.passos && g.passos.length) { L.push('Passo a passo:'); g.passos.forEach((p, i) => L.push(`${i + 1}. ${p}`)); L.push(''); }
  for (const [t, itens] of g.cola || []) { L.push('▶ ' + t); itens.forEach(x => L.push((/^\d+\./.test(x) ? '' : '- ') + x)); L.push(''); }
  if (g.cuidado && g.cuidado.length) { L.push('Segurança:'); g.cuidado.forEach(x => L.push('- ' + x)); L.push(''); }
  if (g.avaliar && g.avaliar.length) { L.push('Como avaliar:'); g.avaliar.forEach(x => L.push('- ' + x)); }
  return L.join('\n').trim();
}
for (const at of atividades) at.guia_instrutor = guiaTexto(at);

module.exports = { dias, atividades, requisitos, tarefas, G, CLASSES_ORDEM, CLASSES_NOMES, SIT, DIA_CURTO, porId };

if (require.main === module) {
  console.log('atividades:', atividades.length, '| com guia:', atividades.filter(x => x.guia_instrutor).length, '| requisitos:', requisitos.length, '| tarefas:', tarefas.length);
  for (const c of CLASSES_ORDEM) {
    console.log('\n' + c + ' — ' + CLASSES_NOMES[c]);
    for (const e of requisitos.filter(x => x.classe === c)) console.log(`  [${e.sit}] ${e.tipo === 'Especialidade' ? '(esp) ' : ''}${e.item.slice(0, 95)} | ${e.quando}`);
  }
}
