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
