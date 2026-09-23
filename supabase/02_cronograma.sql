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

-- Guia do instrutor de cada requisito (material, tempo, conteúdo pronto, passo a passo, erros, segurança, avaliação e fontes)
update public.requisitos set guia_instrutor = $$Material e preparo: 1 barraca por unidade (lona, varas, estacas, sobreteto), martelo ou pedra para as estacas, lanternas. Combine antes com os Guias quem leva cada barraca.
Tempo sugerido: 30 a 40 min por unidade.

O que falar: "Antes de bater a primeira estaca, vamos escolher onde a barraca vai ficar. O lugar certo evita chuva dentro e noite ruim."

Conteúdo pronto:
Tipos de barraca do cartão do Amigo: iglu, canadense e bangalô. Mostre um exemplo se tiver.
Como escolher o local (resumo das fontes):
- Terreno sem desníveis e sem buracos, longe de rio ou riacho (pode encher e alagar).
- Observe o vento e o sol: porta contra o vento e, se possível, sombra na parte quente do dia.
- Nunca armar embaixo de árvore com galho seco ou fraco.
- Conferir o entorno: formigueiro, trilha de animais, terreno em declive.
Lembre: o requisito do Amigo é 'aprender e montar uma barraca em local apropriado'.

Passo a passo:
1. Ande pelo terreno com o grupo e mostre 3 locais ruins: baixada onde a água empoça, embaixo de galho seco e perto de formigueiro.
2. Escolham juntos um local plano, limpo de pedras e galhos.
3. Estenda a lona do chão e posicione a barraca com a porta contra o vento.
4. Encaixem as varas e levantem a estrutura em 2 pessoas.
5. Cravem as estacas inclinadas (uns 45 graus, apontando para fora) e prendam os tensores.
6. Estiquem o sobreteto sem encostar na barraca de dentro.
7. Organizem o interior: mochilas ao fundo, calçados na entrada, lanterna ao alcance.

Erros comuns: estaca cravada reta (sai com o vento); sobreteto encostando na parede interna (pinga na chuva); montar em baixada.

Segurança: olhar para cima antes de armar: galho seco pode cair.

Como avaliar: o desbravador escolhe o local e monta a barraca sem você apontar onde. Assine o requisito quando a barraca estiver firme e esticada.

Fontes:
https://mda.wiki.br/cartao_de_amigo/
https://desbrava7.com/2019/05/classe-de-amigo-respondida.html$$ where id = 1;
update public.requisitos set guia_instrutor = $$Material e preparo: Cartaz ou folha com as 10 regras (imprimir antes), apito por unidade, lanterna.
Tempo sugerido: 10 a 15 min (na Roda sob as estrelas).

O que falar: "Se um dia você se perder na mata, essas regras podem salvar sua vida. A principal é: não entre em pânico e fique onde está."

Conteúdo pronto:
AS 10 REGRAS PARA UMA CAMINHADA (com a explicação de cada uma):
1. Planejamento: a caminhada deve ser bem planejada. Defina rota, horário de saída e de volta, quem vai e o que levar, e avise um responsável.
2. Calma: caminhada não é corrida. Ande no ritmo do mais lento do grupo e economize energia.
3. Saúde: só vá se estiver bem de saúde. Avise o instrutor sobre alergias, asma, dor ou cansaço.
4. Segurança: leve kit de primeiros socorros e apito. Ninguém se afasta do grupo.
5. Vestimenta: roupa leve e adequada ao clima, calçado fechado e já usado, boné e capa de chuva.
6. Obediência: siga o instrutor e as regras de segurança, mantendo a fila.
7. Limpeza: leve saco plástico para o lixo e traga tudo de volta.
8. Comida leve: leve lanche prático e leve (frutas, castanhas, pão), fácil de carregar e que não estraga.
9. Água: leve sempre água suficiente e beba aos poucos; não beba água de origem desconhecida.
10. Informar-se: conheça antes o percurso, a previsão do tempo e os pontos de apoio.

O QUE FAZER QUANDO ESTIVER PERDIDO (PASOCOLA, 8 passos):
P - Parar: pare de andar. Andar sem rumo cansa e piora a situação.
A - Acalmar-se: respire fundo; o pânico é o pior inimigo de quem está perdido.
S - Sentar-se: descanse e relaxe.
O - Orar: peça a ajuda de Deus e acalme o coração.
C - Comer: coma algo leve e beba água para recuperar energia e pensar melhor.
O - Orientar-se: procure pontos de referência (morro, rio, torre, estrada).
L - Lembrar-se: reconstrua mentalmente o caminho que fez.
A - Andar: só volte a andar se tiver certeza do rumo; marque o caminho (estacas, galhos, sinais de pista) para poder voltar. Se não tiver certeza, fique parado e use o apito (3 apitos = socorro).

Passo a passo:
1. Leia as 10 regras abaixo, uma por vez, explicando o porquê de cada uma (o conteúdo já está pronto acima).
2. Ensine o PASOCOLA: as 8 letras do que fazer quando perdido.
3. Faça o teste: dê um cenário ('você se perdeu na trilha, o que faz primeiro?') e deixe o grupo responder.
4. Peça a cada desbravador que repita 2 regras sem olhar.

Erros comuns: achar que 'andar mais um pouco' resolve; gritar sem parar em vez de usar o apito (cansa e não se ouve longe).

Como avaliar: o desbravador recita pelo menos 5 das 10 regras e explica por que ficar parado é importante.

Fontes:
https://mda.wiki.br/cartao_de_amigo/
https://desbrava7.com/2019/05/classe-de-amigo-respondida.html
https://desbrava7.com/2018/03/especialidade-de-acampamento-1-respondida.html$$ where id = 2;
update public.requisitos set guia_instrutor = $$Material e preparo: Lenha seca de vários tamanhos (isca, gravetos de lápis, gravetos de dedo, lenha grossa), fósforos, balde de água e pá por unidade, área de fogueira limpa.
Tempo sugerido: 20 a 30 min.

O que falar: "Toda fogueira segue a mesma ordem: isca, graveto fino, graveto grosso, lenha. Fogo bem-feito é fogo seguro."

Conteúdo pronto:
Regras de segurança da fogueira (8 pontos):
- Apagar totalmente a fogueira antes de dormir e sempre que sair.
- Manter a fogueira a mais de 5 m das barracas.
- Nunca usar vela ou lampião dentro da barraca.
- Guardar fósforos e isqueiros em lugar seguro, longe das crianças pequenas.
- Limpar a vegetação ao redor (círculo de terra limpa).
- Ter água e terra (ou areia) por perto para controlar o fogo.
- Nunca deixar o fogo sem vigia.
- Não usar gasolina, álcool ou outro líquido inflamável para acender.
Tipos de fogueira mais usados: pirâmide, cabana (tenda), estrela, caçador e refletor (cada um com um uso).

Passo a passo:
1. Limpe um círculo de 2 m no chão, sem folhas nem mato seco, e deixe o balde de água por perto.
2. Separe o material em 4 montinhos: isca (folha seca, casca fina, palha), gravetos finos, gravetos médios e lenha.
3. Monte a fogueira escolhida: pirâmide (varas apoiadas em pirâmide sobre a isca) ou cabana (lenha em formato de casinha com a isca dentro).
4. Deixe uma abertura para o ar entrar e acenda pelo lado contrário ao vento.
5. Vá acrescentando gravetos finos, depois médios, depois lenha, sem abafar as chamas.
6. No fim, apague com água, mexa as cinzas e confira com as costas da mão se esfriou.

Erros comuns: usar lenha grossa logo de início; deixar a isca úmida; empilhar sem espaço para o ar.

Segurança: sempre com um adulto por perto; nunca deixar fogueira sem vigia; ninguém joga líquido inflamável.

Como avaliar: o desbravador monta a estrutura sozinho, na ordem certa, e sabe apagar corretamente.

Fontes:
https://desbrava7.com/2018/03/especialidade-de-acampamento-1-respondida.html
https://mda.wiki.br/cartao_de_amigo/$$ where id = 3;
update public.requisitos set guia_instrutor = $$Material e preparo: 1 corda de 1,5 m por desbravador (sisal ou náilon), cartão com a lista dos nós do Amigo impresso.
Tempo sugerido: 20 a 30 min.

O que falar: "Nó é como uma ferramenta: cada um serve para uma coisa. Hoje é revisão: vou ver quem já domina."

Conteúdo pronto:
Como cuidar de uma corda: guarde seca e enrolada (em laçadas), longe de sol forte e de produtos químicos; não pise nem arraste no chão; confira desgaste e pontas desfiadas; queime ou amarre as pontas para não desfiar.
Os 14 nós do cartão do Amigo (e para que servem):
- Simples: nó básico que impede a corda de escapar; base de outros nós.
- Direito: emenda duas cordas de mesma grossura; também serve para enfaixar.
- Cirurgião: parecido com o direito, com uma volta a mais; não escorrega (usado em curativos e talas).
- Lais de guia: laço fixo que não corre nem aperta; usado em resgate e para amarrar em um ponto firme.
- Lais de guia duplo: dois laços fixos; serve para apoiar uma pessoa em resgate.
- Escota: une cordas de grossuras diferentes.
- Catau: encurta a corda sem cortar.
- Pescador: une cordas finas ou escorregadias (linhas de pesca).
- Fateixa: prende a corda a uma argola, estaca ou âncora.
- Volta do fiel: prende a corda em um poste, tronco ou vara; base das amarras.
- Cego, Nó de gancho, Volta da ribeira e Ordinário: veja o uso prático no manual do Amigo (MDAWiki) e peça ao desbravador que explique para que serve cada um.

Passo a passo:
1. Use a lista dos 14 nós acima e chame de 3 a 4 por vez.
2. Peça que cada um faça o nó na própria corda enquanto você observa. Não faça por ele.
3. Se errar, mostre o nó devagar, 1 vez, e deixe repetir sozinho.
4. Pergunte pra que serve cada nó (ex.: 'nó direito serve para emendar cordas de mesma grossura').
5. Marque em uma lista quem fez todos e quem precisa treinar mais.

Erros comuns: confundir nó direito com nó de vovó (dá a 2ª laçada para o lado errado); nó solto que desfaz ao puxar.

Como avaliar: o desbravador faz os 14 nós corretamente e diz pra que servem os principais. Os nós são treinados antes do acampamento, aqui é só conferir.

Fontes:
https://mda.wiki.br/cartao_de_amigo/
https://desbrava7.com/2019/05/classe-de-amigo-respondida.html$$ where id = 4;
update public.requisitos set guia_instrutor = $$Material e preparo: Cartão com os 10 sinais de pista impresso, gravetos, pedras, giz ou carvão, folhas.
Tempo sugerido: 20 min (junto com o percurso de azimutes).

O que falar: "Pista é um jeito de deixar mensagens no chão para quem vem atrás de você, sem usar palavra nenhuma."

Conteúdo pronto:
Os 10 sinais de pista (significado e como montar com material natural):
1. Siga em frente: seta de gravetos (um graveto comprido com 2 menores na ponta).
2. Vire à direita: seta apontando para a direita.
3. Vire à esquerda: seta apontando para a esquerda.
4. Caminho errado: X de 2 gravetos cruzados.
5. Perigo ou obstáculo: 3 gravetos ou pedras em linha atravessando o caminho.
6. Água potável: tufo de capim em pé perto do sinal (combinar antes).
7. Água não potável: o mesmo sinal com um X ao lado.
8. Carta escondida: quadrado de pedrinhas com uma seta (indica local e distância).
9. Acampamento: seta grande com o número de passos até o destino.
10. Fim da pista: círculo de pedras com um ponto no meio.
Regras da pista:
- Coloque cada sinal do lado direito da trilha, à altura dos olhos ou bem no chão, num ponto de passagem óbvio; altura máxima de 1 m.
- Espaçamento sugerido: 2 m em terreno difícil, 5 m em terreno de pedras, 20 m em mata e 30 m em campo aberto. Marque sempre cruzamentos e bifurcações.
- Use só material natural solto (gravetos caídos, pedras, folhas, capim). Nunca arranque planta viva nem use tinta, spray ou fita.
- Na volta, desfaça todos os sinais e devolva os materiais ao chão.

Passo a passo:
1. Mostre os 10 sinais do cartão do Amigo (ex.: seta de gravetos, pedras empilhadas para 'direção certa', X de gravetos para 'caminho errado').
2. Faça o exemplo: monte 3 sinais no chão e peça que o grupo diga o que cada um quer dizer.
3. Divida em duplas: uma dupla monta uma pista curta com 5 a 10 sinais; a outra decifra.
4. Troquem os papéis.

Erros comuns: usar material vivo (galhos verdes, flores); deixar a pista sem limpar depois.

Segurança: recolher tudo no final e deixar a natureza como estava.

Como avaliar: o desbravador reconhece e monta pelo menos 8 dos 10 sinais.

Fontes:
https://desbravai.com.br/desbravadores/habilidades/sinais-de-pista/
https://desbrava7.com/2022/10/sinais-de-pista.html
https://mda.wiki.br/cartao_de_amigo/$$ where id = 5;
update public.requisitos set guia_instrutor = $$Material e preparo: Cartão da especialidade Arte de Acampar impresso, caneta, prancheta.
Tempo sugerido: 10 min por desbravador (pode ser feito em conjunto no fim do acampamento).

O que falar: "Arte de Acampar é saber deixar o acampamento organizado e confortável. Vamos ver o que você já fez aqui."

Conteúdo pronto:
Lema do campista: 'Não levar nada além de fotos, não deixar nada além de pegadas, não matar nada além do tempo'.
Higiene do acampamento: usar corretamente as instalações (ou cavar fossa adequada), usar só água potável, lavar as mãos antes de comer, guardar a comida para não atrair bichos e destinar corretamente o lixo.
Ao revisar o cartão da especialidade, confira com o desbravador se cada item foi praticado.

Passo a passo:
1. Abra o cartão da especialidade e leia cada item.
2. Marque o que foi cumprido no acampamento (escolher local, montar barraca, organizar a área, deixar o local limpo).
3. Anote o que ainda falta e combine quando será feito (em reunião ou em outra saída).
4. Assine somente os itens realmente cumpridos.

Erros comuns: assinar item que só foi explicado e não praticado.

Como avaliar: conferência do cartão da especialidade. Neste acampamento cobre parte dela, não necessariamente tudo.

Fontes:
https://desbrava7.com/2018/03/especialidade-de-acampamento-1-respondida.html
https://desbrava7.com/2018/03/especialidade-de-arte-de-acampar-respondida.html$$ where id = 6;
update public.requisitos set guia_instrutor = $$Material e preparo: 1 caixa de fósforos (só 1 fósforo por tentativa), isca bem seca guardada em saco plástico, gravetos finos, lenha, balde de água.
Tempo sugerido: 15 a 20 min.

O que falar: "Agora o desafio: acender a fogueira com UM fósforo. Quem prepara bem, acende fácil."

Conteúdo pronto:
Materiais naturais para isca (o que pega fogo fácil): capim seco, folhas secas bem esfareladas, casca seca fina de árvore, fiapos de palha ou de fibra de coco.
Gravetos: 'de lápis' (finos), 'de dedo' (médios) e 'de pulso' (grossos). Todos secos, que quebram com estalo.
Regra de ouro: monte tudo antes de riscar o fósforo. Quem prepara bem acende com 1 fósforo.
Atenção: o requisito é 'começar uma fogueira com apenas um fósforo, usando materiais naturais, e mantê-la acesa'. Confira se ela continuou acesa depois de acender.

Passo a passo:
1. Explique que 80% do sucesso está na preparação: isca bem seca e protegida do vento.
2. Cada um monta a sua fogueira (cabana ou pirâmide) com a isca embaixo e bastante gravetos finos.
3. Confira a montagem ANTES de acender e corrija: tem espaço para o ar? A isca está no centro?
4. Entregue 1 fósforo. Proteja a chama com as mãos ao acender e encoste na isca pelo lado de onde vem o vento.
5. Deixe cada um tentar. Se errar, ele remonta e tenta de novo com outro fósforo.

Erros comuns: isca úmida; mexer na fogueira depois de acender (abafa); fósforo riscado com pressa e quebrado.

Segurança: adulto junto; cabelos presos; balde por perto.

Como avaliar: o desbravador acende com 1 fósforo. Registre quantas tentativas foram necessárias.

Fontes:
https://mda.wiki.br/cartao_de_amigo/$$ where id = 7;
update public.requisitos set guia_instrutor = $$Material e preparo: Caderno e lápis por unidade, lupa, guia de campo impresso ou celular para pesquisar depois. Não coletar nada vivo.
Tempo sugerido: Durante toda a caminhada de sábado, com paradas de 5 min.

O que falar: "Vamos observar a natureza sem machucar nada. Quem observa bem descobre um mundo inteiro."

Passo a passo:
1. Na trilha, faça paradas combinadas a cada 15 a 20 min.
2. Peça a um desbravador diferente que aponte uma flor ou um inseto. Ele diz o nome ou descreve (cor, tamanho, onde estava).
3. Cada um anota no caderno: nome (ou descrição), local e uma característica.
4. Se não souberem o nome, desenhem e pesquisem depois; anote 'a identificar'.
5. No fim, conte quantas flores e insetos cada um já registrou.

Erros comuns: colher flores ou matar insetos; chegar perto demais de abelhas e vespas.

Segurança: quem tiver alergia a picada avisa antes; nunca tocar em lagartas ou aranhas.

Como avaliar: o desbravador identifica 10 flores e 10 insetos ao longo do dia (não precisa ser tudo de uma vez).$$ where id = 8;
update public.requisitos set guia_instrutor = $$Material e preparo: Faca, facão e machadinha em bom estado, luvas, toco para cortar, varas de madeira, área livre. Só o instrutor entrega a ferramenta.
Tempo sugerido: 45 min, em 2 grupos que trocam a cada 20 min.

O que falar: "Antes de cortar qualquer coisa, vamos falar de segurança. Isso é o mais importante hoje. Ferramenta é séria."

Conteúdo pronto:
As 10 regras de segurança com faca, facão e machadinha:
1. Ferramenta não é brinquedo: nunca brincar com ela.
2. Mantenha sempre afiada, limpa e seca, guardada na bainha.
3. Mantenha pelo menos 3 metros de distância dos outros.
4. Corte sempre para longe do corpo.
5. Use cortes em diagonal, nunca em ângulo reto.
6. Corte sobre uma base firme (toco), nunca apoiando a peça no joelho ou na mão.
7. Nunca use o cabo como martelo.
8. Nunca corra com a ferramenta fora da bainha.
9. Ao passar para alguém, entregue pelo cabo, com a lâmina para você.
10. Guarde corretamente ao terminar.

Passo a passo:
1. Explique as 10 regras de segurança: distância de segurança de pelo menos 3 metros dos outros, corte sempre para longe do corpo, entregar pelo cabo, guardar na bainha, nunca correr com a ferramenta.
2. Demonstre você mesmo o corte correto, devagar, primeiro.
3. Chame 1 desbravador por vez. Ele repete os passos enquanto você olha só para ele.
4. Só passe para o próximo quando o anterior devolver a ferramenta na bainha.

Erros comuns: cortar em direção às pernas; segurar a peça com a outra mão perto da lâmina; distração com colegas em volta.

Segurança: máximo de 5 a 6 desbravadores por adulto; luva obrigatória; ninguém entra no círculo de segurança de quem está cortando.

Como avaliar: o desbravador usa a ferramenta corretamente e sabe repetir as regras de segurança.

Fontes:
https://desbrava7.com/2018/03/especialidade-de-acampamento-1-respondida.html
https://mda.wiki.br/cartao_de_amigo/$$ where id = 9;
update public.requisitos set guia_instrutor = $$Material e preparo: 1 panela e fogareiro (ou fogueira), garrafa PET transparente, água turva para mostrar o efeito do filtro, água sanitária pura (sem perfume) e conta-gotas.
Tempo sugerido: Faz parte dos 40 min de Purificação de água (segunda 08:30).

O que falar: "Na mata, nem toda água que parece limpa é segura para beber. Vamos aprender como tornar a água segura."

Conteúdo pronto:
Métodos para purificar água:
- Ferver: em fervura forte por 1 minuto (3 minutos acima de 2.000 m). Deixe esfriar tampada.
- Filtro: pano limpo (e/ou carvão e areia) tira a sujeira; depois ferver para garantir a limpeza.
- Hipoclorito de sódio (água sanitária pura): 2 gotas por litro e aguardar 30 minutos.
- SODIS: garrafa PET transparente cheia, exposta ao sol por 6 horas.
PARÁGRAFO ESPIRITUAL (também exigido no requisito): escreva um parágrafo sobre o significado de Jesus como a água da vida. Textos para ler: João 4:10-14 (a mulher samaritana) e João 7:37-38. Ideia: assim como o corpo precisa de água limpa para viver, a alma precisa de Jesus, que sacia a sede de forma completa.

Passo a passo:
1. Mostre a água de aparência suja e a limpa: as duas podem ter microrganismos.
2. Escolha 1 método para o requisito do Amigo. O mais simples é ferver: leve a água até ferver forte e conte 1 minuto (3 minutos se estiver acima de 2.000 m).
3. Deixe esfriar tampada e explique: o calor mata os microrganismos.
4. Pergunte: 'por que só filtrar não basta?' (o filtro tira sujeira, mas não elimina tudo).

Erros comuns: beber água sem esperar esfriar; achar que água clara já é segura.

Segurança: cuidado com água fervente: só o adulto retira a panela do fogo.

Como avaliar: o desbravador explica com as próprias palavras como e por que aquele método funciona.

Fontes:
https://mda.wiki.br/cartao_de_amigo/
https://desbrava7.com/2019/05/classe-de-amigo-respondida.html
https://mda.wiki.br/Especialidade_de_Vida_Silvestre$$ where id = 10;
update public.requisitos set guia_instrutor = $$Material e preparo: Sexta à noite: lanterna com feixe forte para apontar o céu. Segunda de manhã: 1 graveto reto (1 m) e pedras, papel e lápis de cor.
Tempo sugerido: 15 min na sexta + 40 min na segunda.

O que falar: "Dá para descobrir onde fica o Norte sem bússola nenhuma, só olhando para o céu ou para o sol."

Conteúdo pronto:
Como achar os pontos cardeais sem bússola:
1) Pelo sol: de manhã cedo o sol nasce no Leste. Fique com o braço direito apontando para onde o sol nasce (Leste): à sua frente fica o Norte, à esquerda o Oeste, atrás o Sul. À tarde o sol se põe no Oeste (faça ao contrário).
2) Pelo Cruzeiro do Sul (à noite): prolongue o braço maior da cruz cerca de 4 vezes e meia e desça uma linha até o horizonte: ali é o Sul.
3) Pela sombra do graveto (dia de sol): a 1ª marca é Oeste e a 2ª (15 min depois) é Leste.
Rosa dos ventos com 8 pontos: N (Norte), NE (Nordeste), L (Leste), SE (Sudeste), S (Sul), SO (Sudoeste), O (Oeste), NO (Noroeste).

Passo a passo:
1. SEXTA (Cruzeiro do Sul): encontre a constelação em formato de cruz. Prolongue o braço maior da cruz por cerca de 4 vezes e meia o comprimento dela.
2. Desça uma linha imaginária na vertical desse ponto até o horizonte: ali é o Sul. De frente para o Sul, o Norte fica às suas costas.
3. SEGUNDA (sombra do graveto): finque o graveto reto no chão, num lugar de sol. Marque a ponta da sombra com uma pedra.
4. Espere 15 minutos e marque a nova ponta da sombra. A 1ª marca é Oeste, a 2ª é Leste.
5. Fique com o pé esquerdo na 1ª marca e o direito na 2ª: você está olhando para o Norte.
6. Cada um desenha a rosa dos ventos com os 8 pontos (N, NE, L, SE, S, SO, O, NO).

Erros comuns: graveto torto; esperar menos de 15 min; confundir Leste com Oeste.

Como avaliar: o desbravador acha os 4 pontos cardeais sem ajuda e desenha a rosa dos ventos correta.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Companheiro
https://desbrava7.com/2019/06/classe-companheiro-respondida.html$$ where id = 11;
update public.requisitos set guia_instrutor = $$Material e preparo: 1 corda de 1,5 m por desbravador, cartão com os nós do Companheiro impresso.
Tempo sugerido: 20 min.

O que falar: "Vamos revisar os nós do nível Companheiro. Quem já treinou vai tirar de letra."

Conteúdo pronto:
Os 9 nós do cartão do Companheiro:
Oito, Volta do salteador, Duplo, Caminhoneiro, Direito, Volta do fiel, Escota, Lais de guia e Simples.
Usos que você pode ensinar: Oito (impede a corda de escapar de uma roldana ou furo); Volta do salteador (prende a corda e solta rápido, puxando a ponta); Caminhoneiro (estica bem uma corda, como um varal ou lona); Direito (emenda cordas iguais); Volta do fiel (prende em poste); Escota (une cordas de grossuras diferentes); Lais de guia (laço fixo); Simples (base). Para o Duplo, confira o uso no manual do Companheiro (MDAWiki).

Passo a passo:
1. Use a lista dos 9 nós acima.
2. Chame de 3 em 3: cada um faz o nó na própria corda enquanto você observa.
3. Corrija errando o mínimo: mostre o nó 1 vez, devagar, e deixe repetir sozinho.
4. Pergunte pra que serve cada nó e em qual situação usaria.

Erros comuns: fazer o nó por ele; aceitar nó que desfaz quando puxa.

Como avaliar: o desbravador faz os 9 nós corretamente.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Companheiro$$ where id = 12;
update public.requisitos set guia_instrutor = $$Material e preparo: Cartão da especialidade Acampamento II impresso, caneta.
Tempo sugerido: 10 min por desbravador (pode ser em conjunto).

O que falar: "Vamos ver o que você já fez da especialidade de Acampamento II durante o fim de semana."

Passo a passo:
1. Abra o cartão e leia cada item em voz alta.
2. Marque o que foi cumprido (montagem, organização, inspeção, desmontagem).
3. Anote o que falta para completar depois em reunião ou outra saída.
4. Assine só os itens praticados de fato.

Erros comuns: assinar item apenas 'explicado'.

Como avaliar: conferência do cartão. Cobre parte da especialidade, não necessariamente tudo.$$ where id = 13;
update public.requisitos set guia_instrutor = $$Material e preparo: Caderno e caneta para cada desbravador (ou folha para o relatório).
Tempo sugerido: 5 min falando no culto + relatório escrito depois do acampamento.

O que falar: "Guarde na cabeça (ou no caderninho) o que mais marcou você aqui, porque isso vira o seu relatório."

Conteúdo pronto:
Modelo de relatório (1 página):
1) Título e data do acampamento.
2) O que fizemos (lista das atividades).
3) O que mais me impressionou positivamente (o principal do requisito).
4) O que aprendi.
5) O que eu faria diferente.
O cartão do Companheiro pede: 'participar de um acampamento de final de semana e fazer um relatório destacando o que mais lhe impressionou positivamente'.

Passo a passo:
1. No culto de domingo à noite, peça a cada unidade que fale o que mais impressionou.
2. Explique como o relatório deve ficar: 1 página com o que fizeram, o que aprenderam e o que mais gostaram.
3. Combine o prazo de entrega (ex.: na primeira reunião depois do acampamento).
4. Guarde os relatórios na pasta do desbravador.

Erros comuns: deixar para escrever semanas depois (esquece os detalhes).

Como avaliar: relatório escrito entregue depois do acampamento.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Companheiro$$ where id = 14;
update public.requisitos set guia_instrutor = $$Material e preparo: Panelas, lenha para brasas, luvas de couro, pegadores, ingredientes da unidade, balde de água.
Tempo sugerido: 60 a 75 min (almoço de domingo).

O que falar: "Cozinhar na fogueira é diferente de cozinhar em casa: o fogo não é constante. O segredo são as brasas."

Passo a passo:
1. Ajude a unidade a acender a fogueira uns 40 min antes de cozinhar, para formar brasas.
2. Mostre como espalhar as brasas e apoiar a panela sobre elas (ou sobre 2 toras), sem chama alta embaixo.
3. Deixe a unidade dividir tarefas: fogo, corte, tempero, panela e limpeza.
4. Acompanhe sem fazer por eles: só intervenha em segurança.
5. Na hora de servir, lavem as mãos e sirvam com concha e prato limpo.
6. Ao final, apaguem o fogo com água e lavem as panelas.

Erros comuns: cozinhar em chama alta (queima por fora e crua por dentro); esquecer de separar lixo.

Segurança: só quem usa luva mexe em panela quente; crianças menores longe do fogo.

Como avaliar: a unidade cozinha e serve a refeição sem depender do conselheiro para tudo.$$ where id = 15;
update public.requisitos set guia_instrutor = $$Material e preparo: 1 tábua ou papelão grosso por unidade, cordas de vários tipos, cola quente e pistola, etiquetas e caneta, cartaz com o nome dos nós.
Tempo sugerido: 40 min (segunda 09:50).

O que falar: "Esse quadro vai ficar exposto na sala do clube, então capriche. Cada nó vai ter o seu nome."

Passo a passo:
1. Distribua o material para cada unidade e mostre um exemplo pronto, se possível.
2. Cada unidade escolhe 15 nós diferentes (os do Amigo e os do Companheiro servem).
3. Faça o nó, fixe na tábua com cola quente ou prego e escreva a etiqueta com o nome.
4. Organizem em linhas, do mais fácil para o mais difícil.
5. Confira no final: 15 nós, todos identificados e firmes.

Erros comuns: colar nó desfeito; etiqueta com nome errado; repetir o mesmo nó.

Segurança: cola quente queima: adulto opera a pistola.

Como avaliar: quadro pronto com 15 nós corretos e identificados.$$ where id = 16;
update public.requisitos set guia_instrutor = $$Material e preparo: Caderno de campo de cada unidade (anotações da caminhada), fogueira do conselho.
Tempo sugerido: 10 min no Fogo do conselho + relatório de 1 página depois.

O que falar: "Cada unidade vai contar ao clube o que anotou durante a caminhada de hoje."

Passo a passo:
1. Durante a caminhada, lembre cada unidade de anotar no caderno: o que viu, ouviu e aprendeu.
2. No Fogo do conselho, chame cada unidade para contar uma descoberta (2 a 3 min).
3. Diga que depois cada desbravador entrega um relatório de 1 página.
4. Recolha os cadernos para conferir o que anotaram.

Erros comuns: só um da unidade falar; relato sem ligação com a caminhada.

Como avaliar: relato oral no conselho e relatório de 1 página entregue depois.$$ where id = 17;
update public.requisitos set guia_instrutor = $$Material e preparo: Cartaz e caneta para escrever os 6 segredos.
Tempo sugerido: 10 a 15 min (na Roda sob as estrelas).

O que falar: "Todo bom campista conhece 6 segredos. Vamos descobrir juntos."

Conteúdo pronto:
Os 6 segredos para um bom acampamento:
1. Verificar a previsão do tempo antes de ir.
2. Escolher bem o local da barraca (plano, seguro, longe de rio e de árvore com galho seco).
3. Escolher o tamanho certo da barraca para o número de pessoas.
4. Verificar os galhos das árvores em cima do local (podem cair com o vento).
5. Saber usar o fogo: cozinhar, se aquecer, afastar insetos e animais.
6. Cuidar da alimentação e ter água potável durante todo o acampamento.
(O cartão do Pesquisador pede apresentar 6 segredos. Se o clube preferir outra lista, valem os 6 segredos do manual usado pelo clube.)

Passo a passo:
1. Puxe a conversa: 'o que um bom campista precisa saber?'.
2. Cada unidade fala 1 segredo. Vá completando até 6 e anote no cartaz.
3. Se o grupo não lembrar, complete com os 6 segredos acima.
4. Releia todos em voz alta e peça que repitam sem olhar.

Erros comuns: aceitar resposta vaga; não conferir com o cartão.

Como avaliar: o desbravador cita os 6 segredos sem olhar.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Pesquisador
https://desbrava7.com/2019/07/classe-de-pesquisador-respondida-parte-4.html$$ where id = 18;
update public.requisitos set guia_instrutor = $$Material e preparo: Cartão da especialidade Acampamento III impresso, caneta.
Tempo sugerido: 10 min por desbravador (pode ser em conjunto).

O que falar: "Vamos ver o que você já fez da especialidade de Acampamento III durante o fim de semana."

Passo a passo:
1. Abra o cartão e leia cada item em voz alta.
2. Marque o que foi cumprido (montagem, organização, inspeção, desmontagem).
3. Anote o que falta para completar em outra oportunidade.
4. Assine só o que foi praticado.

Erros comuns: assinar item apenas 'explicado'.

Como avaliar: conferência do cartão. Cobre parte da especialidade.$$ where id = 19;
update public.requisitos set guia_instrutor = $$Material e preparo: Kit de primeiros socorros (gaze, atadura, esparadrapo, tesoura, luvas), 2 talas improvisadas (galhos retos), pano ou camiseta, boneco ou almofada. Cartaz com telefones 192 (SAMU) e 193 (Bombeiros).
Tempo sugerido: 50 min (domingo 14:00).

O que falar: "Hoje vamos aprender o básico para agir bem nos primeiros minutos de uma emergência, sem precisar ser médico. O mais importante é não piorar a situação e chamar ajuda."

Conteúdo pronto:
Conteúdo básico de primeiros socorros:
- O que é: cuidados imediatos a uma vítima de acidente ou mal súbito antes da chegada do atendimento especializado. Objetivos: preservar a vida, evitar que piore, dar conforto e facilitar o atendimento.
- Hemorragia externa: pressão direta com gaze ou pano limpo; elevar o membro se não houver suspeita de fratura; não retirar o primeiro curativo (se encharcar, coloque outro por cima); manter a vítima aquecida e em repouso; nunca retirar objeto cravado, apenas estabilizar.
- Queimadura de 1º grau (só vermelhidão): água corrente fria por cerca de 20 min; sem gelo, manteiga ou pasta de dente.
- Queimadura de 2º grau (bolhas): água corrente fria; não estourar bolhas; cobrir com gaze limpa e seca; procurar ajuda se for extensa.
- Queimadura de 3º grau (pele branca ou carbonizada): ligar 192/193; não retirar roupa grudada; cobrir com pano limpo e seco; manter a vítima aquecida.
- Envenenamento: afastar a vítima da fonte; ligar para emergência ou centro toxicológico; não provocar vômito sem orientação profissional; lavar pele ou olhos com água se houve contato.
- Engasgo com vítima consciente (manobra de Heimlich): por trás, punho acima do umbigo e abaixo do esterno, compressões para dentro e para cima até expelir. Só demonstre em boneco, sem apertar colega.
Observação: a especialidade completa é maior (choque, queimadura química, monóxido de carbono, traumatismo craniano, eletricidade). Neste acampamento cobrimos parte dela.

Passo a passo:
1. Avalie a cena antes de tudo: 'é seguro chegar?'. Depois chame ajuda: 192 (SAMU) ou 193 (Bombeiros).
2. SANGRAMENTO: coloque gaze ou pano limpo sobre o ferimento e pressione com a mão por 10 minutos, sem levantar para olhar.
3. CURATIVO: depois de estancar, cubra com gaze limpa e prenda com atadura, sem apertar demais.
4. IMOBILIZAÇÃO: coloque 1 tala de cada lado do membro machucado, acolchoe com pano e amarre acima e abaixo do ferimento, nunca em cima. Confira se os dedos continuam com cor e calor normais.
5. QUEIMADURA: água corrente fria por 10 a 20 min; não estourar bolhas nem passar pasta ou manteiga.
6. PICADA DE COBRA: manter a pessoa calma e deitada, imobilizar o membro, NÃO cortar, NÃO sugar, NÃO fazer torniquete; levar a um hospital rápido.
7. RCP: só demonstre no boneco ou na almofada: mãos sobrepostas no centro do peito, 100 a 120 compressões por minuto. Não pratique pressão em colega.
8. Deixe cada um praticar curativo e tala em dupla, com você olhando.

Erros comuns: amarrar a tala em cima do ferimento; apertar demais e cortar a circulação; esquecer de ligar 192.

Segurança: se alguém quiser aprofundar, indique curso com socorrista qualificado. Os líderes aqui ensinam noções básicas, não substituem um profissional.

Como avaliar: o desbravador faz um curativo e uma imobilização corretamente e sabe quando e como pedir ajuda.

Fontes:
https://desbrava7.com/2018/08/especialidade-de-primeiros-socorros-basico-respondida.html
https://mda.wiki.br/Especialidade_de_Primeiros_socorros_-_b%C3%A1sico$$ where id = 20;
update public.requisitos set guia_instrutor = $$Material e preparo: Ingredientes da unidade, panelas, facas de cozinha, tábuas, luvas, fogueira com brasas.
Tempo sugerido: 60 a 75 min.

O que falar: "Vamos cozinhar o almoço de hoje juntos, cada um com uma função. Equipe boa cozinha rápido e sem bagunça."

Conteúdo pronto:
Ideias de cardápio simples e rápido (adaptável a vegetariano): arroz com ovo cozido ou mexido; macarrão com molho de legumes; feijão com arroz e legumes refogados; sopa de legumes.
O cartão do Pesquisador pede planejar e cozinhar 2 refeições no acampamento de fim de semana; neste acampamento a unidade cozinha 1, então a cobertura é parcial.

Passo a passo:
1. Antes, a unidade decide o cardápio e a lista de compras (tarefa 'antes' no site).
2. Divida funções: fogo, corte de legumes, tempero, panela e limpeza.
3. Todos lavam as mãos antes de mexer nos alimentos.
4. Acompanhe do início ao fim, dando dicas de tempo e temperatura.
5. Sirvam juntos e limpem tudo no fim.

Erros comuns: todos querendo fazer a mesma coisa; esquecer de higiene das mãos.

Segurança: faca de cozinha só com supervisão; panela quente só com luva.

Como avaliar: o desbravador participa ativamente do preparo da refeição.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Pesquisador
https://desbrava7.com/2019/07/classe-de-pesquisador-respondida-parte-4.html$$ where id = 21;
update public.requisitos set guia_instrutor = $$Material e preparo: Lista de equipamento impressa (a mesma enviada aos pais), prancheta e caneta.
Tempo sugerido: 3 a 5 min por mochila (na chegada, sexta 19:00).

O que falar: "Antes do acampamento cada um organiza a própria mochila. Vamos conferir o que veio."

Passo a passo:
1. Peça a cada desbravador que abra a mochila e espalhe o conteúdo em um pano.
2. Vá riscando cada item da lista: roupa, calçado, higiene, saco de dormir, lanterna, garrafa, capa de chuva, apito.
3. Anote o que faltou e resolva na hora (empréstimo do clube, quando possível).
4. Ajude a guardar de novo do jeito certo (item 25).

Erros comuns: levar mochila cheia de coisa desnecessária; esquecer agasalho.

Como avaliar: mochila com todos os itens da lista de equipamento pessoal.$$ where id = 22;
update public.requisitos set guia_instrutor = $$Material e preparo: Varas de bambu de 1,5 m (2 por dupla), sisal, cartão com a explicação das amarras.
Tempo sugerido: 45 min (domingo 08:45), junto com nós.

O que falar: "Amarra é diferente de nó: ela junta duas varas, não só uma corda. É a base de toda pioneiria."

Passo a passo:
1. Mostre as 4 amarras do cartão: quadrada, diagonal, paralela e redonda.
2. Regra geral de todas: começa com um nó (volta do fiel), dá voltas firmes e apertadas, faz a 'cintagem' (voltas entre as varas que apertam tudo) e termina com outro nó.
3. Demonstre cada uma devagar e peça que a dupla repita na sequência.
4. Deixe todos testarem puxando: amarra boa não balança.
5. Escolha pelo menos 1 amarra para usar na Grande Pioneiria (móvel da unidade).

Erros comuns: voltas frouxas; esquecer a cintagem; terminar sem nó e a amarra desfaz.

Como avaliar: o desbravador faz as 4 amarras e usa pelo menos 1 na construção do móvel.$$ where id = 23;
update public.requisitos set guia_instrutor = $$Material e preparo: Toras grossas (2 a 4 empilhadas, ~1 m de largura), estacas, fósforos, lenha, balde de água.
Tempo sugerido: 20 a 30 min (na Oficina do Fogo).

O que falar: "O fogo refletor joga o calor para um lado só, ótimo para esquentar sem gastar tanta lenha."

Passo a passo:
1. Escolha o lugar e limpe a área ao redor.
2. Empilhe 3 ou 4 toras verdes ou grossas em forma de parede atrás de onde vai ficar o fogo, com cerca de 1 m de altura; prenda com estacas dos lados.
3. Acenda a fogueira na frente da parede (30 a 50 cm de distância).
4. Mostre o efeito: fique na frente da parede e sinta o calor refletido; depois fique atrás e sinta a diferença.
5. Explique onde usar: dormir ao ar livre ou esquentar uma barraca ou lona.

Erros comuns: parede muito perto do fogo (queima); toras muito finas (não refletem).

Segurança: só adulto acende; ninguém encosta na parede quente.

Como avaliar: o desbravador monta a estrutura e explica como ela funciona.$$ where id = 24;
update public.requisitos set guia_instrutor = $$Material e preparo: Balança ou uma mochila de exemplo bem arrumada, lista de equipamento.
Tempo sugerido: 3 a 5 min por mochila (na chegada).

O que falar: "Arrumar a mochila do jeito certo evita dor nas costas e coisa perdida no meio do mato."

Passo a passo:
1. Regra do peso: coisas pesadas embaixo e perto das costas; leves em cima e nas laterais.
2. Saco de dormir no fundo (ou embaixo); roupas em sacos plásticos; itens que usa mais (capa, água, lanterna) em cima ou em bolsos.
3. Confira o peso: idealmente até 10 a 15% do peso do desbravador.
4. Ajuste alças e cinto: o peso deve ficar nos quadris, não só nos ombros.

Erros comuns: mochila pesada demais; deixar coisa solta pendurada por fora.

Como avaliar: mochila arrumada corretamente na chegada.$$ where id = 25;
update public.requisitos set guia_instrutor = $$Material e preparo: 2 varas retas de ~2 m, 1 cobertor (ou 2 a 3 casacos), 2 talas improvisadas, faixas de pano ou ataduras, 1 desbravador voluntário leve (a 'vítima'), terreno plano e sem obstáculos.
Tempo sugerido: 50 min (domingo 14:55).

O que falar: "Hoje vamos praticar um cenário de resgate: imobilizar e transportar um colega numa maca. É treino, com calma e segurança."

Conteúdo pronto:
Conteúdo do Resgate Básico (o que a especialidade pede saber):
- Formas de chamar um resgate aéreo: S.O.S. feito no chão com pedras ou galhos, fumaça e sinalizador (ou espelho/lanterna).
- Antes de remover uma vítima: garantir a própria segurança, avaliar o local e os perigos, eliminar os perigos se possível, decidir o meio de transporte e avaliar se é melhor esperar o socorro profissional.
- Como ajudar: puxar a vítima, içar (levantar) e ajudar a andar.
- Transporte com ajuda: cadeirinha (2 pessoas), em cobertor, em rede, por 3 ou 4 pessoas ou em maca improvisada.
- Cordas: 3 nós para juntar cordas, 1 nó para diminuir corda (catau), 1 nó para usar ao redor de alguém (lais de guia) e lançar corda leve e pesada de 15 m.
- Situações da especialidade: escolher 3 entre cabo elétrico, fumaça/gás, roupa em chamas, afogamento sem equipamento e acidente no gelo. Esta atividade NÃO cobre isso: cobre a parte de maca, imobilização e transporte.

Passo a passo:
1. Explique que numa emergência de verdade, quem não sabe socorrer NÃO move a vítima: chama 192/193 e espera. O treino é para conhecer a técnica.
2. MACA (cobertor): estenda o cobertor no chão, coloque uma vara no meio e dobre o cobertor sobre ela; coloque a segunda vara a cerca de 30 cm da dobra e dobre o resto. O peso da vítima prende as varas.
3. MACA (casacos): abotoe/feche 2 ou 3 casacos, vire as mangas para dentro e passe as varas pelas mangas.
4. IMOBILIZAÇÃO: a 'vítima' simula machucar a perna: 1 tala de cada lado, acolchoada, amarrada acima e abaixo do ferimento com as faixas.
5. TRANSPORTE: 4 carregadores, 2 por vara. Levantam juntos ao comando 'já!', andam em passo curto (pés na frente) sobre terreno plano.
6. Revezem os papéis para todos passarem por vítima, socorrista e carregador.
7. Comente: o que faria diferente numa trilha de verdade?

Erros comuns: levantar sem combinar (a maca balança); carregar em terreno irregular; amarrar a tala sobre o machucado.

Segurança: vítima leve; carregar só em terreno plano e por poucos metros; supervisão direta o tempo todo; ninguém 'brinca' de cair.

Como avaliar: o grupo monta a maca, imobiliza e transporta com segurança. Essa atividade cobre só parte da especialidade de Resgate Básico.

Fontes:
https://mda.wiki.br/Especialidade_de_Resgate_b%C3%A1sico
https://desbrava7.com/2018/05/especialidade-de-resgate-basico-respondida.html$$ where id = 26;
update public.requisitos set guia_instrutor = $$Material e preparo: Imagens impressas (camadas de rocha, fósseis) ou um fóssil real, Bíblia aberta em Gênesis 6 a 8.
Tempo sugerido: 30 a 35 min (sábado 17:15).

O que falar: "Como o dilúvio bíblico explica as camadas de rocha e os fósseis que encontramos hoje?"

Conteúdo pronto:
Textos para ler: Gênesis 6 a 8 (o dilúvio) e 2 Pedro 3:5-6.
Ideias para explicar: fossilização acontece quando um ser vivo é soterrado rapidamente (por lama ou sedimentos), sem tempo de se decompor. Milhares de fósseis de animais e plantas soterrados juntos apontam para um evento de grande escala. O relato bíblico descreve um evento assim.
Tom da conversa: apresentar como fé e evidência, respeitando as perguntas e dúvidas do grupo.

Passo a passo:
1. Mostre as imagens ou o fóssil e pergunte: 'como isso foi parar aqui?'.
2. Leia trechos de Gênesis 6 a 8 sobre o dilúvio.
3. Explique a fossilização: um ser vivo é soterrado rápido, sem tempo de decompor, e os minerais preenchem o organismo.
4. Conecte: um evento de grande escala explicaria muitas camadas empilhadas com fósseis.
5. Abra para perguntas e respeite as dúvidas do grupo.

Erros comuns: responder com certeza absoluta a tudo; desprezar perguntas.

Como avaliar: o desbravador explica com as próprias palavras a ligação entre o dilúvio e os fósseis.$$ where id = 27;
update public.requisitos set guia_instrutor = $$Material e preparo: Machadinha em bom estado, toco baixo, varas de madeira, luvas, área livre de 3 m.
Tempo sugerido: 45 min (junto com a faca e o facão, domingo 08:45).

O que falar: "A machadinha exige ainda mais cuidado que a faca. Vamos com calma."

Passo a passo:
1. Marque o círculo de segurança: um raio de cerca de 2 m livre de pessoas.
2. Segurar com as duas mãos: uma perto da cabeça e outra no fim do cabo, com o joelho levemente dobrado.
3. Corte a peça apoiada no toco, batendo em ângulo, sempre para longe das pernas.
4. Demonstre 2 cortes primeiro, devagar.
5. Cada desbravador tenta 2 ou 3 cortes com supervisão direta.
6. Ao terminar, guarde com a lâmina coberta.

Erros comuns: cortar com a peça segurada na mão; usar madeira muito grossa; distração.

Segurança: 1 adulto por desbravador cortando; luva; ninguém dentro do círculo.

Como avaliar: o desbravador usa a machadinha com segurança e correção.$$ where id = 28;
update public.requisitos set guia_instrutor = $$Material e preparo: Lenha úmida (ou molhada com um pouco de água), faca ou facão (só o adulto usa), saco plástico para a isca, gravetos, fósforos.
Tempo sugerido: 20 min (na Oficina do Fogo).

O que falar: "Na chuva de verdade a fogueira não pode falhar. Vamos aprender o truque."

Passo a passo:
1. Pegue um galho grosso molhado: por dentro a madeira ainda está seca.
2. O adulto tira a casca e racha a madeira em lascas finas até achar o miolo seco.
3. Faça lascas bem finas, ou 'penas' (lascas que ficam presas na vara, em forma de pena), que pegam fogo fácil.
4. Monte uma base elevada com gravetos (não coloque no chão molhado).
5. Guarde a isca seca num saco plástico até a hora de acender.
6. Acenda e vá acrescentando lascas finas, depois maiores.

Erros comuns: usar lenha molhada por fora; montar no chão molhado; acender sem isca seca.

Segurança: só o adulto usa a faca; fogo sob abrigo, sem árvores por cima.

Como avaliar: o desbravador consegue montar a fogueira e explicar a técnica.$$ where id = 29;
update public.requisitos set guia_instrutor = $$Material e preparo: 1 bússola por dupla, estacas numeradas ou fitas, cartão do percurso (ex.: 40 graus / 20 passos), terreno aberto e seguro. O percurso é montado antes do acampamento.
Tempo sugerido: 40 min (segunda 10:30, junto com a pista).

O que falar: "Um azimute é um ângulo que leva você a um rumo certo, mesmo sem enxergar o destino."

Conteúdo pronto:
O que é azimute: é o ângulo, medido em graus, entre o Norte e a direção que você quer seguir, contado no sentido horário. Referências: 0 ou 360 graus = Norte, 90 = Leste, 180 = Sul, 270 = Oeste.
Regras para o percurso de azimutes: use estacas numeradas e um cartão do percurso (ex.: 40 graus por 20 passos, 160 graus por 15 passos, 280 graus por 25 passos). Cada dupla anda com a bússola na mão.
Lembrete: para a especialidade Mapa e Bússola o percurso completo é maior (no mínimo 10 pontos de controle); aqui praticamos o uso básico da bússola.

Passo a passo:
1. Segure a bússola na altura da cintura, na horizontal.
2. Gire o limbo (a parte com os graus) até o número do azimute ficar alinhado com a linha de fé (a seta de direção).
3. Gire o corpo até a agulha (a ponta que aponta o Norte) ficar dentro da seta de orientação: a seta de direção agora aponta o rumo.
4. Escolha um ponto fixo à frente (árvore, pedra) nessa direção e caminhe até ele.
5. Conte os passos indicados no cartão e pare na estaca.
6. Repita 1 azimute no percurso e volte contando os passos.

Erros comuns: segurar a bússola inclinada; andar com ferro ou celular perto (desvia a agulha); perder a contagem.

Segurança: o percurso é conferido antes; ninguém sai sozinho do percurso.

Como avaliar: o desbravador chega ao ponto marcado seguindo o azimute. Cobre só 1 azimute, não os 3 da especialidade completa.

Fontes:
https://desbrava7.com/2018/05/especialidade-de-mapa-e-bussola-respondida.html
https://mda.wiki.br/Especialidade_de_Mapa_e_b%C3%BAssola$$ where id = 30;
update public.requisitos set guia_instrutor = $$Material e preparo: Varas de bambu, sisal, serrote, luvas, projeto do móvel escolhido pela unidade (desenho a lápis).
Tempo sugerido: 2h30 na Grande Pioneiria (domingo 09:30).

O que falar: "Pioneiria é construir coisas úteis de acampamento com bambu, corda e nó, sem prego. Cada amarra conta."

Passo a passo:
1. Cada unidade desenha o móvel (mesa, porta-panelas, cozinha elevada, sapateira, lavatório ou varal) antes de começar.
2. Separe as varas por tamanho e corte o que precisar (só o adulto usa o serrote).
3. Monte a estrutura básica primeiro (pernas e travessas) com amarras firmes.
4. Acrescente o tampo ou os apoios.
5. Teste: sente, apoie peso ou balance para ver se aguenta.
6. Se sobrar tempo, ajude no portal do clube.

Erros comuns: amarra frouxa; móvel torto; deixar sem reforço diagonal.

Segurança: serrote só com adulto; luva ao carregar bambu (farpas).

Como avaliar: móvel construído e funcional, que aguenta o uso.$$ where id = 31;
update public.requisitos set guia_instrutor = $$Material e preparo: Caderno de campo, lupa, garrafas PET, panela, água sanitária pura (sem perfume), guia de campo.
Tempo sugerido: Parte na caminhada de sábado e parte em Purificação de água (segunda 08:30).

O que falar: "Vamos aprender a observar a natureza sem interferir nela e a tornar a água segura para beber."

Conteúdo pronto:
Vida Silvestre pede (resumo do MDAWiki): saber o que fazer quando perdido (8 procedimentos, veja PASOCOLA no requisito das 10 regras), conhecer 3 métodos de achar pontos cardeais sem bússola, explicar como encontrar água na mata e demonstrar 3 maneiras de purificar água para beber, entre outros itens.
Neste acampamento cobrimos só uma parte: observação na caminhada, pontos cardeais e purificação de água.

Passo a passo:
1. Na caminhada de sábado, faça paradas e peça que identifiquem flora e fauna, sem coletar.
2. Na segunda, demonstre 2 ou 3 formas de purificar água: ferver por 1 min; filtro de garrafa PET (pano, carvão, areia fina, areia grossa/cascalho, de cima para baixo na garrafa cortada); hipoclorito (2 gotas por litro, esperar 30 min); SODIS (garrafa PET transparente ao sol por 6 h).
3. Deixe cada desbravador demonstrar 1 método para outro colega.
4. Reforce: filtrar NÃO elimina microrganismos; sempre ferver ou tratar depois.

Erros comuns: usar água sanitária com perfume; expor a garrafa ao sol sem estar transparente; beber sem tratar depois do filtro.

Segurança: água fervendo só com adulto.

Como avaliar: o desbravador identifica elementos da natureza e demonstra pelo menos 2 métodos de purificar água. É cobertura parcial da especialidade.

Fontes:
https://mda.wiki.br/Especialidade_de_Vida_Silvestre$$ where id = 32;
update public.requisitos set guia_instrutor = $$Material e preparo: Espaço plano e livre, apito, ordem de formação (por unidade).
Tempo sugerido: 30 min de treino (domingo 06:45) + 30 min de apresentação (segunda 08:00).

O que falar: "Ordem Unida é disciplina em grupo: todo mundo no mesmo tempo, no mesmo passo. É respeito e atenção."

Conteúdo pronto:
Movimentos a pé firme: Atenção, Sentido, Cobrir, Firme, Perfilar, Volver (direita, esquerda e meia-volta), Olhar (direita, frente, esquerda) e Descansar.
Movimentos em deslocamento (passo ordinário): marchar para frente e parar, marcar passo, mudar de direção, executar voltas na marcha e trocar de passo.
Voz de comando: tem 3 partes: preventiva (avisa o movimento, ex.: 'À direita'), pausa e executiva (manda executar, ex.: 'VOLVER!').
Lembrete: a especialidade completa pede também definir 15 termos técnicos, explicar objetivos da ordem unida e manejo da bandeira; aqui treinamos os movimentos.

Passo a passo:
1. Forme o clube em fileiras por unidade.
2. Treine 1 comando por vez: 'Sentido!' (corpo firme), 'Descansar!', 'À direita, volver!', 'À esquerda, volver!', 'Meia-volta, volver!'.
3. Treine marcha no lugar e em deslocamento, sempre com voz de comando clara.
4. Repita a sequência até ficar sincronizada.
5. Segunda: apresente a formatura completa a pais e liderança.

Erros comuns: comandos sem clareza; grupo desatento; apressar sem sincronizar.

Como avaliar: apresentação coordenada do grupo na formatura.

Fontes:
https://mda.wiki.br/Especialidade_de_Ordem_unida$$ where id = 33;
update public.requisitos set guia_instrutor = $$Material e preparo: Bambus grandes (2 postes de 2,5 m e 1 travessa de 2 m), sisal, cordas de vento, estacas, serrote, luvas.
Tempo sugerido: Parte da Grande Pioneiria (domingo 09:30 a 12:00), continuando até a hora possível.

O que falar: "Cada unidade faz um móvel; juntos fazemos o portal do clube. É a nossa entrada oficial."

Passo a passo:
1. Cada unidade termina o seu móvel (veja o guia da Pioneiria).
2. Para o portal: enterre 2 postes bem fundos, de cada lado, a cerca de 2 m de distância.
3. Levante a travessa e amarre nos postes, no alto, com amarras firmes.
4. Reforce com cordas de vento presas nas estacas para o portal não cair.
5. Decore com o nome e o símbolo do clube.

Erros comuns: postes pouco enterrados; amarra da travessa frouxa; sem cordas de vento.

Segurança: todo mundo longe enquanto se levanta o portal; trabalho em altura só com apoio.

Como avaliar: portal de pé e pelo menos 1 móvel por unidade. Cobertura parcial: a especialidade pede 5 móveis.$$ where id = 34;
update public.requisitos set guia_instrutor = $$Material e preparo: Materiais simples de cada atividade (definidos pela unidade antes). Cartaz com as 5 atividades.
Tempo sugerido: 45 min (sábado 16:30), cada unidade 5 a 8 min.

O que falar: "Sábado à tarde é hora de atividade de natureza, sem fogo e sem construção."

Conteúdo pronto:
Ideias de atividade de natureza para o sábado à tarde (sem fogo e sem construção): jogo de observação (achar 5 formas, 5 cores ou 5 texturas), escutar e anotar os sons do mato, caça ao tesouro de folhas e sementes, história bíblica contada ao ar livre (ex.: Salmo 19), roda de gratidão pela criação, desenho de uma paisagem.

Passo a passo:
1. Antes do acampamento, cada unidade escolhe uma atividade curta de natureza (jogo de observação, escutar sons, caça ao tesouro de folhas etc.).
2. Ela prepara em uma folha: objetivo, material e como conduzir.
3. No sábado, cada unidade apresenta em sequência ao clube todo.
4. Depois de cada apresentação, faça 1 pergunta sobre o que aprenderam.

Erros comuns: atividade com fogo ou construção (não combina com o sábado); passar do tempo.

Como avaliar: 5 atividades apresentadas, uma por unidade.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Excursionista$$ where id = 35;
update public.requisitos set guia_instrutor = $$Material e preparo: Calçado fechado, água, apito, kit de primeiros socorros na caminhada de sábado.
Tempo sugerido: Durante a caminhada (14:00 a 16:30).

O que falar: "Andar em trilha tem técnica: cada tipo de terreno pede um jeito diferente de pisar."

Passo a passo:
1. SUBIDA: passos curtos, corpo levemente inclinado para frente, ritmo constante.
2. DESCIDA: joelhos dobrados, pés levemente de lado, passos curtos, sem correr.
3. MATA FECHADA: braço na frente do rosto, o líder da fila segura os galhos para o de trás.
4. TRAVESSIA DE RIACHO: escolha pedras firmes, desafivele o cinto da mochila, teste com uma vara e passe em fila.
5. Mostre a técnica em cada trecho e peça que cada um repita no trecho seguinte.

Erros comuns: correr na descida; atravessar riacho de chinelo; puxar galho e soltar no colega.

Segurança: só atravessar riacho raso e com adulto no início e no fim da fila.

Como avaliar: o desbravador aplica a técnica certa em cada tipo de terreno.$$ where id = 36;
update public.requisitos set guia_instrutor = $$Material e preparo: Fogueira do culto, cadeiras ou bancos, pauta com 3 perguntas.
Tempo sugerido: 20 a 30 min (domingo 17:45).

O que falar: "Toda expedição termina com uma conversa: o que aprendemos e o que faríamos diferente?"

Passo a passo:
1. Sente o grupo em círculo.
2. Faça 3 perguntas: 'o que mais gostei?', 'o que foi difícil?', 'o que faria diferente?'.
3. Deixe cada unidade responder e evite interromper.
4. Anote 2 ou 3 lições e agradeça a participação.

Erros comuns: responder pelos desbravadores; conversa dominada por poucos.

Como avaliar: participação do desbravador na discussão.$$ where id = 37;
update public.requisitos set guia_instrutor = $$Material e preparo: Ingredientes e panelas de cada unidade, luvas, fogueira com brasas, balde de água.
Tempo sugerido: 60 a 75 min (almoço de domingo).

O que falar: "Hoje vocês vão cozinhar de verdade, do fogo ao prato. E vocês, Guias, lideram a equipe."

Conteúdo pronto:
Ideias de cardápio simples e rápido (adaptável a vegetariano): arroz com ovo cozido ou mexido; macarrão com molho de legumes; feijão com arroz e legumes refogados; sopa de legumes; batata assada na brasa. Planeje quantidades por pessoa e leve tempero, óleo, sal e utensílios.
O cartão do Guia pede: 'planejar, preparar e cozinhar três refeições ao ar livre'. Neste acampamento a unidade cozinha 1 refeição, que representa as 3 do requisito.

Passo a passo:
1. O Guia da unidade divide funções (fogo, corte, tempero, panela, limpeza).
2. Acompanhe o preparo sem fazer por eles: só ajuda em segurança.
3. Confira higiene: mãos lavadas e alimentos cobertos.
4. Sirvam e limpem juntos.
5. Lembre: como só há 1 refeição neste acampamento, ela representa as 3 do requisito.

Erros comuns: Guia fazendo tudo sozinho em vez de liderar; esquecer de apagar o fogo.

Segurança: luva para panela quente; balde de água ao lado.

Como avaliar: refeição preparada e servida pela própria unidade.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Guia
https://desbrava7.com/2019/07/classe-de-pesquisador-respondida-parte-4.html$$ where id = 38;
update public.requisitos set guia_instrutor = $$Material e preparo: Varas de bambu, sisal, serrote, luvas, projeto do móvel.
Tempo sugerido: Durante a Grande Pioneiria (domingo 09:30).

O que falar: "Um móvel de tamanho real precisa aguentar uso de verdade, não só ficar bonito."

Passo a passo:
1. O Guia da unidade organiza a equipe e o projeto.
2. Acompanhe as amarras: firmes e com reforço diagonal onde precisar.
3. Antes de liberar, teste: sente, apoie peso ou balance.
4. Corrija o que estiver fraco e teste de novo.
5. Use o móvel no almoço de domingo (é a prova real).

Erros comuns: móvel bonito mas que balança; esquecer o teste.

Segurança: teste com cuidado e sem subir em cima da estrutura.

Como avaliar: móvel de pé e aguentando uso real.$$ where id = 39;
update public.requisitos set guia_instrutor = $$Material e preparo: Este roteiro impresso, lista de equipamento, papel e caneta.
Tempo sugerido: Reunião de planejamento antes do acampamento (30 a 45 min).

O que falar: "Os Guias são quem planejam isso tudo. Vocês são os líderes aqui."

Passo a passo:
1. Reúna os Guias e apresente o roteiro do acampamento.
2. Peça que discutam: o que levar, quem faz o quê e como cada unidade vai se organizar.
3. Anote as decisões (lista de material, tarefas, responsáveis).
4. No acampamento, veja se o planejado está acontecendo e ajude a ajustar.

Erros comuns: planejar de última hora; líder decidindo por eles.

Como avaliar: participação ativa dos Guias no planejamento, registrada antes do acampamento.$$ where id = 40;
update public.requisitos set guia_instrutor = $$Material e preparo: Ingredientes, panelas, luvas, fogueira com brasas.
Tempo sugerido: 60 a 75 min (almoço de domingo).

O que falar: "Guia também lidera na cozinha: quem organiza a equipe garante que todos comam bem."

Passo a passo:
1. O Guia divide as funções da unidade.
2. Ele confere se tudo está pronto antes de acender o fogo.
3. Acompanhe sem fazer por ele: dê dicas de tempo e temperatura.
4. Ele coordena o serviço e a limpeza no fim.

Erros comuns: não delegar; ficar só cozinhando.

Segurança: luva para panela quente.

Como avaliar: o Guia coordena o preparo da refeição da unidade.$$ where id = 41;
update public.requisitos set guia_instrutor = $$Material e preparo: 2 a 3 lonas ou plásticos grandes, cordas de 5 m, estacas, galhos e folhas secas, terreno plano e sem galhos secos por cima.
Tempo sugerido: 50 min (segunda 11:20), antes da desmontagem.

O que falar: "Um abrigo bem feito pode ser a diferença entre uma noite segura e uma noite ruim."

Conteúdo pronto:
Os 3 tipos de abrigo para mostrar: lona em A (corda entre 2 árvores, lona por cima e estacas nas laterais); meia-água ou lean-to (uma só água inclinada); abrigo de galhos e folhas (vara apoiada numa árvore caída, com costelas de galhos e folhas em camadas).
Explique o uso de cada um: onde armar, o que protege (vento, chuva, sol) e em que ambiente serve melhor (floresta, área rochosa, pântano). O cartão do Guia de Exploração pede: 'projetar três tipos diferentes de abrigo, explicar seu uso e utilizar um deles em um acampamento'.

Passo a passo:
1. Mostre os 3 tipos: (1) lona em A: corda esticada entre duas árvores a ~1 m de altura, lona por cima e estacas nas laterais; (2) meia-água (lean-to): uma só água inclinada, apoiada numa corda alta; (3) galhos e folhas: vara principal apoiada numa árvore caída, com costelas de galhos e folhas em camadas.
2. Escolham 1 tipo para construir de verdade.
3. Montem em grupos: 1 cuida da corda, 1 da lona, 2 das estacas.
4. Testem ficando 5 minutos dentro, com um colega jogando um pouco de água por cima para simular chuva.
5. Desmontem e guardem o material antes da desmontagem do acampamento.

Erros comuns: lona muito baixa (não cabe ninguém); armar embaixo de galho seco; esquecer a inclinação para a água escorrer.

Segurança: checar o terreno antes: sem galhos soltos por cima.

Como avaliar: o grupo constrói 1 abrigo funcional e sabe descrever os outros 2 tipos. Cobertura parcial: a especialidade pede projetar e usar.

Fontes:
https://mda.wiki.br/Cart%C3%A3o_de_Guia
https://mda.wiki.br/Especialidade_de_Vida_Silvestre$$ where id = 42;

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
