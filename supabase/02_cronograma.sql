-- =====================================================================
--  ACAMPAMENTO DESBRAVADORES — CARGA DO CRONOGRAMA (09 a 12/10/2026)
--  Rode DEPOIS do 01_estrutura.sql.
--  ATENÇÃO: este script APAGA o cronograma atual e recoloca o original.
--  (A tabela de editores NÃO é apagada.)
--
--  Versão sem rodízio de estações: as atividades que antes eram feitas
--  em grupos simultâneos agora são feitas em sequência, com o clube
--  inteiro junto. Só a Segurança/técnica de domingo (faca/facão/machadinha
--  x nós) continua em 2 grupos que trocam entre si.
-- =====================================================================

truncate public.estacoes, public.rodizios, public.atividades, public.dias, public.requisitos, public.tarefas restart identity cascade;

insert into public.dias (id, data, rotulo, titulo, subtitulo, ordem) values
  (1, '2026-10-09', 'Sex 09/10', 'Sexta-feira, 09/10', 'Chegada à noite (o sábado já começou ~18h10)', 1),
  (2, '2026-10-10', 'Sáb 10/10', 'Sábado, 10/10', '', 2),
  (3, '2026-10-11', 'Dom 11/10', 'Domingo, 11/10', 'Dia de prática', 3),
  (4, '2026-10-12', 'Seg 12/10', 'Segunda-feira, 12/10 (feriado)', 'Encerramento', 4);
select setval(pg_get_serial_sequence('public.dias','id'), (select max(id) from public.dias));

insert into public.atividades (id, dia_id, inicio, fim, titulo, conducao, requisitos, classes, material, responsavel, sabado, status, ordem) values
  -- SEXTA
  (1, 1, '19:00', '19:30', 'Chegada e check-in', 'Entregar fichas médicas e autorizações. Cada conselheiro confere a mochila dos seus desbravadores com a lista de equipamento pessoal.', 'Arrumar a mochila com o equipamento pessoal (Pioneiro); lista de equipamento, roupa e calçado (Pesquisador de Campo e Bosque)', 'PI, PE+', 'Lista de equipamento impressa, pranchetas', '', true, 'pendente', 1),
  (2, 1, '19:30', '21:00', 'Montagem do acampamento por unidade', 'Ensinar a escolher o local: plano, sem galhos secos por cima, longe de formigueiro e de baixada que alaga. Montar as barracas com lanterna, esticar e estaquear direito, organizar a área da unidade (barracas, mochilas, lixo).', 'Montar barraca em local apropriado (Amigo); Acampamento I, II e III (escolha do local e montagem); Arte de Acampar', 'AM, AM+, CO, PE', 'Barracas, lonas, estacas, lanternas', '', true, 'pendente', 2),
  (3, 1, '21:00', '21:45', 'Lanche e culto de recepção do sábado', 'Cânticos e mensagem curta ao redor das lanternas (sem cozinhar).', '', '', 'Lanche pronto', '', true, 'pendente', 3),
  (4, 1, '21:45', '22:30', 'Roda sob as estrelas', '1) Achar o Cruzeiro do Sul e, a partir dele, o Sul; marcar os 4 pontos cardeais no chão. 2) Conversa: 10 regras para caminhada e o que fazer se estiver perdido (ficar parado, apito 3x, abrigo). 3) Cada unidade fala 1 ''segredo de um bom acampamento'' até completar 6.', 'Pontos cardeais sem bússola (Companheiro); 10 regras de caminhada e procedimento se perdido (Amigo); 6 segredos de um bom acampamento (Pesquisador)', 'AM, CO, PE', 'Lanternas, cartaz das regras', '', true, 'pendente', 4),
  (5, 1, '22:30', '', 'Silêncio', '', '', '', '', '', true, 'pendente', 5),

  -- SÁBADO
  (6, 2, '07:00', '', 'Alvorada', '', '', '', '', '', true, 'pendente', 1),
  (7, 2, '07:30', '08:00', 'Devocional por unidade', '', '', 'Todos', '', '', true, 'pendente', 2),
  (8, 2, '08:00', '08:45', 'Café da manhã', 'Cozinha do clube.', '', '', '', '', true, 'pendente', 3),
  (9, 2, '08:45', '09:00', 'Cerimônia de abertura', 'Hasteamento das bandeiras e boas-vindas.', '', 'Todos', 'Bandeiras', '', true, 'pendente', 4),
  (10, 2, '09:00', '10:30', 'Escola Sabatina', '', '', 'Todos', '', '', true, 'pendente', 5),
  (11, 2, '10:30', '12:00', 'Culto divino', '', '', 'Todos', '', '', true, 'pendente', 6),
  (12, 2, '12:00', '14:00', 'Almoço e descanso', 'Cozinha do clube.', '', '', '', '', true, 'pendente', 7),
  (13, 2, '14:00', '16:30', 'Caminhada ecológica (~6 km ida e volta)', 'Cada unidade leva um caderno de campo. Paradas para: identificar flores e insetos; procurar pegadas, tocas e sinais de animais; mostrar plantas comestíveis e tóxicas (só identificar, NÃO comer); observar o tipo de terreno. Mostrar como andar em subida, descida, mata fechada e travessia de riacho.', 'Vida Silvestre (parcial); 10 flores silvestres e 10 insetos (Amigo da Natureza); caminhada de 6 km (Comp. de Excursionismo); anotações de terreno, flora e fauna (Excursionista); plantas comestíveis x tóxicas e técnicas de trilha (Excursionista na Mata)', 'AM+, CO+, PI, EX, EX+', 'Caderno e lápis por unidade, lupa, água, apito, kit de primeiros socorros', '', true, 'pendente', 8),
  (14, 2, '16:30', '17:15', 'Atividades de sábado à tarde', 'Cada unidade conduz uma atividade de natureza de 5–8 min para o clube (jogo de observação, caça ao tesouro da natureza, som dos pássaros, etc.). Com 5 unidades = 5 atividades.', 'Apresentar 5 atividades na natureza para o sábado à tarde (Excursionista na Mata)', 'EX+', '', '', true, 'pendente', 9),
  (15, 2, '17:15', '17:50', 'Estudo: o dilúvio e os fósseis', 'Conversa com ilustrações ou um fóssil real: como o dilúvio explica as camadas de rocha e a fossilização.', 'Estudar a história do dilúvio e o processo de fossilização (Pioneiro)', 'PI', 'Imagens ou fóssil', '', true, 'pendente', 10),
  (16, 2, '17:50', '18:20', 'Despedida do sábado (pôr do sol ~18h10)', '', '', 'Todos', '', '', true, 'pendente', 11),
  (17, 2, '18:20', '19:15', 'Oficina do Fogo', '1) Mostrar os tipos de fogueira: pirâmide, cabana, estrela, caçador e refletor. 2) Cada unidade acende a SUA fogueira com UM fósforo e só materiais naturais (isca, graveto, lenha). 3) Uma unidade monta um fogo refletor com uma parede de toras e todos sentem o calor refletido. 4) Demonstração com lenha molhada: tirar a casca, lascar até achar a parte seca, base elevada, isca guardada em saco.', 'Fogueira; fogueira com um fósforo (Amigo da Natureza); fogo refletor (Pioneiro); tipos de fogueira e como manter com umidade; acender em dia de chuva (Pioneiro de Novas Fronteiras); Fogueiras e Cozinha ao Ar Livre', 'AM, AM+, PI, PI+', 'Fósforos, lenha seca e molhada, facão (só adulto), baldes de água', '', false, 'pendente', 12),
  (18, 2, '19:15', '20:30', 'Jantar', 'Cozinha do clube, servido na fogueira central.', '', '', '', '', false, 'pendente', 13),
  (19, 2, '20:30', '22:00', 'Fogo do conselho', 'Relatos da caminhada: cada unidade mostra o que anotou. Hino dos Desbravadores, histórias e premiação da fogueira mais bem feita.', 'Relato da caminhada (Comp. de Excursionismo)', 'CO+', '', '', false, 'pendente', 14),
  (20, 2, '22:00', '', 'Silêncio', '', '', '', '', '', false, 'pendente', 15),

  -- DOMINGO
  (21, 3, '06:30', '', 'Alvorada', '', '', '', '', '', false, 'pendente', 1),
  (22, 3, '06:45', '07:15', 'Ordem Unida: treino', 'Todo o clube em formação: posições, voltas, marcha, comandos.', 'Ordem Unida (Excursionista na Mata)', 'EX+', 'Apito', '', false, 'pendente', 2),
  (23, 3, '07:15', '07:45', 'Devocional', '', '', 'Todos', '', '', false, 'pendente', 3),
  (24, 3, '07:45', '08:30', 'Café da manhã', 'Cozinha do clube.', '', '', '', '', false, 'pendente', 4),
  (25, 3, '08:30', '08:45', 'Inspeção de barracas e formatura', 'Pontuação por unidade (vale para o prêmio do acampamento).', 'Acampamento I/II/III (organização do acampamento)', 'Todos', 'Ficha de inspeção', '', false, 'pendente', 5),
  (26, 3, '08:45', '09:30', 'Segurança e técnica (2 grupos trocam a cada 20 min)', 'Grupo A: uso correto da faca, do facão e da machadinha e 10 regras de segurança. Grupo B: nós e amarras (14 nós do Amigo, nós do Companheiro, e as amarras quadrada, diagonal, paralela e redonda). Depois os grupos trocam.', 'Faca, facão e machadinha (Amigo da Natureza); machadinha (Pioneiro de Novas Fronteiras); 14 nós (Amigo); nós (Companheiro); 4 amarras (Pesquisador de Campo e Bosque)', 'AM, AM+, CO, PE+, PI+', 'Cordas, sisal, facas, facão, machadinha, toco para corte', '', false, 'pendente', 6),
  (27, 3, '09:30', '12:00', 'Grande pioneiria', 'Cada unidade constrói pelo menos 1 móvel de acampamento em tamanho real (mesa, cozinha elevada, porta-panelas, sapateira, lavatório, varal). No fim, todas as unidades juntas levantam o portal do clube. Os móveis serão usados no almoço.', 'Pioneirismo; Pioneirias (Excursionista); móvel em tamanho real com nós e amarras (Guia); construir um móvel (Pesquisador de Campo e Bosque); 5 móveis e um portal (Excursionista na Mata); acampamento com estrutura de pioneiria (Guia)', 'PI, PE+, EX, EX+, GU', 'Bambus ou varas, sisal (muito!), serrote, luvas', '', false, 'pendente', 7),
  (28, 3, '12:00', '13:15', 'Almoço das unidades', 'Cada unidade cozinha na própria fogueira, usando o móvel que construiu, seguindo o cardápio planejado antes do acampamento. É a única refeição cozinhada pelas unidades no acampamento inteiro — conta pelas 3 refeições ao ar livre do Guia.', 'Cozinha ao ar livre; 3 refeições ao ar livre (Guia); refeição em fogueira (Comp. de Excursionismo); cozinhar refeições (Pesquisador e Guia)', 'AM, CO+, PE, GU', 'Ingredientes, panelas, luvas, pegadores', '', false, 'pendente', 8),
  (29, 3, '13:15', '14:00', 'Descanso', 'Pausa depois do almoço.', '', '', '', '', false, 'pendente', 9),
  (30, 3, '14:00', '14:50', 'Primeiros socorros', 'Avaliar a cena, chamar ajuda (192/193), sinais vitais, controle de hemorragia, curativo, imobilizar fratura com tala improvisada, queimadura, picada de inseto e cobra, e treino de RCP no boneco ou na almofada.', 'Primeiros Socorros – básico', 'PE', 'Kit, ataduras, talas, boneco ou almofada', '', false, 'pendente', 10),
  (31, 3, '14:55', '15:45', 'Resgate básico', 'Simulado de acidente na trilha: isolar e avaliar a vítima, montar maca improvisada (2 varas + agasalhos ou cobertor), transporte com 1, 2 e 4 socorristas, arrastamento seguro e nós de resgate (lais de guia).', 'Resgate Básico (prático)', 'PI', '2 varas, cobertor, cordas, ''vítima'' maquiada', '', false, 'pendente', 11),
  (32, 3, '15:45', '16:30', 'Banho', '', '', '', '', '', false, 'pendente', 12),
  (33, 3, '16:30', '17:45', 'Jantar', 'Cozinha do clube.', '', '', '', '', false, 'pendente', 13),
  (34, 3, '17:45', '19:30', 'Culto ao redor da fogueira e noite de relatos', 'Cada unidade fala o que mais impressionou no acampamento (base do relatório escrito do Companheiro). Apresentação do portal e dos móveis.', 'Relatório do acampamento (Companheiro); discussão pós-expedição (Excursionista na Mata)', 'CO, EX+', '', '', false, 'pendente', 14),
  (35, 3, '22:00', '', 'Silêncio', 'Fica um tempo livre entre o culto (19:30) e o silêncio.', '', '', '', '', false, 'pendente', 15),

  -- SEGUNDA
  (36, 4, '06:30', '', 'Alvorada', '', '', '', '', '', false, 'pendente', 1),
  (37, 4, '07:00', '07:30', 'Devocional', '', '', 'Todos', '', '', false, 'pendente', 2),
  (38, 4, '07:30', '08:00', 'Café da manhã', 'Cozinha do clube.', '', '', '', '', false, 'pendente', 3),
  (39, 4, '08:00', '08:30', 'Formatura: apresentação de Ordem Unida', 'Avaliação da Ordem Unida diante dos pais ou da liderança.', 'Ordem Unida (Excursionista na Mata)', 'EX+', '', '', false, 'pendente', 4),
  (40, 4, '08:30', '09:10', 'Purificação de água', 'Demonstrar 4 formas: ferver por 1 min; filtro de garrafa PET (pano, areia fina, carvão, cascalho), e explicar que filtrar NÃO dispensa ferver ou tratar; hipoclorito (2 gotas por litro, esperar 30 min); SODIS (garrafa PET transparente 6 h ao sol).', 'Purificar água - 1 método (Amigo); demonstrar 3 formas de purificar água (Vida Silvestre, Excursionista na Mata)', 'AM+, EX+', 'Garrafas PET, areia, carvão, pano, fogareiro, hipoclorito', '', false, 'pendente', 5),
  (41, 4, '09:10', '09:50', 'Orientação pelo sol', 'Método da sombra do graveto: marcar a ponta da sombra, esperar 15 min e marcar de novo; a linha vai de Oeste para Leste. Cada um desenha uma rosa dos ventos com os 8 pontos.', 'Pontos cardeais sem bússola e rosa dos ventos (Companheiro)', 'CO', 'Graveto, pedras, papel e lápis de cor', '', false, 'pendente', 6),
  (42, 4, '09:50', '10:30', 'Quadro de nós', 'Cada unidade monta um quadro com 15 nós diferentes, com o nome de cada um. Revisão dos 14 nós do Amigo e dos nós do Companheiro. O quadro fica para a sala do clube.', 'Quadro com 15 nós (Comp. de Excursionismo); revisão de nós (Amigo, Companheiro)', 'CO+', 'Tábua ou papelão grosso, cordas, cola quente, etiquetas', '', false, 'pendente', 7),
  (43, 4, '10:30', '11:20', 'Azimutes e pista', 'Como ler a bússola e marcar um azimute. Percurso com 3 azimutes (ex.: 40°→20 passos, 160°→15, 280°→25) que termina num ''tesouro''. Na volta, o grupo segue uma pista de 10 sinais montada por outro grupo e depois monta a sua.', 'Percurso com três azimutes; Mapa e Bússola - parcial (Pioneiro de Novas Fronteiras); sinais de pista (Amigo)', 'AM, PI+', '1 bússola por dupla, estacas numeradas, cartão do percurso', '', false, 'pendente', 8),
  (44, 4, '11:20', '12:10', 'Abrigos', 'Mostrar 3 tipos: abrigo de lona em A, meia-água (lean-to) e abrigo de galhos e folhas encostado numa árvore caída. O grupo constrói um e fica 5 min dentro, avaliando se protegeria de chuva e vento. Local seguro e sem galhos soltos. Feito antes da desmontagem para ainda ter lona e corda à mão.', 'Projetar 3 tipos de abrigo e usar 1 (Guia de Exploração)', 'GU, GU+', 'Lonas, cordas, estacas, galhos e folhas secas', '', false, 'pendente', 9),
  (45, 4, '12:10', '14:10', 'Desmontagem do acampamento', 'Desmontar os móveis e o portal (reaproveitar o sisal), as barracas e as fogueiras (apagar e espalhar as cinzas frias). Recolher o lixo e deixar o local MELHOR do que encontrou.', 'Acampamento I, II e III; Arte de Acampar', 'AM, AM+, CO, PE', 'Sacos de lixo', '', false, 'pendente', 10),
  (46, 4, '14:10', '17:15', 'Almoço e tempo livre', 'Cozinha do clube (ou lanche frio). Depois, tempo livre para organização final, fotos e espera dos pais chegarem.', '', '', '', '', false, 'pendente', 11),
  (47, 4, '17:15', '18:00', 'Encerramento', 'Assinatura dos requisitos nos cartões, prêmio de melhor unidade, oração final.', '', 'Todos', 'Cartões, canetas', '', false, 'pendente', 12),
  (48, 4, '18:00', '', 'Saída', '', '', '', '', '', false, 'pendente', 13);
select setval(pg_get_serial_sequence('public.atividades','id'), (select max(id) from public.atividades));

-- Sem rodízio de estações nesta versão: o clube faz cada atividade junto, em sequência.
-- As tabelas rodizios/estacoes ficam vazias (já foram limpas pelo truncate acima).

insert into public.requisitos (id, item, tipo, quando, classes, instrutor, status, ordem) values
  -- Amigo (AM)
  (1, 'Montar barraca em local apropriado', 'Requisito', 'Sex 19:30', 'AM', '', 'pendente', 1),
  (2, '10 regras de caminhada / o que fazer se perdido', 'Requisito', 'Sex 21:45', 'AM', '', 'pendente', 2),
  (3, 'Fogueira', 'Requisito', 'Sáb 18:20', 'AM', '', 'pendente', 3),
  (4, '14 nós (revisão)', 'Requisito', 'Dom 08:45 · Seg 09:50', 'AM', '', 'pendente', 4),
  (5, 'Sinais de pista (10 sinais)', 'Requisito', 'Seg 10:30', 'AM', '', 'pendente', 5),
  -- Amigo da Natureza (AM+)
  (6, 'Arte de Acampar', 'Especialidade', 'Sex 19:30 · Seg 12:10', 'AM+', '', 'pendente', 6),
  (7, 'Fogueira com 1 fósforo', 'Requisito', 'Sáb 18:20', 'AM+', '', 'pendente', 7),
  (8, '10 flores e 10 insetos', 'Requisito', 'Sáb 14:00', 'AM+', '', 'pendente', 8),
  (9, 'Faca, facão e machadinha (uso seguro)', 'Requisito', 'Dom 08:45', 'AM+', '', 'pendente', 9),
  (10, 'Purificar água (1 método)', 'Requisito', 'Seg 08:30', 'AM+', '', 'pendente', 10),
  -- Companheiro (CO)
  (11, 'Pontos cardeais sem bússola / rosa dos ventos', 'Requisito', 'Sex 21:45 · Seg 09:10', 'CO', '', 'pendente', 11),
  (12, '9 nós (revisão)', 'Requisito', 'Dom 08:45 · Seg 09:50', 'CO', '', 'pendente', 12),
  (13, 'Acampamento II', 'Especialidade', 'Sex 19:30 · Dom 08:30 · Seg 12:10', 'CO', '', 'pendente', 13),
  (14, 'Relatório do acampamento', 'Requisito', 'Dom 17:45', 'CO', '', 'pendente', 14),
  -- Companheiro de Excursionismo (CO+)
  (15, 'Refeição em fogueira', 'Requisito', 'Dom 12:00', 'CO+', '', 'pendente', 15),
  (16, 'Quadro de 15 nós', 'Requisito', 'Seg 09:50', 'CO+', '', 'pendente', 16),
  (17, 'Relato da caminhada', 'Requisito', 'Sáb 20:30', 'CO+', '', 'pendente', 17),
  -- Pesquisador (PE)
  (18, '6 segredos de um bom acampamento', 'Requisito', 'Sex 21:45', 'PE', '', 'pendente', 18),
  (19, 'Acampamento III', 'Especialidade', 'Sex 19:30 · Dom 08:30 · Seg 12:10', 'PE', '', 'pendente', 19),
  (20, 'Primeiros Socorros – básico', 'Especialidade', 'Dom 14:00', 'PE', '', 'pendente', 20),
  (21, 'Cozinhar uma refeição', 'Requisito', 'Dom 12:00', 'PE', '', 'pendente', 21),
  -- Pesquisador de Campo e Bosque (PE+)
  (22, 'Lista de equipamento pessoal', 'Requisito', 'Sex 19:00', 'PE+', '', 'pendente', 22),
  (23, '4 amarras e 1 móvel', 'Requisito', 'Dom 08:45 · Dom 09:30', 'PE+', '', 'pendente', 23),
  -- Pioneiro (PI)
  (24, 'Fogo refletor', 'Requisito', 'Sáb 18:20', 'PI', '', 'pendente', 24),
  (25, 'Acampamento de fim de semana / mochila arrumada', 'Requisito', 'Sex 19:00', 'PI', '', 'pendente', 25),
  (26, 'Resgate Básico (parcial: maca, imobilização e transporte)', 'Especialidade', 'Dom 14:55', 'PI', '', 'pendente', 26),
  (27, 'Dilúvio e fossilização', 'Requisito', 'Sáb 17:15', 'PI', '', 'pendente', 27),
  -- Pioneiro de Novas Fronteiras (PI+)
  (28, 'Machadinha', 'Requisito', 'Dom 08:45', 'PI+', '', 'pendente', 28),
  (29, 'Fogueira em dia de chuva / lenha úmida', 'Requisito', 'Sáb 18:20', 'PI+', '', 'pendente', 29),
  (30, 'Mapa e Bússola (parcial: 1 azimute)', 'Especialidade', 'Seg 10:30', 'PI+', '', 'pendente', 30),
  -- Excursionista (EX)
  (31, 'Pioneirias', 'Especialidade', 'Dom 09:30', 'EX', '', 'pendente', 31),
  -- Excursionista na Mata (EX+)
  (32, 'Vida Silvestre (parcial)', 'Especialidade', 'Sáb 14:00 · Seg 08:30', 'EX+', '', 'pendente', 32),
  (33, 'Ordem Unida', 'Especialidade', 'Dom 06:45 · Seg 08:00', 'EX+', '', 'pendente', 33),
  (34, '5 móveis e 1 portal (parcial: 1 móvel + portal)', 'Requisito', 'Dom 09:30', 'EX+', '', 'pendente', 34),
  (35, '5 atividades de sábado à tarde', 'Requisito', 'Sáb 16:30', 'EX+', '', 'pendente', 35),
  (36, 'Técnicas de trilha', 'Requisito', 'Sáb 14:00', 'EX+', '', 'pendente', 36),
  (37, 'Discussão pós-expedição', 'Requisito', 'Dom 17:45', 'EX+', '', 'pendente', 37),
  -- Guia (GU)
  (38, '3 refeições ao ar livre (parcial: 1 refeição)', 'Requisito', 'Dom 12:00', 'GU', '', 'pendente', 38),
  (39, 'Móvel em tamanho real', 'Requisito', 'Dom 09:30', 'GU', '', 'pendente', 39),
  (40, 'Acampamento com estrutura de pioneiria', 'Requisito', 'Dom 09:30', 'GU', '', 'pendente', 40),
  (41, 'Cozinhar refeições', 'Requisito', 'Dom 12:00', 'GU', '', 'pendente', 41),
  -- Guia de Exploração (GU+)
  (42, 'Projetar 3 tipos de abrigo e usar 1 (parcial)', 'Especialidade', 'Seg 11:20', 'GU+', '', 'pendente', 42);
select setval(pg_get_serial_sequence('public.requisitos','id'), (select max(id) from public.requisitos));

-- Guia do instrutor de cada requisito (passo a passo + o que falar)
update public.requisitos set guia_instrutor = $$O que falar: "Antes de bater a primeira estaca, vamos escolher onde a barraca vai ficar."

Passo a passo:
1. Ande pelo terreno com o grupo e mostre 3 exemplos de local ruim: baixada que alaga, embaixo de galho seco, perto de formigueiro.
2. Escolham juntos um local plano e limpo.
3. Montem a barraca: estique bem a lona e cravem as estacas na diagonal.

Como avaliar: o desbravador escolhe o local e monta a barraca sem você apontar onde.$$ where id = 1;
update public.requisitos set guia_instrutor = $$O que falar: "Se um dia você se perder na mata, essas 10 regras podem salvar sua vida."

Passo a passo:
1. Leia as 10 regras com o grupo (ficar parado, apitar 3 vezes, se abrigar, não andar à noite...).
2. Peça a cada um que repita 2 regras de cabeça, sem olhar.

Como avaliar: o desbravador recita pelo menos 5 das 10 regras e explica por que ficar parado é importante.$$ where id = 2;
update public.requisitos set guia_instrutor = $$O que falar: "Toda fogueira segue a mesma ordem: isca, graveto fino, graveto grosso, lenha."

Passo a passo:
1. Mostre as camadas de material, da mais fina para a mais grossa.
2. Monte um tipo de fogueira (pirâmide ou cabana) junto com o grupo.
3. Acenda com segurança: longe de mato seco e com balde de água por perto.

Como avaliar: o desbravador monta a estrutura da fogueira sozinho, na ordem certa.$$ where id = 3;
update public.requisitos set guia_instrutor = $$O que falar: "Vamos revisar os nós que vocês já treinaram nas reuniões."

Passo a passo:
1. Peça a cada um que faça os 14 nós numa corda, sem ajuda.
2. Corrija na hora: mostre de novo o nó que saiu errado e deixe repetir.

Como avaliar: o desbravador faz os 14 nós corretamente, mesmo que devagar.$$ where id = 4;
update public.requisitos set guia_instrutor = $$O que falar: "Uma pista de sinais é um jeito de deixar mensagens no chão para quem vem atrás de você."

Passo a passo:
1. Mostre os 10 sinais (setas de galho, pedras empilhadas, nó na grama etc.).
2. Peça ao grupo que monte uma pista curta e que outro grupo decifre.

Como avaliar: o desbravador reconhece e monta pelo menos 8 dos 10 sinais.$$ where id = 5;
update public.requisitos set guia_instrutor = $$O que falar: "Arte de Acampar é saber deixar o acampamento organizado e confortável."

Passo a passo:
1. Revise com o desbravador os itens da especialidade que já foram feitos na montagem (sexta) e na desmontagem (segunda).
2. Marque juntos o que ainda falta.

Como avaliar: conferência do cartão da especialidade, marcando o que foi cumprido no acampamento.$$ where id = 6;
update public.requisitos set guia_instrutor = $$O que falar: "Agora o desafio: acender com UM fósforo só."

Passo a passo:
1. Reforce que a isca precisa estar bem seca e protegida do vento.
2. Deixe cada um tentar, corrigindo a montagem antes de acender.

Como avaliar: o desbravador acende com 1 fósforo (se errar, pode remontar e tentar de novo com outro fósforo, mas cada tentativa é 1 só).$$ where id = 7;
update public.requisitos set guia_instrutor = $$O que falar: "Vamos observar a natureza sem machucar nada."

Passo a passo:
1. Durante a caminhada, faça paradas combinadas.
2. Peça a cada desbravador que aponte e nomeie (ou descreva) uma flor ou um inseto diferente.

Como avaliar: o desbravador identifica 10 flores e 10 insetos ao longo do dia (não precisa ser tudo de uma vez).$$ where id = 8;
update public.requisitos set guia_instrutor = $$O que falar: "Antes de cortar qualquer coisa, vamos falar de segurança. Isso é o mais importante hoje."

Passo a passo:
1. Explique as 10 regras de segurança: círculo de segurança, entregar pelo cabo, guardar na bainha.
2. Demonstre o corte correto você mesmo primeiro.
3. Supervisione de perto cada desbravador cortando, um de cada vez.

Como avaliar: o desbravador usa a ferramenta corretamente e sabe repetir as regras de segurança.$$ where id = 9;
update public.requisitos set guia_instrutor = $$O que falar: "Na mata, nem toda água que parece limpa é segura para beber."

Passo a passo:
1. Escolha 1 método (fervura é o mais simples de mostrar) e faça a demonstração.
2. Explique por que funciona: o calor mata os microrganismos.

Como avaliar: o desbravador explica com as próprias palavras como e por que aquele método funciona.$$ where id = 10;
update public.requisitos set guia_instrutor = $$O que falar: "Dá para descobrir onde fica o Norte sem bússola nenhuma, só olhando para o céu ou para o sol."

Passo a passo:
1. Sexta à noite: mostre o Cruzeiro do Sul e como achar o Sul a partir dele.
2. Segunda de manhã: método da sombra do graveto para achar Leste e Oeste.
3. Peça que desenhem a rosa dos ventos com os 8 pontos.

Como avaliar: o desbravador acha os 4 pontos cardeais sem ajuda e desenha a rosa dos ventos correta.$$ where id = 11;
update public.requisitos set guia_instrutor = $$O que falar: "Vamos revisar os nós do nível Companheiro."

Passo a passo:
1. Peça a cada um que faça os 9 nós numa corda.
2. Corrija na hora, mostrando de novo o que saiu errado.

Como avaliar: o desbravador faz os 9 nós corretamente.$$ where id = 12;
update public.requisitos set guia_instrutor = $$O que falar: "Vamos ver o que já foi feito da especialidade de Acampamento II durante o fim de semana."

Passo a passo:
1. Revise com o desbravador os itens já cobertos na montagem, na inspeção e na desmontagem.
2. Marque juntos o que falta.

Como avaliar: conferência do cartão da especialidade.$$ where id = 13;
update public.requisitos set guia_instrutor = $$O que falar: "Guarde na cabeça (ou no caderninho) o que mais marcou você aqui, porque isso vira o seu relatório."

Passo a passo:
1. No culto de domingo à noite, peça que cada um fale em voz alta o que mais gostou.
2. Explique que isso é a base do relatório escrito que ele vai entregar depois do acampamento.

Como avaliar: relatório escrito entregue depois do acampamento.$$ where id = 14;
update public.requisitos set guia_instrutor = $$O que falar: "Cozinhar na fogueira é diferente de cozinhar em casa: o fogo não é constante."

Passo a passo:
1. Ajude a unidade a montar as brasas (cozinha-se nas brasas, não na chama direta).
2. Acompanhe o preparo do almoço de domingo sem fazer por eles.

Como avaliar: a unidade cozinha e serve a refeição sem depender do conselheiro para tudo.$$ where id = 15;
update public.requisitos set guia_instrutor = $$O que falar: "Esse quadro vai ficar exposto na sala do clube, então capriche."

Passo a passo:
1. Distribua tábua, corda e cola quente para cada unidade.
2. Ajude a organizar 15 nós diferentes, cada um com uma etiqueta com o nome.

Como avaliar: quadro pronto com 15 nós corretos e identificados.$$ where id = 16;
update public.requisitos set guia_instrutor = $$O que falar: "Cada unidade vai contar ao clube o que anotou durante a caminhada de hoje."

Passo a passo:
1. No fogo do conselho, chame cada unidade para contar uma descoberta da caminhada.
2. Lembre que depois será entregue um relatório de uma página.

Como avaliar: relatório de uma página da caminhada entregue depois do acampamento.$$ where id = 17;
update public.requisitos set guia_instrutor = $$O que falar: "Todo bom campista conhece 6 segredos. Vamos descobrir juntos."

Passo a passo:
1. Puxe uma roda de conversa e vá completando um segredo por vez com a contribuição do grupo.
2. Anote os 6 num cartaz para todo mundo ver.

Como avaliar: o desbravador cita os 6 segredos sem olhar.$$ where id = 18;
update public.requisitos set guia_instrutor = $$O que falar: "Vamos ver o que já foi feito da especialidade de Acampamento III durante o fim de semana."

Passo a passo:
1. Revise com o desbravador os itens já cobertos na montagem, na inspeção e na desmontagem.
2. Marque juntos o que falta.

Como avaliar: conferência do cartão da especialidade.$$ where id = 19;
update public.requisitos set guia_instrutor = $$O que falar: "Hoje vamos aprender o básico para agir bem nos primeiros minutos de uma emergência, sem precisar ser médico."

Passo a passo:
1. Explique a avaliação da cena (é seguro chegar?) e quando ligar 192/193.
2. Demonstre um curativo simples e uma imobilização com tala improvisada.
3. Deixe cada um praticar em dupla, com você supervisionando.

Como avaliar: o desbravador faz um curativo e uma imobilização corretamente e sabe quando pedir ajuda.$$ where id = 20;
update public.requisitos set guia_instrutor = $$O que falar: "Vamos cozinhar o almoço de hoje juntos, cada um com uma função."

Passo a passo:
1. Divida tarefas: fogo, corte, tempero e panela.
2. Acompanhe o preparo do início ao fim.

Como avaliar: o desbravador participa ativamente do preparo da refeição.$$ where id = 21;
update public.requisitos set guia_instrutor = $$O que falar: "Antes do acampamento cada um organiza a própria mochila. Vamos conferir o que veio."

Passo a passo:
1. Confira a mochila na chegada com a lista de equipamento impressa.
2. Aponte o que falta ou o que está sobrando.

Como avaliar: mochila com todos os itens da lista de equipamento pessoal.$$ where id = 22;
update public.requisitos set guia_instrutor = $$O que falar: "Amarra é diferente de nó: ela junta duas varas, não só uma corda."

Passo a passo:
1. Demonstre as 4 amarras: quadrada, diagonal, paralela e redonda.
2. Peça que use pelo menos 1 amarra na construção do móvel da Grande Pioneiria.

Como avaliar: o desbravador faz as 4 amarras e usa pelo menos 1 na prática.$$ where id = 23;
update public.requisitos set guia_instrutor = $$O que falar: "O fogo refletor joga o calor para um lado só, ótimo para esquentar sem gastar tanta lenha."

Passo a passo:
1. Monte uma parede de toras atrás da fogueira.
2. Mostre como o calor é refletido para a frente.

Como avaliar: o desbravador monta a estrutura sozinho e explica como ela funciona.$$ where id = 24;
update public.requisitos set guia_instrutor = $$O que falar: "Arrumar a mochila do jeito certo evita dor nas costas e coisa perdida no meio do mato."

Passo a passo:
1. Confira o peso e a distribuição: coisas pesadas embaixo e perto das costas.
2. Corrija junto com o desbravador, sem fazer por ele.

Como avaliar: mochila arrumada corretamente na chegada.$$ where id = 25;
update public.requisitos set guia_instrutor = $$O que falar: "Hoje vamos praticar um cenário de resgate: imobilizar e transportar um colega numa maca."

Passo a passo:
1. Explique por que, numa emergência de verdade, não se mexe numa vítima sem avaliar antes. Aqui é treino.
2. Monte a maca com 2 varas e um cobertor ou agasalhos.
3. Pratique imobilizar a 'perna' do colega com uma tala improvisada.
4. Revezem carregando um colega na maca: peso leve, terreno plano e supervisão direta o tempo todo.

Como avaliar: o grupo monta a maca, imobiliza e transporta com segurança. Lembre: essa atividade cobre só parte da especialidade de Resgate Básico.$$ where id = 26;
update public.requisitos set guia_instrutor = $$O que falar: "Como o dilúvio bíblico explica as camadas de rocha e os fósseis que encontramos hoje?"

Passo a passo:
1. Mostre imagens ou um fóssil real.
2. Conecte com o relato bíblico do dilúvio e explique a fossilização.

Como avaliar: o desbravador explica com as próprias palavras a ligação entre o dilúvio e os fósseis.$$ where id = 27;
update public.requisitos set guia_instrutor = $$O que falar: "A machadinha exige ainda mais cuidado que a faca. Vamos com calma."

Passo a passo:
1. Explique as regras específicas: área livre de dois braços de distância, corte sempre longe do corpo.
2. Demonstre o corte primeiro e supervisione de perto cada um.

Como avaliar: o desbravador usa a machadinha com segurança e correção.$$ where id = 28;
update public.requisitos set guia_instrutor = $$O que falar: "Na chuva de verdade a fogueira não pode falhar. Vamos aprender o truque."

Passo a passo:
1. Mostre como tirar a casca molhada e lascar a madeira até achar a parte seca por dentro.
2. Monte a base elevada do chão e guarde a isca em saco plástico.

Como avaliar: o desbravador consegue montar a fogueira e explicar a técnica.$$ where id = 29;
update public.requisitos set guia_instrutor = $$O que falar: "Um azimute é um ângulo que leva você a um rumo certo, mesmo sem enxergar o destino."

Passo a passo:
1. Ensine a segurar a bússola e girar o corpo até alinhar a agulha.
2. Marque 1 azimute e peça que conte os passos até o ponto combinado.

Como avaliar: o desbravador chega ao ponto marcado seguindo o azimute. Cobre só 1 azimute, não os 3 da especialidade completa.$$ where id = 30;
update public.requisitos set guia_instrutor = $$O que falar: "Pioneiria é construir coisas úteis de acampamento com bambu, corda e nó, sem prego."

Passo a passo:
1. Explique o projeto do móvel da unidade.
2. Acompanhe a amarração e a montagem sem fazer por eles.

Como avaliar: móvel construído e funcional, que aguenta o uso.$$ where id = 31;
update public.requisitos set guia_instrutor = $$O que falar: "Vamos aprender a observar a natureza sem interferir nela."

Passo a passo:
1. Na caminhada de sábado, aponte e identifique flora e fauna.
2. Na segunda, mostre 2 ou 3 métodos de purificar água.

Como avaliar: o desbravador identifica elementos da natureza e demonstra pelo menos 2 métodos de purificar água. É cobertura parcial da especialidade.$$ where id = 32;
update public.requisitos set guia_instrutor = $$O que falar: "Ordem Unida é disciplina em grupo: todo mundo no mesmo tempo, no mesmo passo."

Passo a passo:
1. Treine os comandos básicos (sentido, descansar, volver) no domingo de manhã.
2. Apresente a formatura na segunda de manhã.

Como avaliar: apresentação coordenada do grupo na formatura.$$ where id = 33;
update public.requisitos set guia_instrutor = $$O que falar: "Já cada unidade faz um móvel; juntos fazemos o portal do clube."

Passo a passo:
1. Cada unidade termina 1 móvel.
2. As unidades juntam esforço para levantar o portal.

Como avaliar: portal de pé e pelo menos 1 móvel por unidade. É cobertura parcial: a especialidade pede 5 móveis.$$ where id = 34;
update public.requisitos set guia_instrutor = $$O que falar: "Sábado à tarde é hora de atividade de natureza, sem fogo e sem construção."

Passo a passo:
1. Cada unidade prepara com antecedência uma atividade curta de 5 a 8 minutos.
2. Apresente em sequência para o clube todo.

Como avaliar: 5 atividades apresentadas, uma por unidade.$$ where id = 35;
update public.requisitos set guia_instrutor = $$O que falar: "Andar em trilha tem técnica: cada tipo de terreno pede um jeito diferente de pisar."

Passo a passo:
1. Durante a caminhada, mostre como andar em subida, descida, mata fechada e travessia de riacho.
2. Deixe cada um repetir a técnica no trecho seguinte.

Como avaliar: o desbravador aplica a técnica certa em cada tipo de terreno.$$ where id = 36;
update public.requisitos set guia_instrutor = $$O que falar: "Toda expedição termina com uma conversa: o que aprendemos e o que faríamos diferente?"

Passo a passo:
1. No culto de domingo à noite, faça perguntas reflexivas sobre a caminhada e o acampamento.
2. Deixe várias pessoas responderem.

Como avaliar: participação do desbravador na discussão.$$ where id = 37;
update public.requisitos set guia_instrutor = $$O que falar: "Hoje vocês vão cozinhar de verdade, do fogo ao prato."

Passo a passo:
1. Supervisione a unidade cozinhando o almoço de domingo (a única refeição das unidades neste acampamento).
2. Deixe os Guias liderarem a organização da cozinha.

Como avaliar: refeição preparada e servida pela própria unidade. Como só há uma refeição, ela representa as 3 do requisito.$$ where id = 38;
update public.requisitos set guia_instrutor = $$O que falar: "Um móvel de tamanho real precisa aguentar uso de verdade, não só ficar bonito."

Passo a passo:
1. Acompanhe a Grande Pioneiria com foco em amarração correta e segurança estrutural.
2. Teste o móvel antes de liberar para o uso.

Como avaliar: móvel de pé e aguentando uso real.$$ where id = 39;
update public.requisitos set guia_instrutor = $$O que falar: "Os Guias são quem planejam isso tudo. Vocês são os líderes aqui."

Passo a passo:
1. Antes do acampamento, reúna os Guias para planejar com a liderança.
2. No acampamento, acompanhe se o planejado está acontecendo.

Como avaliar: participação ativa dos Guias no planejamento, registrada antes do acampamento.$$ where id = 40;
update public.requisitos set guia_instrutor = $$O que falar: "Guia também lidera na cozinha: quem organiza a equipe garante que todos comam bem."

Passo a passo:
1. Deixe o Guia coordenar a divisão de tarefas na unidade.
2. Acompanhe o preparo do almoço de domingo.

Como avaliar: o Guia coordena o preparo da refeição da unidade.$$ where id = 41;
update public.requisitos set guia_instrutor = $$O que falar: "Um abrigo bem feito pode ser a diferença entre uma noite segura e uma noite ruim."

Passo a passo:
1. Mostre os 3 tipos: lona em A, meia-água (lean-to) e galhos e folhas encostado numa árvore caída.
2. Escolham 1 tipo para construir de verdade.
3. Testem ficando 5 minutos dentro, avaliando a proteção contra vento e chuva.

Como avaliar: o grupo constrói 1 abrigo funcional e sabe descrever os outros 2 tipos. É cobertura parcial: a especialidade pede projetar e usar.$$ where id = 42;

insert into public.tarefas (id, fase, descricao, requisitos, feito, ordem) values
  (1, 'ANTES', 'Cada unidade planeja o cardápio da única refeição que vai cozinhar (almoço de domingo) e faz a lista de compras.', 'Planejar a refeição (Pesquisador, Guia)', false, 1),
  (2, 'ANTES', 'Os Guias planejam o acampamento com a liderança: o que levar e a programação (usar este roteiro).', 'Planejar o acampamento (Guia)', false, 2),
  (3, 'ANTES', 'Entregar a lista de equipamento pessoal para os pais e para os desbravadores.', 'Mochila (Pioneiro); lista de equipamento (Pesquisador de Campo e Bosque)', false, 3),
  (4, 'ANTES', 'Treinar os nós nas reuniões de sábado antes do acampamento, para que no acampamento seja só revisão e avaliação.', 'Nós (Amigo, Companheiro)', false, 4),
  (5, 'ANTES', 'Liderança: separar bambus e sisal, reconhecer a trilha de 6 km, e montar o percurso dos azimutes (pode ser antes do acampamento).', '', false, 5),
  (6, 'DEPOIS', 'Relatório escrito do acampamento e do que mais impressionou.', 'Relatório (Companheiro)', false, 6),
  (7, 'DEPOIS', 'Relatório de uma página da caminhada de 6 km.', 'Comp. de Excursionismo', false, 7),
  (8, 'FORA', 'Caminhada de 10 km (Pesquisador de Campo e Bosque, Pioneiro de Novas Fronteiras); expedição de 20 km com pernoite (Excursionista); bússola ou GPS em zona urbana (Pesquisador); Excursionismo pedestre com mochila; mestrado em Vida Campestre.', 'Programar uma saída específica', false, 8);
select setval(pg_get_serial_sequence('public.tarefas','id'), (select max(id) from public.tarefas));
