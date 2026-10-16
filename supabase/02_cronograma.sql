-- =====================================================================
--  ACAMPAMENTO DESBRAVADORES — CARGA DO CRONOGRAMA (09 a 12/10/2026)
--  Rode DEPOIS do 01_estrutura.sql.
--  ATENÇÃO: este script APAGA o cronograma atual e recoloca o original.
--  (A tabela de editores NÃO é apagada.)
--
--  Revisão de 09/10/2026: conferido com os cartões de classe e com o
--  Manual Administrativo do Clube de Desbravadores (DSA, ed. 2020).
--  Nas horas do sábado não há instrução técnica; o clube faz cada
--  atividade junto, em sequência. Só a Segurança e técnica de domingo
--  continua em 2 grupos que trocam entre si.
--  Arquivo gerado por pdf/fonte/gerar.js.
-- =====================================================================

truncate public.estacoes, public.rodizios, public.atividades, public.dias, public.requisitos, public.tarefas restart identity cascade;

insert into public.dias (id, data, rotulo, titulo, subtitulo, ordem) values
  (1, '2026-10-09', 'Sex 09/10', 'Sexta-feira, 09/10', 'Chegada à noite: o sábado já começou (pôr do sol por volta de 18h10)', 1),
  (2, '2026-10-10', 'Sáb 10/10', 'Sábado, 10/10', 'Dia de adoração e natureza; a parte técnica só começa depois do pôr do sol', 2),
  (3, '2026-10-11', 'Dom 11/10', 'Domingo, 11/10', 'Dia de prática', 3),
  (4, '2026-10-12', 'Seg 12/10', 'Segunda-feira, 12/10 (feriado)', 'Encerramento', 4);
select setval(pg_get_serial_sequence('public.dias','id'), (select max(id) from public.dias));

insert into public.atividades (id, dia_id, inicio, fim, titulo, conducao, requisitos, classes, material, responsavel, sabado, status, ordem) values
  -- SEXTA
  (1, 1, '19:00', '19:30', 'Chegada e check-in', 'Receber as autorizações assinadas e as fichas de saúde (remédios e alergias). Conferir só o essencial para a noite: saco de dormir ou cobertor, agasalho, lanterna e remédios. O sábado já começou: nada de aula ou avaliação de requisito agora.', '', '', 'Pasta de segurança (autorizações, fichas de saúde, telefones dos pais), lista de presença', '', true, 'pendente', 1),
  (2, 1, '19:30', '21:00', 'Montagem das barracas (só o essencial)', 'Montar apenas o necessário para dormir, com calma. Meninas e meninos em alas separadas, com as barracas dos líderes entre as alas. Nunca embaixo de árvore, em baixada ou perto de formigueiro. Móveis, portal e fogueiras ficam para depois do sábado.', 'A avaliação da barraca (Amigo; Acampamento I, II e III; Arte de Acampar) é feita no domingo, na inspeção das 08:30.', 'Todos', 'Barracas, lonas, estacas, martelo de borracha ou pedra, lanternas', 'henrique', true, 'pendente', 2),
  (3, 1, '21:00', '21:45', 'Lanche e culto de recepção do sábado', 'Lanche pronto (sem cozinhar). Cânticos e mensagem curta para receber o sábado.', '', 'Todos', 'Lanche pronto, lanternas, Bíblia', '', true, 'pendente', 3),
  (4, 1, '21:45', '22:30', 'Culto sob as estrelas', 'Sentados ou deitados olhando o céu: ler o Salmo 19:1-4 e o Salmo 8:3-4, cantar baixinho e orar por unidade. É um momento espiritual, sem aula de requisito. (Nesta época do ano o Cruzeiro do Sul já se pôs a esta hora.)', '', 'Todos', 'Bíblia, lanterna fraca', '', true, 'pendente', 4),
  (5, 1, '22:30', '', 'Silêncio', 'Reunião rápida dos líderes depois do silêncio, para combinar o sábado.', '', '', '', '', true, 'pendente', 5),

  -- SÁBADO
  (6, 2, '07:00', '', 'Alvorada', 'Alvorada e higiene pessoal.', '', '', '', '', true, 'pendente', 1),
  (7, 2, '07:30', '08:00', 'Devocional por unidade', 'Cada conselheiro dirige com a sua unidade. Tema bíblico, curto e com aplicação prática.', '', 'Todos', '', '', true, 'pendente', 2),
  (8, 2, '08:00', '08:45', 'Café da manhã', 'Cozinha do clube. No sábado, comida simples e, se possível, preparada na véspera.', '', '', '', '', true, 'pendente', 3),
  (9, 2, '08:45', '09:00', 'Cerimônia de abertura', 'Hasteamento das bandeiras, Voto e Lei, Hino dos Desbravadores e boas-vindas.', '', 'Todos', 'Bandeiras e mastro', '', true, 'pendente', 4),
  (10, 2, '09:00', '10:30', 'Escola Sabatina', '', '', 'Todos', '', '', true, 'pendente', 5),
  (11, 2, '10:30', '12:00', 'Culto divino', '', '', 'Todos', '', '', true, 'pendente', 6),
  (12, 2, '12:00', '14:00', 'Almoço e descanso', 'Cozinha do clube. Depois do almoço, uma hora de descanso de verdade.', '', '', '', '', true, 'pendente', 7),
  (13, 2, '14:00', '16:30', 'Caminhada ecológica (~6 km, ritmo leve)', 'Passeio de contemplação, sem pressa: fila indiana com o menor na frente, um adulto abrindo e outro fechando. Paradas a cada 15 a 20 minutos para observar flores, insetos, aves, árvores e pegadas e anotar no caderno de campo. Nada de colher, matar ou comer plantas. No sábado a caminhada não pode ser cansativa: se o terreno for pesado, encurte o percurso.', 'Acompanhar uma caminhada de 5 km, do planejamento à execução (Amigo); 10 flores silvestres e 10 insetos (Amigo da Natureza); caminhada ecológica de 1 hora (Companheiro); caminhada de 6 km com relatório de 1 página (Companheiro de Excursionismo); plantas silvestres comestíveis x tóxicas (Excursionista na Mata); anotações de terreno, flora e fauna, como treino para a expedição de 20 km (Excursionista)', 'AM, AM+, CO, CO+, EX, EX+', 'Caderno de campo e lápis por unidade, lupa, água, lanche leve, apito, caixa de primeiros socorros, lenço', '', true, 'pendente', 8),
  (14, 2, '16:30', '17:15', 'Atividades de natureza para o sábado', 'Cada unidade apresenta ao clube uma atividade de natureza de 5 a 8 minutos, preparada antes do acampamento (jogo de observação, sons do mato, caça ao tesouro de folhas, história bíblica ao ar livre). São 5 atividades ao todo.', 'Apresentar cinco atividades na natureza para o sábado à tarde (Excursionista na Mata)', 'EX+', 'Material simples de cada atividade', '', true, 'pendente', 9),
  (15, 2, '17:15', '17:50', 'Estudo: o dilúvio e os fósseis', 'Estudo bíblico com imagens ou um fóssil: ler trechos de Gênesis 6 a 8 e conversar sobre como um soterramento rápido forma fósseis.', 'Estudar a história do dilúvio e o processo de fossilização (Pioneiro)', 'PI', 'Bíblia, imagens de fósseis e de camadas de rocha (ou um fóssil)', '', true, 'pendente', 10),
  (16, 2, '17:50', '18:20', 'Culto do pôr do sol (despedida do sábado)', 'Começar alguns minutos antes do pôr do sol e terminar depois dele. Confirme o horário do pôr do sol do local (em São Paulo e Brasília, perto de 18h10).', '', 'Todos', '', '', true, 'pendente', 11),
  (17, 2, '18:20', '19:15', 'Oficina do Fogo', 'Só começa depois do pôr do sol. 1) Regras de segurança e preparo do local. 2) Cada unidade acende a sua fogueira com um fósforo só e material natural. 3) Demonstração dos fogos estrela, caçador e refletor. 4) Como acender com lenha molhada. A lenha já vem separada pelos líderes.', 'Fogueiras da especialidade Acampamento I (Amigo); fogueira com um fósforo (Amigo da Natureza); fogos estrela, caçador e refletor da especialidade Acampamento III (Pesquisador); fogo refletor (Pioneiro); fogueira em dia de chuva e especialidade Fogueiras e Cozinha ao Ar Livre, parcial (Pioneiro de Novas Fronteiras)', 'AM, AM+, PE, PI, PI+', 'Fósforos, isca seca em saco plástico, gravetos e lenha seca já separados, um pouco de lenha molhada, toras para o refletor, 1 balde de água e 1 pá por unidade, pedras para cercar', '', false, 'pendente', 12),
  (18, 2, '19:15', '20:30', 'Jantar', 'Cozinha do clube.', '', '', '', '', false, 'pendente', 13),
  (19, 2, '20:30', '22:00', 'Fogo do conselho', 'Cânticos animados no começo e mais calmos no fim. Cada unidade conta uma descoberta da caminhada (2 a 3 minutos). Premiação da melhor fogueira. Termina com uma reflexão espiritual curta. No fogo do conselho não se cozinha nem se assa nada.', 'Relato da caminhada de 6 km, base do relatório (Companheiro de Excursionismo); fogo do conselho da especialidade Acampamento II (Companheiro)', 'CO, CO+', 'Lenha separada, balde de água, cadernos de campo, lista de cânticos', '', false, 'pendente', 14),
  (20, 2, '22:00', '', 'Silêncio', '', '', '', '', '', false, 'pendente', 15),

  -- DOMINGO
  (21, 3, '06:30', '', 'Alvorada', 'Alvorada e higiene pessoal.', '', '', '', '', false, 'pendente', 1),
  (22, 3, '06:45', '07:15', 'Ordem Unida: treino', 'Clube formado por unidades. Treinar um comando de cada vez: sentido, descansar, cobrir, firme, direita, esquerda e meia-volta volver, marcar passo, ordinário marche e alto.', 'Especialidade de Ordem Unida, parte prática (Excursionista na Mata); comandos de ordem unida (Pesquisador de Campo e Bosque)', 'PE+, EX+', 'Espaço plano, apito', '', false, 'pendente', 2),
  (23, 3, '07:15', '07:45', 'Devocional', '', '', 'Todos', '', '', false, 'pendente', 3),
  (24, 3, '07:45', '08:30', 'Café da manhã', 'Cozinha do clube.', '', '', '', '', false, 'pendente', 4),
  (25, 3, '08:30', '08:45', 'Inspeção e revisão das barracas', 'Formatura e inspeção por unidade (vale pontos). Em cada barraca, a unidade mostra por que o local é bom e reaperta estacas e tensores. É aqui que se avalia a montagem da barraca.', 'Montar uma barraca em local apropriado (Amigo); itens de barraca e organização das especialidades Acampamento I (Amigo), Arte de Acampar (Amigo da Natureza), Acampamento II (Companheiro) e Acampamento III (Pesquisador)', 'AM, AM+, CO, PE', 'Ficha de inspeção, prancheta', '', false, 'pendente', 5),
  (26, 3, '08:45', '09:30', 'Segurança e técnica (2 grupos trocam aos 20 min)', 'Grupo A: 10 regras de segurança e uso correto de faca, facão e machadinha (um desbravador por vez). Grupo B: revisão dos nós e as 4 amarras. Aos 20 minutos os grupos trocam.', 'Faca, facão e machadinha com 10 regras de segurança (Amigo da Natureza); uso correto da machadinha (Pioneiro de Novas Fronteiras); 14 nós (Amigo); 9 nós (Companheiro); quatro amarras básicas (Pesquisador de Campo e Bosque)', 'AM, AM+, CO, PE+, PI+', '1 corda de 1,5 m por desbravador, varas e sisal para as amarras, faca, facão, machadinha, toco firme, lista dos nós', '', false, 'pendente', 6),
  (27, 3, '09:30', '12:00', 'Grande pioneiria', 'Cada unidade constrói pelo menos 1 móvel de acampamento em tamanho real (mesa, bancada de cozinha, porta-panelas, sapateira, lavatório ou varal), só com bambu, sisal e amarras, sem prego nem arame. No fim, todos juntos levantam o portal do clube. Os móveis são usados no almoço.', 'Construir um móvel de acampamento com amarras (Pesquisador de Campo e Bosque); especialidade de Pioneirias, parcial (Excursionista); cinco móveis e um portal, parcial (Excursionista na Mata); móvel em tamanho real e acampamento com estrutura de pioneiria (Guia)', 'PE+, EX, EX+, GU', 'Bambus ou varas, bastante sisal, serrote ou serra de arco, luvas para carregar bambu, trena, desenho do móvel de cada unidade', '', false, 'pendente', 7),
  (28, 3, '12:00', '13:15', 'Almoço das unidades', 'Cada unidade cozinha na própria fogueira o cardápio que planejou (sem carne), usando o móvel que construiu. É a única refeição feita pelas unidades. Se der, cada unidade também faz pão no espeto.', 'Preparar uma refeição em fogueira (Companheiro de Excursionismo); planejar e cozinhar duas refeições: faz 1 de 2 (Pesquisador); planejar, preparar e cozinhar três refeições ao ar livre: faz 1 de 3 (Guia); pão no espeto da especialidade Acampamento I (Amigo); Fogueiras e Cozinha ao Ar Livre, parcial (Pioneiro de Novas Fronteiras)', 'AM, CO+, PE, PI+, GU', 'Ingredientes e cardápio de cada unidade, panelas, colher de cabo comprido, pano ou luva para panela quente, água tratada, balde de água, sacos de lixo', '', false, 'pendente', 8),
  (29, 3, '13:15', '14:00', 'Descanso', 'Pausa depois do almoço. Lavar a louça logo depois de comer.', '', '', '', '', false, 'pendente', 9),
  (30, 3, '14:00', '14:50', 'Primeiros socorros', 'Noções básicas, com prática em duplas: avaliar a cena e pedir ajuda (192 e 193), sangramento, curativo, tala improvisada, queimadura, picada de cobra e de inseto. Reanimação e engasgo só são demonstrados no boneco ou na almofada.', 'Especialidade de Primeiros Socorros – básico, parcial (Pesquisador); procedimentos em ferimentos por animais peçonhentos, parcial (Excursionista na Mata)', 'PE, EX+', 'Caixa de primeiros socorros (gaze, atadura, esparadrapo, tesoura, luvas), talas improvisadas, panos, boneco ou almofada, cartaz com 192 e 193', '', false, 'pendente', 10),
  (31, 3, '14:55', '15:45', 'Resgate básico', 'Treino com calma: antes de mexer na vítima, garantir a segurança e pedir ajuda. Montar maca improvisada (2 varas e cobertor ou casacos), carregar em 4 e praticar o transporte em cadeirinha. Nó de resgate: lais de guia.', 'Especialidade de Resgate Básico, parcial: maca improvisada e transporte de vítima (Pioneiro)', 'PI', '2 varas retas de 2 m, cobertor ou 3 casacos, cordas, terreno plano', '', false, 'pendente', 11),
  (32, 3, '15:45', '16:30', 'Banho', '', '', '', '', '', false, 'pendente', 12),
  (33, 3, '16:30', '17:45', 'Jantar', 'Cozinha do clube.', '', '', '', '', false, 'pendente', 13),
  (34, 3, '17:45', '19:30', 'Culto ao redor da fogueira e noite de relatos', 'Cânticos, testemunhos e mensagem. Cada unidade conta o que mais a impressionou no acampamento (é a base do relatório do Companheiro). Apresentação dos móveis e do portal. Conversa final: o que aprendemos e o que faríamos diferente.', 'Relatório do acampamento: o que mais impressionou (Companheiro); participação em culto de acampamento da especialidade Acampamento II (Companheiro); discussão de grupo depois da caminhada, como treino para a expedição de 20 km (Excursionista)', 'CO, EX', 'Lenha, balde de água, caderno e caneta', '', false, 'pendente', 14),
  (49, 3, '19:30', '20:15', 'Roda de conversa: caminhada segura e bom acampamento', 'Conversa curta em roda, usando o que o clube viveu no sábado: 10 regras para uma caminhada, o que fazer se estiver perdido, os 6 segredos de um bom acampamento e como andar em cada tipo de terreno. (Veio da sexta à noite: nas horas do sábado não se dá instrução técnica.)', '10 regras para uma caminhada e o que fazer quando estiver perdido (Amigo); seis segredos para um bom acampamento (Pesquisador); itens da escolha do local das especialidades Acampamento II (Companheiro) e Acampamento III (Pesquisador); técnicas para percorrer trilhas em diferentes terrenos (Excursionista na Mata)', 'AM, CO, PE, EX+', 'Cartaz com as 10 regras, cartaz em branco e caneta, 1 apito', '', false, 'pendente', 15),
  (35, 3, '22:00', '', 'Silêncio', 'Tempo livre entre a roda de conversa (20:15) e o silêncio.', '', '', '', '', false, 'pendente', 16),

  -- SEGUNDA
  (36, 4, '06:30', '', 'Alvorada', 'Alvorada e higiene pessoal.', '', '', '', '', false, 'pendente', 1),
  (37, 4, '07:00', '07:30', 'Devocional', '', '', 'Todos', '', '', false, 'pendente', 2),
  (38, 4, '07:30', '08:00', 'Café da manhã', 'Cozinha do clube.', '', '', '', '', false, 'pendente', 3),
  (39, 4, '08:00', '08:30', 'Formatura: apresentação de Ordem Unida', 'Hasteamento e apresentação da Ordem Unida por unidade para a liderança (e para os pais, se estiverem). É a avaliação prática.', 'Especialidade de Ordem Unida, parte prática (Excursionista na Mata); comandos de ordem unida, Bandeira dos Desbravadores e bandeirim (Pesquisador de Campo e Bosque)', 'PE+, EX+', 'Bandeiras, bandeirins das unidades, apito', '', false, 'pendente', 4),
  (40, 4, '08:30', '09:10', 'Purificação de água', 'Mostrar 3 maneiras: ferver (1 minuto de fervura forte), hipoclorito de sódio (2 gotas por litro, esperar 30 minutos) e SODIS (garrafa PET transparente 6 horas ao sol). O filtro de garrafa PET só tira a sujeira: depois dele ainda é preciso ferver ou tratar. Cada Amigo demonstra uma maneira e escreve o parágrafo sobre Jesus, a água da vida.', 'Demonstrar uma maneira de purificar a água e escrever um parágrafo sobre Jesus como a água da vida (Amigo); três maneiras de purificar água da especialidade Vida Silvestre, parcial (Excursionista na Mata)', 'AM, EX+', 'Panela e fogareiro, garrafas PET transparentes, pano limpo, areia, carvão, cascalho, água turva, hipoclorito de sódio 2,5% com conta-gotas, papel e lápis, Bíblia', '', false, 'pendente', 5),
  (41, 4, '09:10', '09:50', 'Orientação pelo sol', 'Método da sombra: fincar uma vara reta, marcar a ponta da sombra, esperar 15 minutos e marcar de novo. A 1ª marca é o Oeste e a 2ª é o Leste. Enquanto espera, cada um desenha a rosa dos ventos e aprende os outros métodos (sol nascente, relógio de ponteiros e Cruzeiro do Sul).', 'Descobrir os pontos cardeais sem bússola e desenhar uma rosa dos ventos (Companheiro); três métodos de achar os pontos cardeais sem bússola da especialidade Vida Silvestre, parcial (Excursionista na Mata); direção sem bússola da especialidade Mapa e Bússola, parcial (Pioneiro de Novas Fronteiras)', 'CO, PI+, EX+', '1 vara reta de 1 m, pedrinhas, papel, lápis de cor, relógio de ponteiros, desenho do Cruzeiro do Sul', '', false, 'pendente', 6),
  (42, 4, '09:50', '10:30', 'Quadro de nós', 'Cada unidade monta um quadro com 15 nós diferentes, cada um com o nome. Quem ainda deve nós do Amigo ou do Companheiro aproveita para mostrar ao instrutor. O quadro fica para a sala do clube.', 'Preparar um quadro com 15 nós diferentes (Companheiro de Excursionismo); revisão dos 14 nós (Amigo) e dos 9 nós (Companheiro)', 'AM, CO, CO+', '1 tábua ou papelão grosso por unidade, cordas finas, cola quente (só adulto usa), etiquetas, caneta', '', false, 'pendente', 7),
  (43, 4, '10:30', '11:20', 'Azimutes e pista', 'Metade do tempo para cada parte. Bússola: como segurar, marcar o azimute e seguir um percurso de 3 azimutes até o tesouro. Pista: aprender os sinais, montar uma pista de 10 sinais para outro grupo seguir e depois desmanchar tudo.', 'Preparar e seguir uma pista de no mínimo 10 sinais (Amigo); aprender a usar uma bússola, parcial (Pesquisador); especialidade de Mapa e Bússola, parcial (Pioneiro de Novas Fronteiras); percurso com azimutes da especialidade Vida Silvestre, parcial (Excursionista na Mata)', 'AM, PE, PI+, EX+', '1 bússola por dupla, estacas numeradas, cartão do percurso, cartaz dos sinais de pista, gravetos e pedras soltos', '', false, 'pendente', 8),
  (44, 4, '11:20', '12:10', 'Abrigos', 'Os Guias desenham 3 tipos de abrigo e explicam para que serve cada um. O grupo constrói um deles (lona em A ou meia-água) em local seguro. O abrigo fica montado e é usado como sombra no almoço e no tempo livre; desmonta antes do encerramento.', 'Projetar três tipos diferentes de abrigo, explicar seu uso e utilizar um deles em um acampamento (Guia de Exploração)', 'GU+', '2 ou 3 lonas, cordas de 5 m, estacas, varas, papel e lápis para os projetos', '', false, 'pendente', 9),
  (45, 4, '12:10', '14:10', 'Desmontagem do acampamento', 'Desmontar móveis e portal (guardar o sisal), barracas e fogueiras (apagar com água, espalhar as cinzas frias e recolocar a grama). Cada um arruma a própria mochila do jeito certo. No fim, operação pente-fino: todos em linha recolhendo qualquer lixo. Deixar o local melhor do que estava.', 'Arrumar corretamente a mochila com o equipamento pessoal (Pioneiro); lista de equipamento, roupa e calçado, parcial: falta a caminhada de 10 km (Pesquisador de Campo e Bosque); itens de desmontagem e limpeza das especialidades Acampamento I (Amigo), Arte de Acampar (Amigo da Natureza), Acampamento II (Companheiro) e Acampamento III (Pesquisador)', 'AM, AM+, CO, PE, PE+, PI', 'Sacos de lixo, pá, balde, capas das barracas, papel e lápis', '', false, 'pendente', 10),
  (46, 4, '14:10', '17:15', 'Almoço e tempo livre', 'Cozinha do clube ou lanche frio. Tempo livre, com o abrigo dos Guias como sombra. Conferência final do material do clube.', '', '', '', '', false, 'pendente', 11),
  (47, 4, '17:15', '18:00', 'Encerramento', 'Arriamento das bandeiras, prêmio da melhor unidade, assinatura dos requisitos cumpridos por inteiro e oração final.', '', 'Todos', 'Cartões de classe, canetas, ficha de controle dos requisitos', '', false, 'pendente', 12),
  (48, 4, '18:00', '', 'Saída', '', '', '', '', '', false, 'pendente', 13);
select setval(pg_get_serial_sequence('public.atividades','id'), (select max(id) from public.atividades));

-- Sem rodízio de estações nesta versão: o clube faz cada atividade junto, em sequência.
-- As tabelas rodizios/estacoes ficam vazias (já foram limpas pelo truncate acima).

insert into public.requisitos (id, item, tipo, quando, classes, instrutor, status, ordem) values
  (1, 'Acompanhar, pela observação, todo o planejamento e a execução de uma caminhada de 5 km', 'Requisito', 'Sáb 14:00', 'AM', '', 'pendente', 1),
  (2, 'Aprender e montar uma barraca em local apropriado', 'Requisito', 'Dom 08:30', 'AM', '', 'pendente', 2),
  (3, 'Cuidar corretamente de uma corda; fazer e explicar o uso prático dos 14 nós', 'Requisito', 'Dom 08:45 · Seg 09:50', 'AM', '', 'pendente', 3),
  (4, 'Apresentar 10 regras para uma caminhada e explicar o que fazer quando estiver perdido', 'Requisito', 'Dom 19:30', 'AM', '', 'pendente', 4),
  (5, 'Aprender e demonstrar uma maneira de purificar a água e escrever um parágrafo destacando o significado de Jesus como a água da vida', 'Requisito', 'Seg 08:30', 'AM', '', 'pendente', 5),
  (6, 'Aprender os sinais de pista; preparar e seguir uma pista de no mínimo 10 sinais, que outros também consigam seguir', 'Requisito', 'Seg 10:30', 'AM', '', 'pendente', 6),
  (7, 'Especialidade Acampamento I (parcial)', 'Especialidade', 'Sáb 18:20 · Dom 08:30 · Dom 08:45 · Dom 12:00 · Dom 19:30 · Seg 12:10', 'AM', '', 'pendente', 7),
  (8, 'Conhecer e identificar 10 flores silvestres e 10 insetos da região', 'Requisito', 'Sáb 14:00', 'AM+', '', 'pendente', 8),
  (9, 'Começar uma fogueira com apenas um fósforo, usando materiais naturais, e mantê-la acesa', 'Requisito', 'Sáb 18:20', 'AM+', '', 'pendente', 9),
  (10, 'Usar corretamente uma faca, um facão e uma machadinha e conhecer dez regras para usá-los com segurança', 'Requisito', 'Dom 08:45', 'AM+', '', 'pendente', 10),
  (11, 'Especialidade Arte de Acampar (parcial)', 'Especialidade', 'Dom 08:30 · Seg 12:10', 'AM+', '', 'pendente', 11),
  (12, 'Participar de uma caminhada ecológica em meio à natureza por uma hora', 'Requisito', 'Sáb 14:00', 'CO', '', 'pendente', 12),
  (13, 'Aprender ou recapitular os 9 nós', 'Requisito', 'Dom 08:45 · Seg 09:50', 'CO', '', 'pendente', 13),
  (14, 'Participar em um acampamento de fim de semana e fazer um relatório destacando o que mais lhe impressionou positivamente (fecha com a entrega)', 'Requisito', 'Dom 17:45', 'CO', '', 'pendente', 14),
  (15, 'Descobrir os pontos cardeais sem a ajuda de uma bússola e desenhar uma rosa dos ventos', 'Requisito', 'Seg 09:10', 'CO', '', 'pendente', 15),
  (16, 'Especialidade Acampamento II (parcial)', 'Especialidade', 'Sáb 20:30 · Dom 08:30 · Dom 17:45 · Dom 19:30 · Seg 12:10', 'CO', '', 'pendente', 16),
  (17, 'Participar de uma caminhada de 6 km e preparar um relatório de uma página (fecha com a entrega)', 'Requisito', 'Sáb 14:00 · Sáb 20:30', 'CO+', '', 'pendente', 17),
  (18, 'Identificar e descrever 12 aves nativas e 12 árvores nativas (parcial)', 'Requisito', 'Sáb 14:00', 'CO+', '', 'pendente', 18),
  (19, 'Preparar uma refeição em uma fogueira durante um acampamento de clube ou unidade', 'Requisito', 'Dom 12:00', 'CO+', '', 'pendente', 19),
  (20, 'Preparar um quadro com 15 nós diferentes', 'Requisito', 'Seg 09:50', 'CO+', '', 'pendente', 20),
  (21, 'Apresentar seis segredos para um bom acampamento e participar de um acampamento de fim de semana, planejando e cozinhando duas refeições (parcial)', 'Requisito', 'Dom 12:00 · Dom 19:30', 'PE', '', 'pendente', 21),
  (22, 'Aprender a usar uma bússola ou GPS e demonstrar a habilidade encontrando endereços em zona urbana (parcial)', 'Requisito', 'Seg 10:30', 'PE', '', 'pendente', 22),
  (23, 'Especialidade Acampamento III (parcial)', 'Especialidade', 'Sáb 18:20 · Dom 08:30 · Dom 12:00 · Dom 19:30 · Seg 12:10', 'PE', '', 'pendente', 23),
  (24, 'Especialidade Primeiros Socorros – básico (parcial)', 'Especialidade', 'Dom 14:00', 'PE', '', 'pendente', 24),
  (25, 'Conhecer e saber usar a Bandeira dos Desbravadores, o bandeirim de unidade e os comandos de ordem unida', 'Requisito', 'Dom 06:45 · Seg 08:00', 'PE+', '', 'pendente', 25),
  (26, 'Aprender a fazer quatro amarras básicas e construir um móvel de acampamento', 'Requisito', 'Dom 08:45 · Dom 09:30', 'PE+', '', 'pendente', 26),
  (27, 'Participar de uma caminhada de 10 km e fazer uma lista dos equipamentos, incluindo roupa e calçado (parcial)', 'Requisito', 'Seg 12:10', 'PE+', '', 'pendente', 27),
  (28, 'Estudar a história do dilúvio e o processo de fossilização', 'Requisito', 'Sáb 17:15', 'PI', '', 'pendente', 28),
  (29, 'Fazer um fogo refletor e demonstrar seu uso', 'Requisito', 'Sáb 18:20', 'PI', '', 'pendente', 29),
  (30, 'Participar de um acampamento de fim de semana, arrumando de forma apropriada a mochila com o equipamento pessoal', 'Requisito', 'Seg 12:10', 'PI', '', 'pendente', 30),
  (31, 'Especialidade Resgate básico (parcial)', 'Especialidade', 'Dom 14:55', 'PI', '', 'pendente', 31),
  (32, 'Acender uma fogueira em dia de chuva, saber como conseguir lenha seca e manter o fogo aceso', 'Requisito', 'Sáb 18:20', 'PI+', '', 'pendente', 32),
  (33, 'Demonstrar habilidade no uso correto de uma machadinha', 'Requisito', 'Dom 08:45', 'PI+', '', 'pendente', 33),
  (34, 'Especialidade Fogueiras e Cozinha ao Ar Livre (parcial)', 'Especialidade', 'Sáb 18:20 · Dom 12:00', 'PI+', '', 'pendente', 34),
  (35, 'Especialidade Mapa e Bússola (parcial)', 'Especialidade', 'Seg 09:10 · Seg 10:30', 'PI+', '', 'pendente', 35),
  (36, 'Expedição de 20 km com uma noite fora: planejamento, anotações de terreno, flora e fauna e discussão em grupo (treino)', 'Requisito', 'Sáb 14:00 · Dom 17:45', 'EX', '', 'pendente', 36),
  (37, 'Especialidade Pioneirias (parcial)', 'Especialidade', 'Dom 09:30', 'EX', '', 'pendente', 37),
  (38, 'Encontrar alimento em plantas silvestres da região e diferenciá-las das plantas tóxicas (parcial)', 'Requisito', 'Sáb 14:00', 'EX+', '', 'pendente', 38),
  (39, 'Apresentar cinco atividades na natureza para serem realizadas no sábado à tarde', 'Requisito', 'Sáb 16:30', 'EX+', '', 'pendente', 39),
  (40, 'Com sua unidade, construir cinco móveis de acampamento e um portal para o clube (parcial)', 'Requisito', 'Dom 09:30', 'EX+', '', 'pendente', 40),
  (41, 'Demonstrar os procedimentos em caso de ferimentos por animais peçonhentos e não peçonhentos', 'Requisito', 'Dom 14:00', 'EX+', '', 'pendente', 41),
  (42, 'Demonstrar técnicas para percorrer trilhas em diferentes tipos de terreno: desertos, florestas, pântanos e rios', 'Requisito', 'Dom 19:30', 'EX+', '', 'pendente', 42),
  (43, 'Especialidade Ordem Unida (parcial)', 'Especialidade', 'Dom 06:45 · Seg 08:00', 'EX+', '', 'pendente', 43),
  (44, 'Especialidade Vida Silvestre (parcial)', 'Especialidade', 'Seg 08:30 · Seg 09:10 · Seg 10:30', 'EX+', '', 'pendente', 44),
  (45, 'Construir e utilizar um móvel de acampamento em tamanho real, com nós e amarras', 'Requisito', 'Dom 09:30', 'GU', '', 'pendente', 45),
  (46, 'Participar com sua unidade de um acampamento com estrutura de pioneiria, planejando o que levar e o que vai acontecer', 'Requisito', 'Dom 09:30', 'GU', '', 'pendente', 46),
  (47, 'Planejar, preparar e cozinhar três refeições ao ar livre (parcial)', 'Requisito', 'Dom 12:00', 'GU', '', 'pendente', 47),
  (48, 'Projetar três tipos diferentes de abrigo, explicar seu uso e utilizar um deles em um acampamento', 'Requisito', 'Seg 11:20', 'GU+', '', 'pendente', 48);
select setval(pg_get_serial_sequence('public.requisitos','id'), (select max(id) from public.requisitos));

-- Guia do instrutor de cada atividade (reúne a orientação de todos os requisitos que ela cumpre)
update public.atividades set guia_instrutor = $$Objetivo: Receber todo mundo com segurança e garantir que ninguém passe a noite sem o essencial.

Material e preparo: Pasta de segurança (autorizações, fichas de saúde, telefones dos pais), lista de presença

Tempo sugerido: 19:00 às 19:30

Passo a passo:
1. Um líder fica na entrada com a pasta de segurança e recebe de cada desbravador a autorização assinada e a ficha de saúde.
2. Recolha os remédios e anote nome, dose e horário. Pergunte sobre alergias (comida, picada de inseto, remédio).
3. Cada conselheiro confere com a sua unidade só 4 coisas: saco de dormir ou cobertor, agasalho, lanterna e garrafa de água.
4. Faltou algo essencial? Resolva agora com material reserva do clube.
5. Mostre onde ficam o banheiro, a água potável e a barraca dos líderes.

Segurança:
- Menor de idade sem autorização assinada pelo responsável não fica no acampamento (Manual Administrativo).
- O seguro anual cobre só membros ativos e cadastrados. Confira se todos estão no cadastro.
- Deixe anotado o hospital mais próximo e teste o sinal de celular no local.

Como avaliar:
- Nada é assinado agora. A mochila do Pioneiro é avaliada na segunda-feira, na desmontagem.$$ where id = 1;

update public.atividades set guia_instrutor = $$Objetivo: Montar só o que é preciso para dormir. A aula sobre barraca fica para o domingo.

Material e preparo: Barracas, lonas, estacas, martelo de borracha ou pedra, lanternas

Tempo sugerido: 19:30 às 21:00

O que falar: "Hoje a gente monta rápido e em paz, porque o sábado já começou. No domingo cada unidade vai me explicar por que escolheu este lugar."

Passo a passo:
1. Antes de soltar as unidades, dois líderes percorrem o terreno com lanterna e marcam onde cada barraca vai ficar.
2. Meninas de um lado, meninos do outro. As barracas dos líderes ficam no meio, entre as duas alas.
3. Cada unidade monta a sua barraca: lona no chão, varas, estacas inclinadas (apontando para fora) e sobreteto esticado, sem encostar na barraca de dentro.
4. Dentro da barraca: mochilas no fundo, calçados na entrada, lanterna à mão.
5. Nada de móveis, portal, fogueira ou corte de madeira hoje.

▶ Onde montar (Manual Administrativo)
- Lugar alto, limpo e quase plano (uma inclinação leve ajuda a água a escorrer).
- Nunca embaixo de árvore: galho pode cair, atrai raio e fica pingando depois da chuva.
- Nunca em baixada, leito seco de rio ou no meio de uma trilha.
- Protegido de vento forte e longe de formigueiro.

▶ Por que só o essencial
- O Manual pede que tudo esteja pronto antes do pôr do sol de sexta e que não se monte acampamento na sexta à noite.
- Como a chegada é à noite, faça só o necessário para dormir e, nos próximos acampamentos, planeje chegar antes do pôr do sol.

Segurança:
- Olhe para cima antes de escolher o lugar. Ninguém anda sozinho no escuro. Cuidado com estacas e cordas no caminho.

Como avaliar:
- Só observe quem participou da montagem. A conversa sobre o local e a assinatura são na inspeção de domingo, 08:30.$$ where id = 2;

update public.atividades set guia_instrutor = $$Objetivo: Terminar o primeiro dia adorando a Deus sob o céu. É culto, não é aula.

Material e preparo: Bíblia, lanterna fraca

Tempo sugerido: 21:45 às 22:30

O que falar: "Os céus proclamam a glória de Deus. Vamos ficar em silêncio um minuto e só olhar."

Passo a passo:
1. Apaguem as lanternas por 2 minutos, para os olhos se acostumarem com o escuro.
2. Um desbravador lê o Salmo 19:1-4. Pergunte: o que o céu está contando sobre Deus agora?
3. Outro lê o Salmo 8:3-4. Cada unidade agradece a Deus por uma coisa da criação.
4. Cântico calmo, oração e avisos para o sábado. Depois, silêncio.

▶ Por que não procurar o Cruzeiro do Sul hoje
- Em outubro o Cruzeiro do Sul se põe logo no começo da noite. Às 21:45 ele já está abaixo do horizonte em quase todo o Brasil.
- Para ver: domingo ou segunda, por volta das 5 da manhã, baixo no horizonte a sudeste. Nessa hora Órion (as Três Marias) está bem alto, ao norte.
- Os pontos cardeais sem bússola (Companheiro) são feitos na segunda, 09:10, pelo sol.

Como avaliar:
- Nada é assinado. As 10 regras de caminhada e os 6 segredos do bom acampamento foram para a roda de conversa de domingo, 19:30.$$ where id = 4;

update public.atividades set guia_instrutor = $$Objetivo: Passeio de observação da natureza, em ritmo leve. Quem observa a criação conhece melhor o Criador.

Requisitos cumpridos nesta atividade:
- [AM] Acompanhar, pela observação, todo o planejamento e a execução de uma caminhada de 5 km. (Fecha aqui) Mostre o plano ao clube antes de sair.
- [AM+] Conhecer e identificar 10 flores silvestres e 10 insetos da região. (Fecha aqui) Se não chegar a 10 de cada, continua nos outros dias.
- [CO] Participar de uma caminhada ecológica em meio à natureza por uma hora. (Fecha aqui)
- [CO+] Participar de uma caminhada de 6 km e preparar um relatório de uma página. (Fecha com a entrega) Só fecha com o relatório entregue. Confirme se o percurso tem mesmo 6 km.
- [CO+] Identificar e descrever 12 aves nativas e 12 árvores nativas. (Parcial) Aqui só adianta: anote as que aparecerem.
- [EX+] Encontrar alimento em plantas silvestres da região e diferenciá-las das plantas tóxicas. (Parcial) Só identificação. Ninguém come nada.
- [EX] Anotações sobre terreno, flora e fauna durante a expedição de 20 km. (Treino) É treino. A expedição de 20 km com pernoite fica para outra saída.

Material e preparo: Caderno de campo e lápis por unidade, lupa, água, lanche leve, apito, caixa de primeiros socorros, lenço

Tempo sugerido: 14:00 às 16:30

O que falar: "Hoje não é corrida. Vamos andar devagar, de olhos e ouvidos abertos. Não se colhe nem se mata nada."

Passo a passo:
1. (10 min) Antes de sair, mostre o plano: por onde vamos, quantos quilômetros, a que horas voltamos, onde são as paradas e quem leva os primeiros socorros. É isso que o Amigo precisa acompanhar.
2. Confira: calçado fechado e já usado, boné, lenço, água e 1 apito por unidade.
3. Fila indiana, o menor na frente. Um adulto abre e outro fecha. Conte o grupo na saída e em toda parada.
4. Ande no passo dos menores. A cada 15 ou 20 minutos, parada de 5 minutos: cada unidade encontra e anota 2 flores e 2 insetos (nome ou desenho, cor, onde estava).
5. Nas paradas maiores, olhem também aves, árvores, pegadas e o tipo de terreno (seco, úmido, pedra, areia).
6. Plantas: mostre só as que você conhece com certeza, 2 ou 3 comestíveis e 2 ou 3 tóxicas. Só olhar.
7. Na metade do caminho, leia o Salmo 104:24 e faça uma oração curta.
8. Na volta, conte o grupo e dê 5 minutos para as unidades completarem o caderno.

▶ Regras da caminhada (Manual Administrativo)
- Fila indiana, do menor para o maior; em estrada, andar na contramão.
- Mãos livres (ou um bastão). Calçado usado, nunca novo. Roupa clara.
- Água em pequenos goles, sem esperar a sede. Nada de refrigerante. Lanche leve.
- Sem gritaria. Caixa de primeiros socorros à mão. Caderninho para anotar.

▶ O que anotar no caderno de campo
- Hora e lugar.
- Nome ou desenho do que viu.
- Cor, tamanho e uma curiosidade.
- Se não souber o nome, escreva "a identificar" e pesquise depois.

Segurança:
- No sábado a caminhada não pode ser exaustiva (Manual). Se o terreno for pesado ou o grupo cansar, encurte e avise que os 6 km do Companheiro de Excursionismo ficam para outro dia.
- Quem tem alergia a picada avisa antes de sair. Ninguém toca em lagarta, aranha ou cobra.
- Riacho: só no raso, com um adulto de cada lado. Ninguém sai da fila sem avisar.

Como avaliar:
- Amigo: conta com as próprias palavras como a caminhada foi planejada.
- Amigo da Natureza: mostra no caderno 10 flores e 10 insetos e reconhece pelo menos metade ao vivo.
- Companheiro de Excursionismo: entrega o relatório de uma página depois do acampamento.$$ where id = 13;

update public.atividades set guia_instrutor = $$Objetivo: Mostrar que o sábado à tarde pode ser alegre e cheio de natureza.

Requisitos cumpridos nesta atividade:
- [EX+] Apresentar cinco atividades na natureza para serem realizadas no sábado à tarde. (Fecha aqui) O Excursionista na Mata entrega a lista das 5 por escrito e ajuda a conduzir pelo menos uma.

Material e preparo: Material simples de cada atividade

Tempo sugerido: 16:30 às 17:15

O que falar: "Cada unidade preparou uma atividade. Depois de cada uma eu pergunto: o que isso mostra sobre Deus?"

Passo a passo:
1. Sorteie a ordem. Cada unidade tem 7 minutos: 1 para explicar e 6 para fazer com o clube.
2. Depois de cada atividade, faça uma pergunta rápida: o que aprendemos? O que isso mostra sobre Deus?
3. No fim, os Excursionistas na Mata escrevem em uma folha as 5 atividades: nome, objetivo, material e como conduzir.

▶ Ideias, se alguma unidade não preparou
- Caça às cores: achar na natureza, sem arrancar, algo de 6 cores diferentes.
- Um minuto de silêncio: contar quantos sons diferentes cada um ouviu.
- Detetive da criação: achar algo que lembre cada dia da criação.
- Folhas caídas: juntar 5 formatos diferentes e comparar.
- História ao ar livre: os lírios do campo (Mateus 6:28-30) ou o Salmo 19.
- Desenho da paisagem em 5 minutos.

Segurança:
- É sábado: nada de esporte, correria, brincadeira na água, fogo ou construção. Vale brincadeira que envolva a natureza (Manual).

Como avaliar:
- Excursionista na Mata: entregou a lista escrita com as 5 atividades e participou da condução.$$ where id = 14;

update public.atividades set guia_instrutor = $$Objetivo: Entender, pela Bíblia e pela natureza, como o dilúvio se relaciona com os fósseis.

Requisitos cumpridos nesta atividade:
- [PI] Estudar a história do dilúvio e o processo de fossilização. (Fecha aqui)

Material e preparo: Bíblia, imagens de fósseis e de camadas de rocha (ou um fóssil)

Tempo sugerido: 17:15 às 17:50

O que falar: "Como um bicho ou uma planta vira pedra? Vamos ver o que a Bíblia e as rochas contam."

Passo a passo:
1. Mostre a imagem ou o fóssil e pergunte: como isso se formou?
2. Um desbravador lê Gênesis 7:11-12 e 7:17-23.
3. Explique a fossilização em 3 passos: 1) o ser vivo é coberto depressa por lama ou areia; 2) sem ar, ele não apodrece; 3) com o tempo os minerais da água entram no lugar do corpo e ele endurece como pedra.
4. Ligue os pontos: para formar tantos fósseis bem conservados é preciso muita água e muita lama cobrindo tudo rápido. O dilúvio descrito na Bíblia foi um acontecimento assim.
5. Abra para perguntas. Se não souber responder, diga: vamos pesquisar juntos.
6. Cada Pioneiro explica com as próprias palavras o que entendeu.

▶ Textos
- Gênesis 6 a 8 (a história do dilúvio).
- 2 Pedro 3:5-6.
- Fóssil: resto ou marca de um ser vivo conservado na rocha.

Como avaliar:
- O Pioneiro conta a história do dilúvio e explica, do jeito dele, como um fóssil se forma.$$ where id = 15;

update public.atividades set guia_instrutor = $$Objetivo: Aprender a fazer fogo com segurança: preparar, acender, usar e apagar.

Requisitos cumpridos nesta atividade:
- [AM+] Começar uma fogueira com apenas um fósforo, usando materiais naturais, e mantê-la acesa. (Fecha aqui) É individual: cada Amigo da Natureza acende a sua.
- [PI] Fazer um fogo refletor e demonstrar seu uso. (Fecha aqui)
- [PI+] Acender uma fogueira em dia de chuva, saber como conseguir lenha seca e manter o fogo aceso. (Fecha aqui) Fecha se o próprio desbravador fizer, não só assistir.
- [AM] Especialidade Acampamento I: escolher o local e preparar uma fogueira, regras de segurança, uso do fósforo, fogueira com um fósforo e como proteger a lenha da chuva. (Parcial)
- [PE] Especialidade Acampamento III: construir as fogueiras estrela, caçador e refletor e explicar o uso; revisar as regras de segurança. (Parcial)
- [PI+] Especialidade Fogueiras e Cozinha ao Ar Livre: tipos de fogueira, começar com um fósforo, tempo chuvoso, regras de segurança. (Parcial)

Material e preparo: Fósforos, isca seca em saco plástico, gravetos e lenha seca já separados, um pouco de lenha molhada, toras para o refletor, 1 balde de água e 1 pá por unidade, pedras para cercar

Tempo sugerido: 18:20 às 19:15

O que falar: "Fogo bem feito é fogo preparado. Quem arruma tudo antes acende com um fósforo só."

Passo a passo:
1. (5 min) Local e segurança: círculo limpo de 2 metros, grama retirada em placas para recolocar depois, pedras em volta, balde de água e pá ao lado.
2. (5 min) Cada unidade separa o material em 4 montes: isca, gravetos finos como lápis, gravetos médios como dedo e lenha grossa como pulso.
3. (15 min) Desafio de um fósforo: a unidade monta a fogueira (cabana ou pirâmide) com a isca no meio. Você confere antes: tem isca seca? Tem espaço para o ar? Só então entrega 1 fósforo. Acende pelo lado de onde vem o vento.
4. Os Amigos da Natureza acendem cada um a sua fogueirinha e mantêm acesa por 10 minutos, pondo graveto aos poucos.
5. (15 min) Tipos de fogo: os Pioneiros montam o refletor e mostram o calor de um lado e do outro. Os Pesquisadores montam o estrela e o caçador.
6. (10 min) Lenha molhada: o adulto racha um galho molhado e mostra o miolo seco. Lascas finas, base de gravetos para tirar o fogo do chão molhado, isca guardada em saco plástico.
7. (5 min) Apagar: água, mexer as cinzas, mais água. Só está apagado quando dá para pôr a mão. Fica acesa apenas a fogueira que será usada no jantar ou no fogo do conselho.

▶ Tipos de fogo e para que servem
- Estrela: toras em forma de raios, com as pontas no centro. Vai empurrando conforme queima. Gasta pouca lenha e dura a noite.
- Caçador: duas toras lado a lado com o fogo no meio. A panela apoia em cima. É fogo de cozinhar.
- Refletor: parede de toras grossas atrás do fogo. Joga o calor para um lado só. Serve para aquecer um abrigo ou secar roupa.
- Fogo do conselho: fogueira maior, em pirâmide. Serve para iluminar a reunião da noite.

▶ Regras de segurança do fogo
- Só com adulto por perto. Fogueira nunca fica sozinha.
- A 5 metros ou mais das barracas e sem galhos por cima.
- Balde de água e pá sempre ao lado.
- Nunca usar álcool, gasolina ou outro líquido para acender.
- Nada de vela, lampião ou fogareiro dentro da barraca.
- Ao sair ou dormir, apagar até esfriar.

▶ Isca natural que funciona
- Capim seco, folhas secas esfareladas, casca fina e seca, palha, fiapos de coco. Graveto bom é o que estala ao quebrar.

Segurança:
- Só começa depois do pôr do sol de sábado. A lenha é separada pelos líderes antes do sábado ou trazida de casa (no sábado não se apanha lenha).
- Facão e machadinha: hoje só o adulto usa. Cabelo comprido preso. Ninguém pula nem corre perto do fogo.
- Não faça fogueira maior que o necessário (Manual).

Como avaliar:
- Amigo da Natureza: acendeu com 1 fósforo e manteve aceso. Anote quantas tentativas precisou.
- Pioneiro: montou o refletor e explicou para que serve.
- Pioneiro de Novas Fronteiras: conseguiu lenha seca de um galho molhado e manteve o fogo.
- Especialidades: marque na ficha de controle os itens feitos. Elas não ficam completas hoje.$$ where id = 17;

update public.atividades set guia_instrutor = $$Objetivo: O momento mais esperado do acampamento: cantar, rir, contar a caminhada e tomar uma decisão ao lado de Jesus.

Requisitos cumpridos nesta atividade:
- [CO+] Relatório de uma página da caminhada de 6 km. (Fecha com a entrega) O relato no fogo do conselho é o ensaio. O requisito fecha com o relatório escrito.
- [CO] Especialidade Acampamento II: conhecer o uso do fogo do conselho e rever as normas de segurança de fogueiras. (Parcial)

Material e preparo: Lenha separada, balde de água, cadernos de campo, lista de cânticos

Tempo sugerido: 20:30 às 22:00

Passo a passo:
1. Tenha o programa escrito, com hora para começar e para terminar. Dois adultos cuidam só do fogo.
2. Comece animado: 2 ou 3 cânticos curtos e conhecidos.
3. Relatos da caminhada: cada unidade tem 2 a 3 minutos para contar uma descoberta e mostrar o caderno. Mais de um da unidade deve falar.
4. Premiação da melhor fogueira da Oficina do Fogo.
5. Vá acalmando: cântico mais calmo, uma história e a reflexão espiritual final, com oração.

▶ Regras do fogo do conselho (Manual Administrativo)
- Dura de 30 minutos a 1 hora e meia. Respeite o cansaço dos juvenis.
- Do mais animado para o mais reverente.
- Sempre termina com um momento espiritual.
- Não se cozinha nem se assa nada neste fogo.
- Tenha músicas e uma história de reserva, caso alguma parte falhe.

Segurança:
- Todos sentados a uma distância segura. Ao terminar, apague o fogo até esfriar.

Como avaliar:
- Companheiro de Excursionismo: participou do relato. Combine o prazo do relatório (primeira reunião depois do acampamento).$$ where id = 19;

update public.atividades set guia_instrutor = $$Objetivo: Treinar os movimentos básicos de Ordem Unida para a apresentação de segunda-feira.

Requisitos cumpridos nesta atividade:
- [EX+] Especialidade de Ordem Unida: executar os movimentos a pé firme e em deslocamento. (Parcial) Falta a teoria: 5 objetivos, 15 definições, cadência, 4 tipos de passo e cuidados com a Bandeira Nacional.
- [PE+] Conhecer e saber usar a Bandeira dos Desbravadores, o bandeirim de unidade e os comandos de ordem unida. (Parcial) Hoje, os comandos. Bandeira e bandeirim entram na formatura de segunda.

Material e preparo: Espaço plano, apito

Tempo sugerido: 06:45 às 07:15

O que falar: "Ordem Unida é o clube inteiro se movendo junto. Somos Desbravadores, não militares: é disciplina com alegria."

Passo a passo:
1. Forme o clube por unidades, o capitão na frente de cada coluna.
2. Ensine um comando por vez: mostre, todos fazem devagar, depois no tempo certo.
3. Ordem sugerida: sentido, descansar, cobrir e firme, direita volver, esquerda volver, meia-volta volver.
4. Em marcha: marcar passo, ordinário marche e alto. Sempre rompe com o pé esquerdo.
5. Nos últimos 5 minutos, repita a sequência inteira sem parar. É a mesma da apresentação de segunda.

▶ Voz de comando em 3 partes (Manual Administrativo)
- Advertência: avisa o grupo. Exemplo: "Atenção, clube!"
- Comando: diz o movimento. Exemplo: "Direita..."
- Execução: marca o momento. Exemplo: "VOLVER!" Dê uma pequena pausa antes.
- O instrutor comanda em posição de sentido, de frente para o grupo, com voz clara e firme.

▶ Como é cada posição
- Sentido: imóvel e em silêncio, calcanhares unidos, pontas dos pés abertas, mãos espalmadas nas coxas, olhando para a frente.
- Descansar (só a partir do sentido): o pé esquerdo se afasta para o lado; a mão esquerda segura o punho direito na altura da cintura.
- Cobrir: braço esquerdo estendido para a frente na altura do ombro, palma para baixo (o da frente estende para o lado). Firme: abaixa o braço e volta ao sentido.
- Direita volver: gira 90 graus sobre o calcanhar direito e a planta do pé esquerdo, e une os calcanhares. Esquerda volver: o contrário.
- Meia-volta volver: gira 180 graus pela esquerda.

Segurança:
- Ordem Unida não se treina nas horas do sábado (Manual). Por isso o treino é domingo cedo.

Como avaliar:
- Hoje é treino. A avaliação prática é a apresentação de segunda, 08:00.$$ where id = 22;

update public.atividades set guia_instrutor = $$Objetivo: Conferir a organização do acampamento e avaliar a montagem das barracas.

Requisitos cumpridos nesta atividade:
- [AM] Aprender e montar uma barraca em local apropriado. (Fecha aqui) Montou na sexta; hoje explica o local e ajusta a barraca.
- [AM] Especialidade Acampamento I: saber montar uma barraca, prevenção de incêndio depois de montada e higiene do acampamento. (Parcial)
- [AM+] Especialidade Arte de Acampar: preparar o chão, montar corretamente a barraca e proteger o acampamento. (Parcial)
- [CO] Especialidade Acampamento II: escolher o local das barracas e montar corretamente. (Parcial)
- [PE] Especialidade Acampamento III: prender firmemente uma barraca, tipos de barraca e condensação. (Parcial)

Material e preparo: Ficha de inspeção, prancheta

Tempo sugerido: 08:30 às 08:45

Passo a passo:
1. Formatura: cada unidade em frente à sua barraca.
2. Inspeção com a ficha: barraca esticada, estacas firmes, interior arrumado, calçados na entrada, lixo ensacado, área limpa. Dê os pontos.
3. Em cada barraca, pergunte a um Amigo: por que este lugar é bom? O que nunca pode ter dentro ou perto da barraca? (fogo, vela, lampião)
4. Peça que reapertem os tensores e recravem as estacas inclinadas.
5. Pergunte a um Pesquisador: por que a barraca molha por dentro de manhã? (o ar quente da respiração encosta no teto frio e vira água; resolve abrindo a ventilação e não deixando o sobreteto encostar)

▶ Local apropriado
- Alto, limpo e quase plano.
- Nunca embaixo de árvore, em baixada ou em leito seco de rio.
- Protegido de vento forte, fora de trilha, com água potável perto.
- Fogueira a 5 metros ou mais das barracas.

▶ Tipos de barraca
- Iglu: em forma de cúpula, com varetas flexíveis; fácil de montar.
- Canadense: em forma de A, com 2 mastros.
- Bangalô: alta, com paredes quase retas; para acampamento fixo e famílias.

Como avaliar:
- Amigo: explica por que o local é apropriado e ajusta a barraca sem ajuda. Pode assinar.
- Especialidades: marque os itens feitos na ficha de controle.$$ where id = 25;

update public.atividades set guia_instrutor = $$Objetivo: Duas oficinas ao mesmo tempo: ferramentas de corte com segurança, e nós e amarras. Aos 20 minutos os grupos trocam.

Requisitos cumpridos nesta atividade:
- [AM+] Usar corretamente uma faca, um facão e uma machadinha e conhecer dez regras para usá-los com segurança. (Fecha aqui)
- [PI+] Demonstrar habilidade no uso correto de uma machadinha. (Fecha aqui)
- [AM] Cuidar corretamente de uma corda; fazer e explicar o uso prático dos 14 nós. (Fecha aqui) Os nós são treinados antes. Aqui é conferência.
- [CO] Aprender ou recapitular os 9 nós. (Fecha aqui)
- [PE+] Aprender a fazer quatro amarras básicas e construir um móvel de acampamento. (Fecha com a entrega) Fecha na Grande Pioneiria, quando o móvel ficar pronto.
- [AM] Especialidade Acampamento I: usar corretamente canivete e machadinha e conhecer 10 regras de segurança. (Parcial)

Material e preparo: 1 corda de 1,5 m por desbravador, varas e sisal para as amarras, faca, facão, machadinha, toco firme, lista dos nós

Tempo sugerido: 08:45 às 09:30

O que falar: "Ferramenta de corte não é brinquedo. Quem brinca, perde o direito de usar."

Passo a passo:
1. Divida o clube em 2 grupos. Deixe as duas oficinas afastadas uma da outra.
2. OFICINA A (ferramentas): leia as 10 regras com o grupo sentado, longe do toco.
3. Mostre você primeiro, devagar: faca tirando lascas de um graveto, facão cortando uma vara, machadinha rachando lenha no toco.
4. Chame um desbravador por vez. Os outros esperam sentados, a 3 metros. Ele repete o corte e devolve a ferramenta na bainha antes de chamar o próximo.
5. OFICINA B (nós e amarras): cada um com a sua corda. Chame os nós pelo nome, de 3 em 3. Cada um faz o seu; você olha e não faz por ele.
6. Pergunte para que serve cada nó. Anote na lista quem fez todos.
7. Últimos 8 minutos da oficina B: as 4 amarras, em duplas, com duas varas e sisal.
8. Aos 20 minutos, troque os grupos.

▶ 10 regras de segurança com faca, facão e machadinha
1. Ferramenta não é brinquedo.
2. Mantenha afiada, limpa e seca. Lâmina cega escorrega e machuca.
3. Ninguém a menos de 3 metros de quem está cortando.
4. Corte sempre para longe do corpo.
5. Com facão e machadinha, corte inclinado (em diagonal), nunca em ângulo reto.
6. Apoie a madeira em um toco firme, nunca na perna ou na mão.
7. Não use o cabo nem o lado da lâmina como martelo.
8. Não ande nem corra com a ferramenta fora da bainha.
9. Para entregar, segure pelas costas da lâmina (o lado sem corte) e ofereça o cabo. Só solte quando o outro disser "peguei".
10. Terminou, limpou e guardou na bainha.

▶ Como usar a machadinha
- De joelhos na frente do toco: se errar, a lâmina bate no chão e não na perna.
- Uma mão no fim do cabo. A outra mão fica longe da linha do corte.
- Para rachar lenha fina: encoste a lâmina na ponta da lenha e bata as duas juntas no toco.

▶ Cuidados com a corda
- Guardar seca e enrolada, longe do sol forte.
- Não pisar nem arrastar no chão.
- Arrematar as pontas para não desfiar.

▶ 14 nós do Amigo e para que servem
- Simples: trava a ponta da corda; é a base de outros nós.
- Cego: nó inseguro, que ora desata sozinho, ora emperra. Aprende-se para nunca usar.
- Direito: emenda duas cordas da mesma grossura; fecha ataduras.
- Cirurgião: direito com uma volta a mais; não escorrega.
- Lais de guia: laço que não corre nem aperta; nó de salvamento.
- Lais de guia duplo: dois laços fixos; para sustentar uma pessoa.
- Escota: emenda cordas de grossuras diferentes.
- Catau: encurta a corda sem cortar.
- Pescador: emenda cordas finas ou lisas.
- Fateixa: prende a corda em argola ou estaca.
- Volta do fiel: prende a corda em poste ou vara; começa e termina as amarras.
- Nó de gancho: prende a corda em um gancho.
- Volta da ribeira: arrasta troncos; começa a amarra diagonal.
- Ordinário: une duas cordas com firmeza, mas fica volumoso e é difícil de desatar molhado; também serve de enfeite.

▶ 9 nós do Companheiro
- Oito: trava a corda em um furo ou roldana.
- Volta do salteador: prende e solta com um puxão.
- Caminhoneiro: estica bem uma corda (varal, lona, carga).
- Duplo: confira o desenho no manual de nós do clube.
- Direito, volta do fiel, escota, lais de guia e simples: iguais aos do Amigo.

▶ 4 amarras básicas
- Quadrada: une duas varas em cruz (ângulo reto).
- Diagonal: une duas varas em X, que tendem a se abrir.
- Paralela (ou redonda): une duas varas lado a lado; com três varas faz o tripé.
- Contínua: prende várias varinhas sobre duas varas, como tampo de mesa.
- Toda amarra começa com um nó, tem voltas bem apertadas, o arremate entre as varas e termina com outro nó.

Segurança:
- Na oficina A, no máximo 6 desbravadores por adulto. Só o instrutor entrega e recebe a ferramenta.
- Um desbravador cortando por vez, com o adulto olhando só para ele.
- Ferramentas cortantes são tratadas como elemento de alto risco (Manual). Fora da oficina, ficam guardadas com os líderes.

Como avaliar:
- Amigo da Natureza: usa as 3 ferramentas do jeito certo e diz as 10 regras.
- Pioneiro de Novas Fronteiras: usa a machadinha com segurança, sem precisar de correção.
- Amigo e Companheiro: fazem todos os nós da sua lista sozinhos e dizem o uso. Faltou algum? Mostra de novo na segunda, 09:50.$$ where id = 26;

update public.atividades set guia_instrutor = $$Objetivo: Construir móveis de verdade só com bambu, sisal e amarras, e levantar o portal do clube.

Requisitos cumpridos nesta atividade:
- [PE+] Aprender a fazer quatro amarras básicas e construir um móvel de acampamento. (Fecha aqui)
- [GU] Construir e utilizar um móvel de acampamento em tamanho real, com nós e amarras. (Fecha aqui) O "utilizar" acontece no almoço.
- [GU] Participar com sua unidade de um acampamento com estrutura de pioneiria, planejando o que levar e o que vai acontecer. (Fecha aqui) Vale para o Guia que ajudou no planejamento antes do acampamento.
- [EX+] Com sua unidade, construir cinco móveis de acampamento e um portal para o clube. (Parcial) Aqui sai 1 móvel e o portal. Faltam 4 móveis.
- [EX] Especialidade de Pioneirias: amarras, ferramentas e móveis. (Parcial)

Material e preparo: Bambus ou varas, bastante sisal, serrote ou serra de arco, luvas para carregar bambu, trena, desenho do móvel de cada unidade

Tempo sugerido: 09:30 às 12:00

O que falar: "Móvel bom é o que aguenta uso. Vamos comer nele daqui a pouco."

Passo a passo:
1. (15 min) Projeto: cada unidade mostra o desenho do móvel com as medidas e separa as varas por tamanho. O Guia da unidade coordena.
2. (85 min) Construção: primeiro as pernas e travessas, com amarra quadrada. Depois os reforços em X, com amarra diagonal. Por último o tampo.
3. (10 min) Teste: balance, apoie peso, sente (se for banco). Balançou? Reaperte ou ponha reforço diagonal.
4. (35 min) Portal: todos juntos. Dois postes bem enterrados, travessa amarrada no alto e cordas de sustentação presas em estacas.
5. (5 min) Recolher sobras de sisal e bambu. Guardar as ferramentas com os líderes.

▶ Móveis que cabem no tempo
- Mesa ou bancada de cozinha.
- Porta-panelas ou escorredor.
- Sapateira.
- Lavatório (tripé com bacia).
- Varal ou porta-toalhas.
- Lixeira com tripé.

▶ Regras da pioneiria
- Sem prego, parafuso ou arame: só nós e amarras.
- Use bambu e não corte árvores nem arbustos (Manual).
- Amarra boa não se mexe quando você torce as varas.

Segurança:
- Serrote e serra só com adulto, ou com Guia treinado e adulto ao lado. Luva para carregar bambu (farpas).
- Ninguém sobe nas estruturas. Na hora de levantar o portal, quem não está ajudando fica longe.
- Confira o portal todos os dias. Portal bambo se desmonta.

Como avaliar:
- Pesquisador de Campo e Bosque: fez as amarras do móvel com as próprias mãos.
- Guia: liderou a equipe, e o móvel aguentou o uso no almoço.
- Excursionista na Mata: não assina ainda. Anote 1 móvel e o portal; faltam 4 móveis.$$ where id = 27;

update public.atividades set guia_instrutor = $$Objetivo: Cada unidade cozinha o próprio almoço na fogueira, do fogo ao prato, e come no móvel que construiu.

Requisitos cumpridos nesta atividade:
- [CO+] Preparar uma refeição em uma fogueira durante um acampamento de clube ou unidade. (Fecha aqui)
- [PE] Apresentar seis segredos para um bom acampamento e participar de um acampamento de fim de semana, planejando e cozinhando duas refeições. (Parcial) Aqui faz 1 das 2 refeições. Os seis segredos são na roda de conversa das 19:30.
- [GU] Planejar, preparar e cozinhar três refeições ao ar livre. (Parcial) Aqui faz 1 das 3. Não assina ainda.
- [AM] Especialidade Acampamento I: fazer e comer pão no espeto; manter limpos os utensílios de cozinha. (Parcial)
- [PE] Especialidade Acampamento III: cozinhar uma refeição com alimentos frescos ou secos. (Parcial)
- [PI+] Especialidade Fogueiras e Cozinha ao Ar Livre: cozinhar, assar pão no espeto, preparo seguro, lixo e limpeza. (Parcial)

Material e preparo: Ingredientes e cardápio de cada unidade, panelas, colher de cabo comprido, pano ou luva para panela quente, água tratada, balde de água, sacos de lixo

Tempo sugerido: 12:00 às 13:15

O que falar: "O segredo de cozinhar na fogueira é a brasa, não a chama. E a cozinha só acaba quando a louça está lavada."

Passo a passo:
1. Por volta das 11:20, ainda na pioneiria, um desbravador de cada unidade acende o fogo com um adulto, para ter brasa ao meio-dia.
2. Todos lavam as mãos. O Guia (ou o capitão) divide as funções: fogo, corte, panela, tempero e limpeza.
3. Panela apoiada em duas toras ou pedras, sobre a brasa. Chama alta queima por fora e deixa cru por dentro.
4. Enquanto a panela cozinha, façam o pão no espeto.
5. Oração e almoço no móvel da unidade.
6. Logo depois de comer: lavar a louça, enterrar o lixo orgânico e ensacar o lixo seco.
7. Apagar o fogo com água até esfriar.

▶ Cardápio (Manual Administrativo)
- Sem carne: é a recomendação da Igreja e vale para o clube.
- Um pouco de cada grupo: cereal ou massa, feijão ou outra proteína vegetal, legumes e fruta.
- Não junte macarrão, arroz e batata na mesma refeição.
- Água para cozinhar e beber: filtrada ou fervida.
- Ideias: arroz com lentilha e legumes; macarrão com molho de tomate e legumes; arroz, feijão e ovo mexido; sopa de legumes com macarrão.

▶ Pão no espeto
- Massa: 2 xícaras de farinha de trigo, 1 colher (sopa) de fermento químico, 1 pitada de sal, 1 colher (sopa) de açúcar, 1 colher (sopa) de óleo e água aos poucos, até dar ponto de enrolar.
- Enrole uma tira da massa na ponta de uma vara verde descascada.
- Asse sobre a brasa, girando devagar, por uns 10 minutos, até dourar.

▶ Lixo e louça (Manual Administrativo)
- Lixo orgânico: buraco de 20 cm de largura por 40 cm de fundura, coberto com terra.
- Lixo seco: volta para casa, em saco bem fechado.
- Louça: lavar logo depois da refeição, com pouco sabão e longe do riacho.

▶ Para fechar as refeições do Pesquisador e do Guia neste acampamento
- Deixe que eles planejem e cozinhem também, ao ar livre e com a cozinha do clube, o jantar de domingo e o café de segunda. Com o almoço de hoje, o Pesquisador fecha 2 e o Guia fecha 3.

Segurança:
- Faca de cozinha só com um adulto olhando. Panela quente só com pano ou luva.
- Colher de cabo comprido. Cabelo preso. Ninguém corre perto do fogo.
- Comida que estraga fácil (maionese, queijo, leite, iogurte) não fica fora do gelo.

Como avaliar:
- Companheiro de Excursionismo: ajudou de verdade a preparar a refeição. Pode assinar.
- Pesquisador e Guia: anote "1 refeição feita". Só assina quando completar 2 (Pesquisador) ou 3 (Guia).
- Guia: observe se ele liderou a equipe em vez de fazer tudo sozinho.$$ where id = 28;

update public.atividades set guia_instrutor = $$Objetivo: Saber o que fazer nos primeiros minutos de um acidente, sem piorar a situação, e pedir ajuda certo.

Requisitos cumpridos nesta atividade:
- [PE] Especialidade de Primeiros Socorros – básico. (Parcial) Hoje: o que são primeiros socorros, hemorragia, queimaduras, picada de cobra, de inseto e de aranha, mordida de animal, desidratação e insolação, engasgo (demonstração).
- [EX+] Demonstrar os procedimentos em caso de ferimentos por animais peçonhentos e não peçonhentos. (Fecha aqui) Fecha se o desbravador explicar os dois casos.

Material e preparo: Caixa de primeiros socorros (gaze, atadura, esparadrapo, tesoura, luvas), talas improvisadas, panos, boneco ou almofada, cartaz com 192 e 193

Tempo sugerido: 14:00 às 14:50

O que falar: "Primeiro socorro é o que se faz até a ajuda chegar. A regra número um é: não vire a segunda vítima."

Passo a passo:
1. (5 min) As 3 perguntas de toda emergência: o lugar é seguro para mim? A pessoa responde e respira? Quem vai ligar para o 192 ou 193?
2. (10 min) Sangramento, em duplas: pano limpo em cima do ferimento, apertar firme por 10 minutos sem levantar para olhar. Depois, curativo com gaze e atadura, sem apertar demais.
3. (10 min) Tala, em duplas: uma tala de cada lado do braço ou da perna, pano para acolchoar, amarrar acima e abaixo do machucado. Conferir se os dedos continuam rosados e quentes.
4. (5 min) Queimadura: água fria corrente por 20 minutos. Nada de gelo, manteiga ou pasta de dente. Não estourar bolha.
5. (10 min) Animais: cobra, aranha e escorpião, abelha, mordida de cachorro. Use o quadro abaixo.
6. (5 min) Calor: diferença entre desidratação e insolação.
7. (5 min) Demonstração no boneco ou na almofada: compressões no peito e manobra para engasgo. Ninguém treina em colega.

▶ Telefones
- 192 SAMU. 193 Bombeiros.
- Diga: o que aconteceu, onde está, quantas vítimas e como elas estão. Só desligue quando mandarem.

▶ Animais peçonhentos
- Cobra: acalmar e deitar a pessoa, lavar o local com água e sabão, tirar anel e relógio, não deixar andar e levar ao hospital. NÃO amarrar, NÃO cortar, NÃO chupar. Se der, fotografe a cobra de longe.
- Aranha e escorpião: lavar com água e sabão e levar ao hospital. Em criança é urgente.
- Abelha e vespa: tirar o ferrão raspando com a unha ou um cartão, sem espremer. Lavar e pôr compressa fria. Inchaço no rosto ou falta de ar: ligar 192 na hora.

▶ Animais não peçonhentos
- Mordida de cachorro, gato, morcego ou animal do mato: lavar com bastante água e sabão por 15 minutos, cobrir com pano limpo e ir ao posto de saúde no mesmo dia, por causa da raiva.

▶ Calor
- Desidratação (falta de água): sede, boca seca, xixi escuro, tontura. Sombra, descanso e água aos poucos.
- Insolação (o corpo esquentou demais): pele muito quente, dor de cabeça forte, confusão ou desmaio. É emergência: sombra, molhar o corpo com água fresca e ligar 192.

▶ Sangramento e queimadura grave
- Encharcou o pano? Ponha outro por cima, sem tirar o primeiro. Objeto cravado não se arranca.
- Queimadura grande, funda ou com a roupa grudada: cobrir com pano limpo, não tirar a roupa e ligar 192 ou 193.

Segurança:
- Os líderes ensinam noções básicas e não substituem um profissional. Em caso real, ligue 192 ou 193.
- Compressão no peito e manobra de engasgo só no boneco ou na almofada.

Como avaliar:
- Pesquisador: faz um curativo e uma tala e sabe pedir ajuda. Marque os itens feitos; a especialidade não fica completa hoje.
- Excursionista na Mata: explica o que fazer com picada de cobra e com mordida de cachorro.$$ where id = 30;

update public.atividades set guia_instrutor = $$Objetivo: Treinar, sem pressa, como tirar alguém de um lugar de perigo e levar até a ajuda.

Requisitos cumpridos nesta atividade:
- [PI] Completar a especialidade de Resgate básico. (Parcial) Hoje: cuidados antes de mover a vítima, maca improvisada, transporte com ajuda, nós de resgate e sinais para resgate aéreo. Faltam os resgates em eletricidade, fumaça, fogo e água, e a busca de desaparecidos.

Material e preparo: 2 varas retas de 2 m, cobertor ou 3 casacos, cordas, terreno plano

Tempo sugerido: 14:55 às 15:45

O que falar: "Na vida real, quem não sabe socorrer não mexe na vítima: chama ajuda e espera. O que vamos fazer aqui é treino."

Passo a passo:
1. (8 min) Converse sobre o que fazer antes de mover alguém (quadro abaixo).
2. (12 min) Maca de cobertor: estenda o cobertor, ponha uma vara a um terço da largura e dobre o cobertor sobre ela. Ponha a segunda vara sobre a parte dobrada, perto da borda, e dobre o resto do cobertor por cima das duas varas. O peso da pessoa trava tudo.
3. Maca de casacos: feche 3 casacos, vire as mangas para dentro e passe as varas por dentro das mangas.
4. Teste a maca com um adulto segurando antes de pôr alguém.
5. (12 min) Transporte em 4: dois de cada lado, levantam juntos ao comando e andam em passos curtos, com os pés da vítima na frente. Poucos metros, em terreno plano.
6. (10 min) Sem maca: cadeirinha de 2 pessoas (com 2 e com 4 mãos) e ajudar a vítima a andar apoiada no ombro.
7. (8 min) Nós de resgate: lais de guia em volta da cintura de um colega; emendar cordas com direito, escota e pescador; encurtar com catau.

▶ Antes de mover uma vítima
1. Sua segurança vem primeiro.
2. Olhe os perigos do lugar: fogo, fio, água, barranco.
3. Se der, afaste o perigo em vez de mover a pessoa.
4. Veja se ela responde e respira.
5. Chame ajuda: 192 ou 193.
6. Só mova se ficar ali for mais perigoso. Com suspeita de machucado no pescoço ou nas costas, não mova.

▶ 3 maneiras de chamar um resgate aéreo
- Sinal grande no chão, em lugar aberto: SOS ou um X com pedras, galhos ou roupas.
- Fumaça de dia e fogo de noite.
- Reflexo de espelho, lanterna piscando ou pano colorido agitado.

Segurança:
- A "vítima" é um desbravador leve, e sempre há um adulto junto à cabeça dele.
- Carregar só em terreno plano e por poucos metros. Ninguém brinca de cair ou de soltar.

Como avaliar:
- O grupo monta a maca, levanta junto e transporta sem balançar. Marque os itens feitos; a especialidade não fica completa hoje e o requisito do Pioneiro não é assinado ainda.$$ where id = 31;

update public.atividades set guia_instrutor = $$Objetivo: Agradecer a Deus pelo acampamento e ouvir de cada unidade o que mais marcou.

Requisitos cumpridos nesta atividade:
- [CO] Participar em um acampamento de fim de semana e fazer um relatório destacando o que mais lhe impressionou positivamente. (Fecha com a entrega) Fecha com o relatório escrito, entregue depois.
- [CO] Especialidade Acampamento II: tomar parte em um culto no acampamento (história, testemunho ou cânticos). (Parcial)
- [EX] Discussão em grupo, dirigida pelo conselheiro, depois da expedição de 20 km. (Treino) É treino. A expedição de 20 km fica para outra saída.

Material e preparo: Lenha, balde de água, caderno e caneta

Tempo sugerido: 17:45 às 19:30

O que falar: "Guarde na memória o que mais marcou você aqui. É isso que vai para o seu relatório."

Passo a passo:
1. Cânticos e oração. Um ou dois Companheiros podem dirigir os cânticos ou contar um testemunho (combine antes).
2. Mensagem curta, ligada ao tema do acampamento.
3. Relatos: cada unidade responde "o que mais nos impressionou?". Mais de um fala.
4. Cada unidade apresenta o seu móvel; todos juntos, o portal.
5. Conversa final em 3 perguntas: o que mais gostei? O que foi difícil? O que eu faria diferente? Anote as respostas para a avaliação do acampamento.
6. Explique o relatório do Companheiro e combine o prazo de entrega.

▶ Modelo de relatório do Companheiro (1 página)
- Nome, unidade, data e local do acampamento.
- O que fizemos (lista curta).
- O que mais me impressionou e por quê. É a parte principal.
- O que aprendi.
- O que eu faria diferente.

Segurança:
- Não peça a uma unidade, na hora, para dirigir o culto. Isso se combina com pelo menos 3 semanas de antecedência (Manual).

Como avaliar:
- Companheiro: só assina quando entregar o relatório escrito por ele mesmo.$$ where id = 34;

update public.atividades set guia_instrutor = $$Objetivo: Transformar a experiência da caminhada de sábado em aprendizado: andar com segurança, não se perder e acampar bem.

Requisitos cumpridos nesta atividade:
- [AM] Apresentar 10 regras para uma caminhada e explicar o que fazer quando estiver perdido. (Fecha aqui)
- [EX+] Demonstrar técnicas para percorrer trilhas em diferentes tipos de terreno: desertos, florestas, pântanos e rios. (Fecha aqui) Fecha para quem explicar e mostrar.
- [PE] Apresentar seis segredos para um bom acampamento (primeira parte do requisito). (Parcial) O requisito só fecha com as duas refeições cozinhadas.
- [AM] Especialidade Acampamento I: saber oito coisas a fazer quando se está perdido. (Parcial)
- [CO] Especialidade Acampamento II: itens que afetam a escolha de um bom local de acampamento. (Parcial)
- [PE] Especialidade Acampamento III: revisar seis pontos importantes na escolha do local. (Parcial)

Material e preparo: Cartaz com as 10 regras, cartaz em branco e caneta, 1 apito

Tempo sugerido: 19:30 às 20:15

O que falar: "Ontem a gente caminhou. Hoje vamos descobrir quais regras usamos sem perceber."

Passo a passo:
1. (5 min) Pergunte: na caminhada de ontem, o que fizemos certo? O que poderia ter dado errado?
2. (12 min) 10 regras: entregue 2 regras para cada unidade. Ela lê e explica o porquê de cada uma. Depois cada Amigo diz 3 regras sem olhar.
3. (10 min) Perdido: um Amigo faz de conta que se perdeu. O grupo vai dizendo o que ele deve fazer, até completar as 8 atitudes. Treinem os 3 apitos.
4. (8 min) Seis segredos: cada unidade diz um. Escreva no cartaz até completar os 6.
5. (8 min) Terrenos: os Excursionistas na Mata mostram como andar em floresta, brejo, rio e areia.
6. (2 min) Oração e boa-noite.

▶ 10 regras para uma caminhada (do Manual Administrativo)
1. Planeje antes: caminho, distância, horário e o que fazer em emergência. Os pais autorizam.
2. Fila indiana, o menor na frente. Ninguém se afasta do grupo.
3. Ande no passo do mais lento e faça paradas para descansar.
4. Em estrada, ande na contramão, de frente para os carros.
5. Roupa clara e adequada ao clima.
6. Calçado confortável e já usado, nunca novo.
7. Mãos livres e mochila bem arrumada.
8. Água em pequenos goles, sem esperar a sede, e lanche leve.
9. Caixa de primeiros socorros e apito sempre junto.
10. Sem gritaria, sem lixo no chão, sem estragar a natureza.

▶ 8 atitudes de quem está perdido
1. Pare. Andar sem rumo afasta você de quem está procurando.
2. Acalme-se e ore.
3. Sente, beba água e pense: por onde eu vim? Qual foi a última coisa que eu vi?
4. Fique onde está. Se estiver com outros, fiquem juntos.
5. Faça sinal: 3 apitos, espere, escute e repita. Três de qualquer coisa é pedido de socorro.
6. Fique visível: lugar aberto, perto de onde parou, com uma roupa colorida à mostra.
7. Proteja-se do frio, da chuva e do sol. Poupe água e energia.
8. Só ande se tiver certeza do caminho, marcando por onde passa. De noite, não ande.

▶ 6 segredos para um bom acampamento
- O cartão não traz uma lista fixa. Use os 6 pontos de escolha do local das especialidades Acampamento II e III:
- Vento: lugar protegido de vento forte.
- Água: potável e por perto, mas sem risco de enchente.
- Vida silvestre: longe de formigueiro, ninho, toca e trilha de animais.
- Madeira: ter lenha e bambu, sem destruir árvores.
- Tempo: olhar a previsão e para onde a água da chuva corre.
- Boa vontade: ter a autorização do dono e respeitar os vizinhos.

▶ Como andar em cada terreno
- Floresta: fila indiana, um braço protegendo o rosto. Segure o galho até o de trás pegar. Olhe onde pisa e onde põe a mão.
- Subida e descida: passos curtos e ritmo constante. Na descida, joelhos dobrados e nada de correr.
- Pântano ou brejo: teste o chão com um bastão, pise em raízes e touceiras e mantenha distância do colega.
- Rio: só no raso e onde a água corre devagar. Solte o cinto da mochila, use um bastão, não tire o calçado. Correnteza forte: não atravesse.
- Deserto ou areia com sol forte: ande cedo ou no fim da tarde, cubra a cabeça e a nuca, beba água aos poucos e descanse na sombra.

Como avaliar:
- Amigo: diz pelo menos 8 das 10 regras e explica por que quem se perde deve ficar parado. Pode assinar.
- Excursionista na Mata: mostra a técnica de cada terreno. Pode assinar.
- Pesquisador: diz os 6 segredos. Anote que a primeira parte está feita.$$ where id = 49;

update public.atividades set guia_instrutor = $$Objetivo: Apresentar a Ordem Unida treinada no domingo. É a avaliação prática.

Requisitos cumpridos nesta atividade:
- [EX+] Especialidade de Ordem Unida: executar os movimentos a pé firme e em deslocamento. (Parcial) Falta a parte teórica e os cuidados com a Bandeira Nacional.
- [PE+] Conhecer e saber usar a Bandeira dos Desbravadores, o bandeirim de unidade e os comandos de ordem unida. (Fecha aqui) Fecha se o desbravador participar do hasteamento, portar o bandeirim e executar os comandos.

Material e preparo: Bandeiras, bandeirins das unidades, apito

Tempo sugerido: 08:00 às 08:30

Passo a passo:
1. Hasteamento das bandeiras, Voto e Lei.
2. Cada unidade se apresenta, comandada pelo seu capitão, com o bandeirim à frente.
3. Sequência: sentido, descansar, cobrir, firme, direita volver, esquerda volver, meia-volta volver, ordinário marche, alto.
4. Um líder avalia com uma ficha simples: todos juntos? Posição correta? Silêncio?
5. Deixe um Excursionista na Mata comandar o clube inteiro por um minuto.

▶ Lembretes
- Voz de comando: advertência, comando e execução, com uma pequena pausa antes da execução.
- Bandeirim: vai com o capitão, à frente da unidade.
- Bandeiras: a Nacional é hasteada primeiro e arriada por último, e nunca toca o chão.

Como avaliar:
- Excursionista na Mata: marque a parte prática na ficha; a especialidade fica completa quando ele fizer a teoria.
- Pesquisador de Campo e Bosque: pode assinar se cumpriu as três partes.$$ where id = 39;

update public.atividades set guia_instrutor = $$Objetivo: Aprender a deixar a água segura para beber e lembrar que Jesus é a água da vida.

Requisitos cumpridos nesta atividade:
- [AM] Aprender e demonstrar uma maneira de purificar a água e escrever um parágrafo destacando o significado de Jesus como a água da vida. (Fecha aqui) Precisa das duas coisas: demonstrar e entregar o parágrafo.
- [EX+] Especialidade Vida Silvestre: demonstrar três maneiras de purificar água para beber. (Parcial)

Material e preparo: Panela e fogareiro, garrafas PET transparentes, pano limpo, areia, carvão, cascalho, água turva, hipoclorito de sódio 2,5% com conta-gotas, papel e lápis, Bíblia

Tempo sugerido: 08:30 às 09:10

O que falar: "Água clarinha pode estar cheia de micróbios. Na dúvida, trate antes de beber."

Passo a passo:
1. (5 min) Mostre dois copos: água turva e água clara do riacho. Qual dá para beber? Nenhuma das duas, sem tratar.
2. (8 min) Ferver: deixe a água em fervura forte por 1 minuto. Tampe e espere esfriar.
3. (5 min) Hipoclorito de sódio 2,5%: 2 gotas para cada litro, misture e espere 30 minutos.
4. (5 min) Sol: garrafa PET transparente, de até 2 litros, cheia e deitada ao sol forte por 6 horas.
5. (5 min) Filtro de garrafa PET: pano, areia, carvão e cascalho. Mostre que a água sai mais clara, mas explique que o filtro não mata micróbios. Depois dele ainda é preciso ferver ou usar o hipoclorito.
6. (12 min) Cada Amigo demonstra uma maneira para um colega. Depois leiam João 4:13-14 e cada Amigo escreve o seu parágrafo (4 ou 5 linhas).

▶ Jesus, a água da vida
- João 4:13-14: quem bebe da água que Jesus dá nunca mais terá sede.
- João 7:37: se alguém tem sede, venha a Mim e beba.
- Ideia para o parágrafo: sem água limpa o corpo adoece e morre; sem Jesus o coração fica vazio. Ele limpa, renova e nunca falta.

▶ Erros comuns
- Beber a água do filtro sem tratar.
- Usar água sanitária com perfume ou colorida.
- Garrafa verde, riscada ou opaca no método do sol.

Segurança:
- Só o adulto mexe na panela com água fervendo e pinga o hipoclorito.

Como avaliar:
- Amigo: demonstra uma maneira, explica por que funciona e entrega o parágrafo. Pode assinar.$$ where id = 40;

update public.atividades set guia_instrutor = $$Objetivo: Descobrir onde ficam o Norte, o Sul, o Leste e o Oeste usando só o sol.

Requisitos cumpridos nesta atividade:
- [CO] Descobrir os pontos cardeais sem a ajuda de uma bússola e desenhar uma rosa dos ventos. (Fecha aqui)
- [EX+] Especialidade Vida Silvestre: conhecer três métodos de identificar os pontos cardeais sem bússola. (Parcial)
- [PI+] Especialidade Mapa e Bússola: direção sem bússola e os 8 pontos com seus graus. (Parcial)

Material e preparo: 1 vara reta de 1 m, pedrinhas, papel, lápis de cor, relógio de ponteiros, desenho do Cruzeiro do Sul

Tempo sugerido: 09:10 às 09:50

O que falar: "O sol é uma bússola que nunca fica sem pilha."

Passo a passo:
1. (3 min) Finque a vara bem reta em um lugar plano e com sol. Marque a ponta da sombra com uma pedra: é a 1ª marca.
2. (15 min de espera) Enquanto isso, ensine os outros métodos (quadro abaixo) e comecem a rosa dos ventos no papel.
3. (5 min) Marque a nova ponta da sombra: é a 2ª marca. Risque uma linha ligando as duas. A 1ª marca é o Oeste e a 2ª é o Leste.
4. Ponha o pé esquerdo na 1ª marca e o direito na 2ª: você está olhando para o Norte. Atrás de você fica o Sul.
5. (12 min) Cada Companheiro aponta os 4 pontos cardeais sem ajuda e termina a rosa dos ventos com os 8 pontos.
6. (5 min) Jogo rápido: você grita um ponto ("Sudeste!") e todos apontam.

▶ Outros métodos
- Sol nascente: de manhã cedo, aponte o braço direito para onde o sol nasceu (Leste). À sua frente está o Norte.
- Relógio de ponteiros (no hemisfério sul): aponte o número 12 para o sol. O Norte fica no meio do caminho entre o 12 e o ponteiro das horas. É um método aproximado: perto do meio-dia, e no Norte e Nordeste do Brasil, prefira a sombra da vara.
- Cruzeiro do Sul (de noite): estique o braço maior da cruz 4 vezes e meia, na direção do pé da cruz. Desse ponto, desça em linha reta até o horizonte: ali é o Sul.

▶ Rosa dos ventos: 8 pontos e graus
- N Norte 0°, NE Nordeste 45°, L Leste 90°, SE Sudeste 135°.
- S Sul 180°, SO Sudoeste 225°, O Oeste 270°, NO Noroeste 315°.

Segurança:
- Nunca olhe direto para o sol. Se o dia estiver nublado, faça a parte da rosa dos ventos e deixe a sombra para quando o sol abrir.

Como avaliar:
- Companheiro: aponta os 4 pontos cardeais sem ajuda e entrega a rosa dos ventos certa. Pode assinar.$$ where id = 41;

update public.atividades set guia_instrutor = $$Objetivo: Montar um quadro bonito com 15 nós, para ficar na sala do clube.

Requisitos cumpridos nesta atividade:
- [CO+] Preparar um quadro com 15 nós diferentes. (Fecha aqui) O quadro é da unidade, mas o Companheiro de Excursionismo precisa ter feito os nós com as próprias mãos.
- [AM] Fazer e explicar o uso dos 14 nós (segunda chance para quem ficou devendo). (Fecha aqui)
- [CO] Aprender ou recapitular os 9 nós (segunda chance). (Fecha aqui)

Material e preparo: 1 tábua ou papelão grosso por unidade, cordas finas, cola quente (só adulto usa), etiquetas, caneta

Tempo sugerido: 09:50 às 10:30

Passo a passo:
1. (5 min) Mostre um quadro pronto, ou um desenho, e distribua o material.
2. (5 min) A unidade escolhe os 15 nós e divide quem faz qual. Os nós do Amigo e do Companheiro juntos já passam de 15.
3. (20 min) Cada um faz os seus nós com corda fina, confere com o instrutor e só depois fixa na tábua.
4. (5 min) Etiqueta com o nome embaixo de cada nó. Em cima, o nome da unidade e a data.
5. (5 min) Conferência final: 15 nós diferentes, certos e firmes.
6. Enquanto isso, quem ficou devendo nós de domingo mostra para o instrutor.

▶ Dicas
- Nós que prendem em alguma coisa (volta do fiel, fateixa) ficam melhores amarrados em um palito ou graveto.
- Organize do mais fácil para o mais difícil.
- Corda de duas cores ajuda a enxergar as emendas (direito, escota, pescador).

Segurança:
- Cola quente queima: só o adulto usa a pistola.

Como avaliar:
- Quadro com 15 nós diferentes, corretos e com nome. O Companheiro de Excursionismo fez a parte dele sozinho.$$ where id = 42;

update public.atividades set guia_instrutor = $$Objetivo: Duas técnicas para não se perder: seguir um rumo com a bússola e deixar sinais de pista.

Requisitos cumpridos nesta atividade:
- [AM] Aprender os sinais de pista; preparar e seguir uma pista de no mínimo 10 sinais, que outros também consigam seguir. (Fecha aqui)
- [PE] Aprender a usar uma bússola ou GPS e demonstrar a habilidade encontrando endereços em zona urbana. (Parcial) Aqui aprende a bússola. A parte na cidade fica para depois.
- [PI+] Completar a especialidade de Mapa e Bússola. (Parcial) Aqui: partes da bússola, azimute e contra-azimute.
- [EX+] Especialidade Vida Silvestre: seguir um percurso com 3 azimutes e mais de 1.200 metros. (Treino) O percurso daqui é curto. Vale como treino.

Material e preparo: 1 bússola por dupla, estacas numeradas, cartão do percurso, cartaz dos sinais de pista, gravetos e pedras soltos

Tempo sugerido: 10:30 às 11:20

O que falar: "Azimute é o número que diz para que lado ir. Pista é um recado deixado no chão para quem vem atrás."

Passo a passo:
1. Divida em 2 grupos: um começa na bússola e o outro na pista. Aos 25 minutos, trocam.
2. BÚSSOLA (25 min): mostre as partes. Bússola deitada na palma da mão, na altura do peito, longe de celular e de ferro.
3. Gire o anel até o número do azimute ficar na marca. Depois gire o corpo inteiro até a agulha vermelha entrar na seta do fundo. A seta de direção aponta o caminho.
4. Escolha uma árvore ou pedra nessa direção, ande até ela contando os passos do cartão e repita nos 3 azimutes, até o tesouro.
5. Para voltar, use o contra-azimute: some 180 se o azimute for menor que 180; tire 180 se for maior.
6. PISTA (25 min): mostre os sinais do cartaz e monte 3 no chão para o grupo decifrar.
7. Cada metade do grupo monta uma pista de 10 sinais, com material solto do chão, e a outra metade segue. Depois trocam.
8. No fim, quem montou desmancha todos os sinais.

▶ Azimute
- É o ângulo, em graus, contado a partir do Norte no sentido do relógio.
- Norte 0°, Leste 90°, Sul 180°, Oeste 270°.
- Exemplo de percurso: 40° por 20 passos, 160° por 15 passos, 280° por 25 passos.

▶ 10 sinais de pista
1. Seta: siga por aqui.
2. Seta dobrada para a direita: vire à direita.
3. Seta dobrada para a esquerda: vire à esquerda.
4. X: caminho errado, não siga.
5. Seta com um traço atravessado: obstáculo à frente.
6. Seta com duas pontas abertas (Y): o grupo se divide.
7. Quadrado com seta e pedrinhas: mensagem escondida a tantos passos (uma pedrinha por passo).
8. Linhas onduladas com seta: água boa para beber nessa direção. Com um X em cima: água ruim.
9. Triângulo com seta: acampamento nessa direção.
10. Círculo com um ponto no meio: fim da pista.
- Os desenhos mudam um pouco de um manual para outro. Use um só padrão no clube: o do cartaz impresso.

▶ Regras da pista
- Sinais do lado direito do caminho, em lugar bem visível.
- Sempre marcar os cruzamentos.
- Só material solto: gravetos caídos, pedras, folhas. Nada de arrancar planta, pintar ou riscar árvore.

Segurança:
- O percurso é montado e conferido antes pelos líderes, em área aberta e à vista. Ninguém sai sozinho.

Como avaliar:
- Amigo: reconhece os sinais, monta a pista com o grupo e segue a pista do outro grupo até o fim. Pode assinar.
- Pioneiro de Novas Fronteiras: chega ao tesouro pelos 3 azimutes e sabe calcular o contra-azimute. Marque na ficha.$$ where id = 43;

update public.atividades set guia_instrutor = $$Objetivo: Saber improvisar um abrigo contra chuva, vento e sol, e usar um de verdade.

Requisitos cumpridos nesta atividade:
- [GU+] Projetar três tipos diferentes de abrigo, explicar seu uso e utilizar um deles em um acampamento. (Fecha aqui) O Guia de Exploração desenha os 3, explica e usa o abrigo montado.

Material e preparo: 2 ou 3 lonas, cordas de 5 m, estacas, varas, papel e lápis para os projetos

Tempo sugerido: 11:20 às 12:10

O que falar: "Um abrigo bem feito é a diferença entre uma noite ruim e uma noite segura."

Passo a passo:
1. (10 min) Cada Guia de Exploração desenha em uma folha os 3 tipos de abrigo e escreve embaixo para que serve cada um. Os outros acompanham.
2. (5 min) Os Guias apresentam os desenhos ao clube.
3. (5 min) Escolham o local: plano, sem galho seco por cima, fora de baixada.
4. (20 min) Construção, com os Guias liderando: corda bem esticada entre duas árvores, lona por cima, pontas presas com estacas e caimento para a água escorrer.
5. (5 min) Teste: o grupo entra, e um líder joga um pouco de água em cima para ver se escorre.
6. (5 min) O abrigo fica montado. Será a sombra do almoço e do tempo livre. Desmonta antes do encerramento.

▶ 3 tipos de abrigo
- Lona em A: corda entre duas árvores, lona por cima caindo para os dois lados. Protege de chuva e vento dos dois lados. Bom em mata e bosque.
- Meia-água: lona presa no alto de um lado e no chão do outro, de costas para o vento. Rápido de montar. Com um fogo refletor na frente, aquece bem.
- Galhos e folhas: uma vara comprida apoiada em um tronco, galhos encostados dos dois lados e uma camada grossa de folhas secas. Para quando não há lona. Bom em floresta.
- Em lugar de pedra: use um paredão como parede e feche o outro lado. Em brejo: durma fora do chão, em cama de varas.

Segurança:
- Sem galhos soltos por cima. Não cortar galhos verdes: use material caído. Corda na altura do peito, não do pescoço.

Como avaliar:
- Guia de Exploração: entregou os 3 projetos, explicou o uso de cada um e usou o abrigo montado. Pode assinar.$$ where id = 44;

update public.atividades set guia_instrutor = $$Objetivo: Desmontar com ordem, arrumar bem a mochila e deixar o lugar melhor do que estava.

Requisitos cumpridos nesta atividade:
- [PI] Participar de um acampamento de fim de semana, arrumando de forma apropriada a mochila com o equipamento pessoal. (Fecha aqui)
- [PE+] Participar de uma caminhada de 10 km e fazer uma lista dos equipamentos, incluindo roupa e calçado. (Parcial) Aqui faz só a lista. A caminhada de 10 km fica para outra saída.
- [AM] Especialidade Acampamento I: praticar o lema "não levar nada além de fotos, não deixar nada além de pegadas, não matar nada além do tempo". (Parcial)
- [AM+] Especialidade Arte de Acampar: deixar o local como se ninguém tivesse estado ali. (Parcial)
- [CO] Especialidade Acampamento II: limpar, secar e guardar uma barraca; enrolar saco de dormir. (Parcial)
- [PE] Especialidade Acampamento III: itens de barraca e de cuidado com o local. (Parcial)

Material e preparo: Sacos de lixo, pá, balde, capas das barracas, papel e lápis

Tempo sugerido: 12:10 às 14:10

O que falar: "Desbravador não deixa rastro. Só vamos embora quando ninguém conseguir dizer que acampamos aqui."

Passo a passo:
1. (20 min) Móveis e portal: desfazer as amarras, enrolar o sisal e empilhar os bambus.
2. (15 min) Fogueiras: apagar com água, espalhar as cinzas frias, recolocar as placas de grama e tampar os buracos de lixo orgânico.
3. (30 min) Mochila: cada um arruma a sua. Os Pioneiros mostram ao instrutor como arrumaram.
4. (30 min) Barracas: tirar tudo de dentro, varrer, deixar secar ao sol, dobrar e guardar com as estacas contadas.
5. (10 min) Os Pesquisadores de Campo e Bosque escrevem a lista de equipamento, roupa e calçado para uma caminhada.
6. (15 min) Operação pente-fino: todos em linha, lado a lado, atravessando o terreno e recolhendo qualquer lixo, mesmo o que não é nosso.

▶ Mochila bem arrumada
- Saco de dormir no fundo.
- Coisas pesadas no meio, encostadas nas costas.
- Roupas em sacos plásticos, por tipo.
- Em cima e nos bolsos, o que se usa toda hora: capa de chuva, lanterna, água e lanche.
- Nada pendurado por fora. O peso vai no quadril, com o cinto fechado.
- Peso total: no máximo 15% do peso do desbravador.

▶ Regras de saída (Manual Administrativo)
- Fazer o pente-fino depois de tudo carregado.
- Lixo seco volta com o clube.
- Fechar as porteiras e deixar o local limpo, se possível melhor que antes.

Segurança:
- Fogo só está apagado quando dá para pôr a mão nas cinzas. Estacas e ferramentas são contadas antes de guardar.

Como avaliar:
- Pioneiro: mochila arrumada do jeito certo, sem ajuda. Pode assinar.
- Pesquisador de Campo e Bosque: guarde a lista; o requisito só fecha com a caminhada de 10 km.$$ where id = 45;

update public.atividades set guia_instrutor = $$Objetivo: Registrar com honestidade o que cada um cumpriu e encerrar agradecendo a Deus.

Material e preparo: Cartões de classe, canetas, ficha de controle dos requisitos

Tempo sugerido: 17:15 às 18:00

O que falar: "A assinatura no cartão diz que você fez de verdade. Por isso a gente só assina o que foi cumprido por inteiro."

Passo a passo:
1. Arriamento das bandeiras.
2. Abra a tabela "Requisitos por classe" (no fim deste guia) e chame os desbravadores por classe.
3. Requisito marcado como "fecha aqui" e cumprido pelo desbravador: o instrutor assina no cartão.
4. Requisito "parcial" ou "treino": não assina. Anote na ficha de controle o que foi feito e o que falta.
5. Requisito que "fecha depois": lembre o prazo do relatório ou do parágrafo.
6. Prêmio da melhor unidade, agradecimentos e oração final.
7. Antes de sair: contagem dos desbravadores e entrega de cada um ao seu responsável.

▶ Regra de assinatura (Manual Administrativo)
- O instrutor só assina depois que o requisito foi cumprido e avaliado.
- A assinatura atesta o cumprimento integral do requisito.
- Assinar por assinar ensina que a classe pode ser feita de qualquer jeito.
- A investidura depende da avaliação final do regional ou distrital.

Como avaliar:
- Em até uma semana, a liderança se reúne para avaliar o acampamento nas áreas física, mental e espiritual (Manual).$$ where id = 47;

insert into public.tarefas (id, fase, descricao, requisitos, feito, ordem) values
  (1, 'ANTES', 'Cada unidade planeja o cardápio (sem carne) da refeição que vai cozinhar no domingo e faz a lista de compras.', 'Planejar a refeição (Pesquisador, Guia)', false, 1),
  (2, 'ANTES', 'Os Guias planejam o acampamento com a liderança: o que levar e o que vai acontecer.', 'Acampamento com estrutura de pioneiria (Guia)', false, 2),
  (3, 'ANTES', 'Enviar aos pais o comunicado e a lista do que levar. Recolher a autorização de saída assinada e a ficha de saúde de cada desbravador.', 'Manual Administrativo', false, 3),
  (4, 'ANTES', 'Conferir o seguro anual de todos os participantes e a aprovação da saída pela comissão da igreja.', 'Manual Administrativo', false, 4),
  (5, 'ANTES', 'Treinar os nós e a fogueira nas reuniões antes do acampamento, para que lá seja só prática e avaliação.', 'Nós (Amigo, Companheiro); fogueiras (Manual Administrativo)', false, 5),
  (6, 'ANTES', 'Liderança: separar bambus, sisal e lenha seca (no sábado não se apanha lenha), reconhecer a trilha de 6 km e montar o percurso dos azimutes.', '', false, 6),
  (7, 'ANTES', 'Cada unidade prepara a sua atividade de natureza para o sábado à tarde. Quem vai dirigir devocional ou culto é avisado com 3 semanas de antecedência.', 'Excursionista na Mata; Manual Administrativo', false, 7),
  (8, 'ANTES', 'Imprimir: lista dos nós, 10 regras das ferramentas, cartaz dos sinais de pista, 10 regras de caminhada, ficha de inspeção e ficha de controle dos requisitos.', '', false, 8),
  (9, 'DEPOIS', 'Relatório escrito do acampamento, destacando o que mais impressionou.', 'Companheiro', false, 9),
  (10, 'DEPOIS', 'Relatório de uma página da caminhada de 6 km.', 'Companheiro de Excursionismo', false, 10),
  (11, 'DEPOIS', 'Parágrafo sobre Jesus, a água da vida, para quem não entregou no acampamento.', 'Amigo', false, 11),
  (12, 'DEPOIS', 'Reunião da liderança, em até uma semana, para avaliar o acampamento (áreas física, mental e espiritual).', 'Manual Administrativo', false, 12),
  (13, 'FORA', 'Caminhada de 10 km (Pesquisador de Campo e Bosque, Pioneiro de Novas Fronteiras); expedição de 20 km com pernoite (Excursionista); refeições que faltarem ao Pesquisador (2) e ao Guia (3); os outros 4 móveis (Excursionista na Mata); bússola ou GPS em zona urbana (Pesquisador); Excursionismo pedestre com mochila (Companheiro de Excursionismo); mestrado em Vida Campestre (Guia de Exploração); parte teórica de Ordem Unida; itens restantes das especialidades iniciadas no acampamento.', 'Programar uma saída específica', false, 13);
select setval(pg_get_serial_sequence('public.tarefas','id'), (select max(id) from public.tarefas));
