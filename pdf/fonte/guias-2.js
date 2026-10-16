// Guias do instrutor: domingo (do almoço em diante) e segunda-feira.
const G = {};
const r = (classe, texto, sit, obs = '') => ({ classe, texto, sit, obs });

G[28] = {
  objetivo: 'Cada unidade cozinha o próprio almoço na fogueira, do fogo ao prato, e come no móvel que construiu.',
  req: [
    r('CO+', 'Preparar uma refeição em uma fogueira durante um acampamento de clube ou unidade.', 'C'),
    r('PE', 'Apresentar seis segredos para um bom acampamento e participar de um acampamento de fim de semana, planejando e cozinhando duas refeições.', 'P', 'Aqui faz 1 das 2 refeições. Os seis segredos são na roda de conversa das 19:30.'),
    r('GU', 'Planejar, preparar e cozinhar três refeições ao ar livre.', 'P', 'Aqui faz 1 das 3. Não assina ainda.'),
    r('AM', 'Especialidade Acampamento I: fazer e comer pão no espeto; manter limpos os utensílios de cozinha.', 'P'),
    r('PE', 'Especialidade Acampamento III: cozinhar uma refeição com alimentos frescos ou secos.', 'P'),
    r('PI+', 'Especialidade Fogueiras e Cozinha ao Ar Livre: cozinhar, assar pão no espeto, preparo seguro, lixo e limpeza.', 'P'),
  ],
  fala: 'O segredo de cozinhar na fogueira é a brasa, não a chama. E a cozinha só acaba quando a louça está lavada.',
  passos: [
    'Por volta das 11:20, ainda na pioneiria, um desbravador de cada unidade acende o fogo com um adulto, para ter brasa ao meio-dia.',
    'Todos lavam as mãos. O Guia (ou o capitão) divide as funções: fogo, corte, panela, tempero e limpeza.',
    'Panela apoiada em duas toras ou pedras, sobre a brasa. Chama alta queima por fora e deixa cru por dentro.',
    'Enquanto a panela cozinha, façam o pão no espeto.',
    'Oração e almoço no móvel da unidade.',
    'Logo depois de comer: lavar a louça, enterrar o lixo orgânico e ensacar o lixo seco.',
    'Apagar o fogo com água até esfriar.',
  ],
  cola: [
    ['Cardápio (Manual Administrativo)', [
      'Sem carne: é a recomendação da Igreja e vale para o clube.',
      'Um pouco de cada grupo: cereal ou massa, feijão ou outra proteína vegetal, legumes e fruta.',
      'Não junte macarrão, arroz e batata na mesma refeição.',
      'Água para cozinhar e beber: filtrada ou fervida.',
      'Ideias: arroz com lentilha e legumes; macarrão com molho de tomate e legumes; arroz, feijão e ovo mexido; sopa de legumes com macarrão.',
    ]],
    ['Pão no espeto', [
      'Massa: 2 xícaras de farinha de trigo, 1 colher (sopa) de fermento químico, 1 pitada de sal, 1 colher (sopa) de açúcar, 1 colher (sopa) de óleo e água aos poucos, até dar ponto de enrolar.',
      'Enrole uma tira da massa na ponta de uma vara verde descascada.',
      'Asse sobre a brasa, girando devagar, por uns 10 minutos, até dourar.',
    ]],
    ['Lixo e louça (Manual Administrativo)', [
      'Lixo orgânico: buraco de 20 cm de largura por 40 cm de fundura, coberto com terra.',
      'Lixo seco: volta para casa, em saco bem fechado.',
      'Louça: lavar logo depois da refeição, com pouco sabão e longe do riacho.',
    ]],
    ['Para fechar as refeições do Pesquisador e do Guia neste acampamento', ['Deixe que eles planejem e cozinhem também, ao ar livre e com a cozinha do clube, o jantar de domingo e o café de segunda. Com o almoço de hoje, o Pesquisador fecha 2 e o Guia fecha 3.']],
  ],
  cuidado: [
    'Faca de cozinha só com um adulto olhando. Panela quente só com pano ou luva.',
    'Colher de cabo comprido. Cabelo preso. Ninguém corre perto do fogo.',
    'Comida que estraga fácil (maionese, queijo, leite, iogurte) não fica fora do gelo.',
  ],
  avaliar: [
    'Companheiro de Excursionismo: ajudou de verdade a preparar a refeição. Pode assinar.',
    'Pesquisador e Guia: anote "1 refeição feita". Só assina quando completar 2 (Pesquisador) ou 3 (Guia).',
    'Guia: observe se ele liderou a equipe em vez de fazer tudo sozinho.',
  ],
};

G[30] = {
  objetivo: 'Saber o que fazer nos primeiros minutos de um acidente, sem piorar a situação, e pedir ajuda certo.',
  req: [
    r('PE', 'Especialidade de Primeiros Socorros – básico.', 'P', 'Hoje: o que são primeiros socorros, hemorragia, queimaduras, picada de cobra, de inseto e de aranha, mordida de animal, desidratação e insolação, engasgo (demonstração).'),
    r('EX+', 'Demonstrar os procedimentos em caso de ferimentos por animais peçonhentos e não peçonhentos.', 'C', 'Fecha se o desbravador explicar os dois casos.'),
  ],
  fala: 'Primeiro socorro é o que se faz até a ajuda chegar. A regra número um é: não vire a segunda vítima.',
  passos: [
    '(5 min) As 3 perguntas de toda emergência: o lugar é seguro para mim? A pessoa responde e respira? Quem vai ligar para o 192 ou 193?',
    '(10 min) Sangramento, em duplas: pano limpo em cima do ferimento, apertar firme por 10 minutos sem levantar para olhar. Depois, curativo com gaze e atadura, sem apertar demais.',
    '(10 min) Tala, em duplas: uma tala de cada lado do braço ou da perna, pano para acolchoar, amarrar acima e abaixo do machucado. Conferir se os dedos continuam rosados e quentes.',
    '(5 min) Queimadura: água fria corrente por 20 minutos. Nada de gelo, manteiga ou pasta de dente. Não estourar bolha.',
    '(10 min) Animais: cobra, aranha e escorpião, abelha, mordida de cachorro. Use o quadro abaixo.',
    '(5 min) Calor: diferença entre desidratação e insolação.',
    '(5 min) Demonstração no boneco ou na almofada: compressões no peito e manobra para engasgo. Ninguém treina em colega.',
  ],
  cola: [
    ['Telefones', ['192 SAMU. 193 Bombeiros.', 'Diga: o que aconteceu, onde está, quantas vítimas e como elas estão. Só desligue quando mandarem.']],
    ['Animais peçonhentos', [
      'Cobra: acalmar e deitar a pessoa, lavar o local com água e sabão, tirar anel e relógio, não deixar andar e levar ao hospital. NÃO amarrar, NÃO cortar, NÃO chupar. Se der, fotografe a cobra de longe.',
      'Aranha e escorpião: lavar com água e sabão e levar ao hospital. Em criança é urgente.',
      'Abelha e vespa: tirar o ferrão raspando com a unha ou um cartão, sem espremer. Lavar e pôr compressa fria. Inchaço no rosto ou falta de ar: ligar 192 na hora.',
    ]],
    ['Animais não peçonhentos', ['Mordida de cachorro, gato, morcego ou animal do mato: lavar com bastante água e sabão por 15 minutos, cobrir com pano limpo e ir ao posto de saúde no mesmo dia, por causa da raiva.']],
    ['Calor', [
      'Desidratação (falta de água): sede, boca seca, xixi escuro, tontura. Sombra, descanso e água aos poucos.',
      'Insolação (o corpo esquentou demais): pele muito quente, dor de cabeça forte, confusão ou desmaio. É emergência: sombra, molhar o corpo com água fresca e ligar 192.',
    ]],
    ['Sangramento e queimadura grave', [
      'Encharcou o pano? Ponha outro por cima, sem tirar o primeiro. Objeto cravado não se arranca.',
      'Queimadura grande, funda ou com a roupa grudada: cobrir com pano limpo, não tirar a roupa e ligar 192 ou 193.',
    ]],
  ],
  cuidado: [
    'Os líderes ensinam noções básicas e não substituem um profissional. Em caso real, ligue 192 ou 193.',
    'Compressão no peito e manobra de engasgo só no boneco ou na almofada.',
  ],
  avaliar: [
    'Pesquisador: faz um curativo e uma tala e sabe pedir ajuda. Marque os itens feitos; a especialidade não fica completa hoje.',
    'Excursionista na Mata: explica o que fazer com picada de cobra e com mordida de cachorro.',
  ],
};

G[31] = {
  objetivo: 'Treinar, sem pressa, como tirar alguém de um lugar de perigo e levar até a ajuda.',
  req: [
    r('PI', 'Completar a especialidade de Resgate básico.', 'P', 'Hoje: cuidados antes de mover a vítima, maca improvisada, transporte com ajuda, nós de resgate e sinais para resgate aéreo. Faltam os resgates em eletricidade, fumaça, fogo e água, e a busca de desaparecidos.'),
  ],
  fala: 'Na vida real, quem não sabe socorrer não mexe na vítima: chama ajuda e espera. O que vamos fazer aqui é treino.',
  passos: [
    '(8 min) Converse sobre o que fazer antes de mover alguém (quadro abaixo).',
    '(12 min) Maca de cobertor: estenda o cobertor, ponha uma vara a um terço da largura e dobre o cobertor sobre ela. Ponha a segunda vara sobre a parte dobrada, perto da borda, e dobre o resto do cobertor por cima das duas varas. O peso da pessoa trava tudo.',
    'Maca de casacos: feche 3 casacos, vire as mangas para dentro e passe as varas por dentro das mangas.',
    'Teste a maca com um adulto segurando antes de pôr alguém.',
    '(12 min) Transporte em 4: dois de cada lado, levantam juntos ao comando e andam em passos curtos, com os pés da vítima na frente. Poucos metros, em terreno plano.',
    '(10 min) Sem maca: cadeirinha de 2 pessoas (com 2 e com 4 mãos) e ajudar a vítima a andar apoiada no ombro.',
    '(8 min) Nós de resgate: lais de guia em volta da cintura de um colega; emendar cordas com direito, escota e pescador; encurtar com catau.',
  ],
  cola: [
    ['Antes de mover uma vítima', [
      '1. Sua segurança vem primeiro.',
      '2. Olhe os perigos do lugar: fogo, fio, água, barranco.',
      '3. Se der, afaste o perigo em vez de mover a pessoa.',
      '4. Veja se ela responde e respira.',
      '5. Chame ajuda: 192 ou 193.',
      '6. Só mova se ficar ali for mais perigoso. Com suspeita de machucado no pescoço ou nas costas, não mova.',
    ]],
    ['3 maneiras de chamar um resgate aéreo', ['Sinal grande no chão, em lugar aberto: SOS ou um X com pedras, galhos ou roupas.', 'Fumaça de dia e fogo de noite.', 'Reflexo de espelho, lanterna piscando ou pano colorido agitado.']],
  ],
  cuidado: [
    'A "vítima" é um desbravador leve, e sempre há um adulto junto à cabeça dele.',
    'Carregar só em terreno plano e por poucos metros. Ninguém brinca de cair ou de soltar.',
  ],
  avaliar: ['O grupo monta a maca, levanta junto e transporta sem balançar. Marque os itens feitos; a especialidade não fica completa hoje e o requisito do Pioneiro não é assinado ainda.'],
};

G[34] = {
  objetivo: 'Agradecer a Deus pelo acampamento e ouvir de cada unidade o que mais marcou.',
  req: [
    r('CO', 'Participar em um acampamento de fim de semana e fazer um relatório destacando o que mais lhe impressionou positivamente.', 'D', 'Fecha com o relatório escrito, entregue depois.'),
    r('CO', 'Especialidade Acampamento II: tomar parte em um culto no acampamento (história, testemunho ou cânticos).', 'P'),
    r('EX', 'Discussão em grupo, dirigida pelo conselheiro, depois da expedição de 20 km.', 'T', 'É treino. A expedição de 20 km fica para outra saída.'),
  ],
  fala: 'Guarde na memória o que mais marcou você aqui. É isso que vai para o seu relatório.',
  passos: [
    'Cânticos e oração. Um ou dois Companheiros podem dirigir os cânticos ou contar um testemunho (combine antes).',
    'Mensagem curta, ligada ao tema do acampamento.',
    'Relatos: cada unidade responde "o que mais nos impressionou?". Mais de um fala.',
    'Cada unidade apresenta o seu móvel; todos juntos, o portal.',
    'Conversa final em 3 perguntas: o que mais gostei? O que foi difícil? O que eu faria diferente? Anote as respostas para a avaliação do acampamento.',
    'Explique o relatório do Companheiro e combine o prazo de entrega.',
  ],
  cola: [['Modelo de relatório do Companheiro (1 página)', [
    'Nome, unidade, data e local do acampamento.',
    'O que fizemos (lista curta).',
    'O que mais me impressionou e por quê. É a parte principal.',
    'O que aprendi.',
    'O que eu faria diferente.',
  ]]],
  cuidado: ['Não peça a uma unidade, na hora, para dirigir o culto. Isso se combina com pelo menos 3 semanas de antecedência (Manual).'],
  avaliar: ['Companheiro: só assina quando entregar o relatório escrito por ele mesmo.'],
};

G[49] = {
  objetivo: 'Transformar a experiência da caminhada de sábado em aprendizado: andar com segurança, não se perder e acampar bem.',
  req: [
    r('AM', 'Apresentar 10 regras para uma caminhada e explicar o que fazer quando estiver perdido.', 'C'),
    r('EX+', 'Demonstrar técnicas para percorrer trilhas em diferentes tipos de terreno: desertos, florestas, pântanos e rios.', 'C', 'Fecha para quem explicar e mostrar.'),
    r('PE', 'Apresentar seis segredos para um bom acampamento (primeira parte do requisito).', 'P', 'O requisito só fecha com as duas refeições cozinhadas.'),
    r('AM', 'Especialidade Acampamento I: saber oito coisas a fazer quando se está perdido.', 'P'),
    r('CO', 'Especialidade Acampamento II: itens que afetam a escolha de um bom local de acampamento.', 'P'),
    r('PE', 'Especialidade Acampamento III: revisar seis pontos importantes na escolha do local.', 'P'),
  ],
  fala: 'Ontem a gente caminhou. Hoje vamos descobrir quais regras usamos sem perceber.',
  passos: [
    '(5 min) Pergunte: na caminhada de ontem, o que fizemos certo? O que poderia ter dado errado?',
    '(12 min) 10 regras: entregue 2 regras para cada unidade. Ela lê e explica o porquê de cada uma. Depois cada Amigo diz 3 regras sem olhar.',
    '(10 min) Perdido: um Amigo faz de conta que se perdeu. O grupo vai dizendo o que ele deve fazer, até completar as 8 atitudes. Treinem os 3 apitos.',
    '(8 min) Seis segredos: cada unidade diz um. Escreva no cartaz até completar os 6.',
    '(8 min) Terrenos: os Excursionistas na Mata mostram como andar em floresta, brejo, rio e areia.',
    '(2 min) Oração e boa-noite.',
  ],
  cola: [
    ['10 regras para uma caminhada (do Manual Administrativo)', [
      '1. Planeje antes: caminho, distância, horário e o que fazer em emergência. Os pais autorizam.',
      '2. Fila indiana, o menor na frente. Ninguém se afasta do grupo.',
      '3. Ande no passo do mais lento e faça paradas para descansar.',
      '4. Em estrada, ande na contramão, de frente para os carros.',
      '5. Roupa clara e adequada ao clima.',
      '6. Calçado confortável e já usado, nunca novo.',
      '7. Mãos livres e mochila bem arrumada.',
      '8. Água em pequenos goles, sem esperar a sede, e lanche leve.',
      '9. Caixa de primeiros socorros e apito sempre junto.',
      '10. Sem gritaria, sem lixo no chão, sem estragar a natureza.',
    ]],
    ['8 atitudes de quem está perdido', [
      '1. Pare. Andar sem rumo afasta você de quem está procurando.',
      '2. Acalme-se e ore.',
      '3. Sente, beba água e pense: por onde eu vim? Qual foi a última coisa que eu vi?',
      '4. Fique onde está. Se estiver com outros, fiquem juntos.',
      '5. Faça sinal: 3 apitos, espere, escute e repita. Três de qualquer coisa é pedido de socorro.',
      '6. Fique visível: lugar aberto, perto de onde parou, com uma roupa colorida à mostra.',
      '7. Proteja-se do frio, da chuva e do sol. Poupe água e energia.',
      '8. Só ande se tiver certeza do caminho, marcando por onde passa. De noite, não ande.',
    ]],
    ['6 segredos para um bom acampamento', [
      'O cartão não traz uma lista fixa. Use os 6 pontos de escolha do local das especialidades Acampamento II e III:',
      'Vento: lugar protegido de vento forte.',
      'Água: potável e por perto, mas sem risco de enchente.',
      'Vida silvestre: longe de formigueiro, ninho, toca e trilha de animais.',
      'Madeira: ter lenha e bambu, sem destruir árvores.',
      'Tempo: olhar a previsão e para onde a água da chuva corre.',
      'Boa vontade: ter a autorização do dono e respeitar os vizinhos.',
    ]],
    ['Como andar em cada terreno', [
      'Floresta: fila indiana, um braço protegendo o rosto. Segure o galho até o de trás pegar. Olhe onde pisa e onde põe a mão.',
      'Subida e descida: passos curtos e ritmo constante. Na descida, joelhos dobrados e nada de correr.',
      'Pântano ou brejo: teste o chão com um bastão, pise em raízes e touceiras e mantenha distância do colega.',
      'Rio: só no raso e onde a água corre devagar. Solte o cinto da mochila, use um bastão, não tire o calçado. Correnteza forte: não atravesse.',
      'Deserto ou areia com sol forte: ande cedo ou no fim da tarde, cubra a cabeça e a nuca, beba água aos poucos e descanse na sombra.',
    ]],
  ],
  avaliar: [
    'Amigo: diz pelo menos 8 das 10 regras e explica por que quem se perde deve ficar parado. Pode assinar.',
    'Excursionista na Mata: mostra a técnica de cada terreno. Pode assinar.',
    'Pesquisador: diz os 6 segredos. Anote que a primeira parte está feita.',
  ],
};

G[39] = {
  objetivo: 'Apresentar a Ordem Unida treinada no domingo. É a avaliação prática.',
  req: [
    r('EX+', 'Especialidade de Ordem Unida: executar os movimentos a pé firme e em deslocamento.', 'P', 'Falta a parte teórica e os cuidados com a Bandeira Nacional.'),
    r('PE+', 'Conhecer e saber usar a Bandeira dos Desbravadores, o bandeirim de unidade e os comandos de ordem unida.', 'C', 'Fecha se o desbravador participar do hasteamento, portar o bandeirim e executar os comandos.'),
  ],
  passos: [
    'Hasteamento das bandeiras, Voto e Lei.',
    'Cada unidade se apresenta, comandada pelo seu capitão, com o bandeirim à frente.',
    'Sequência: sentido, descansar, cobrir, firme, direita volver, esquerda volver, meia-volta volver, ordinário marche, alto.',
    'Um líder avalia com uma ficha simples: todos juntos? Posição correta? Silêncio?',
    'Deixe um Excursionista na Mata comandar o clube inteiro por um minuto.',
  ],
  cola: [['Lembretes', [
    'Voz de comando: advertência, comando e execução, com uma pequena pausa antes da execução.',
    'Bandeirim: vai com o capitão, à frente da unidade.',
    'Bandeiras: a Nacional é hasteada primeiro e arriada por último, e nunca toca o chão.',
  ]]],
  avaliar: ['Excursionista na Mata: marque a parte prática na ficha; a especialidade fica completa quando ele fizer a teoria.', 'Pesquisador de Campo e Bosque: pode assinar se cumpriu as três partes.'],
};

G[40] = {
  objetivo: 'Aprender a deixar a água segura para beber e lembrar que Jesus é a água da vida.',
  req: [
    r('AM', 'Aprender e demonstrar uma maneira de purificar a água e escrever um parágrafo destacando o significado de Jesus como a água da vida.', 'C', 'Precisa das duas coisas: demonstrar e entregar o parágrafo.'),
    r('EX+', 'Especialidade Vida Silvestre: demonstrar três maneiras de purificar água para beber.', 'P'),
  ],
  fala: 'Água clarinha pode estar cheia de micróbios. Na dúvida, trate antes de beber.',
  passos: [
    '(5 min) Mostre dois copos: água turva e água clara do riacho. Qual dá para beber? Nenhuma das duas, sem tratar.',
    '(8 min) Ferver: deixe a água em fervura forte por 1 minuto. Tampe e espere esfriar.',
    '(5 min) Hipoclorito de sódio 2,5%: 2 gotas para cada litro, misture e espere 30 minutos.',
    '(5 min) Sol: garrafa PET transparente, de até 2 litros, cheia e deitada ao sol forte por 6 horas.',
    '(5 min) Filtro de garrafa PET: pano, areia, carvão e cascalho. Mostre que a água sai mais clara, mas explique que o filtro não mata micróbios. Depois dele ainda é preciso ferver ou usar o hipoclorito.',
    '(12 min) Cada Amigo demonstra uma maneira para um colega. Depois leiam João 4:13-14 e cada Amigo escreve o seu parágrafo (4 ou 5 linhas).',
  ],
  cola: [
    ['Jesus, a água da vida', ['João 4:13-14: quem bebe da água que Jesus dá nunca mais terá sede.', 'João 7:37: se alguém tem sede, venha a Mim e beba.', 'Ideia para o parágrafo: sem água limpa o corpo adoece e morre; sem Jesus o coração fica vazio. Ele limpa, renova e nunca falta.']],
    ['Erros comuns', ['Beber a água do filtro sem tratar.', 'Usar água sanitária com perfume ou colorida.', 'Garrafa verde, riscada ou opaca no método do sol.']],
  ],
  cuidado: ['Só o adulto mexe na panela com água fervendo e pinga o hipoclorito.'],
  avaliar: ['Amigo: demonstra uma maneira, explica por que funciona e entrega o parágrafo. Pode assinar.'],
};

G[41] = {
  objetivo: 'Descobrir onde ficam o Norte, o Sul, o Leste e o Oeste usando só o sol.',
  req: [
    r('CO', 'Descobrir os pontos cardeais sem a ajuda de uma bússola e desenhar uma rosa dos ventos.', 'C'),
    r('EX+', 'Especialidade Vida Silvestre: conhecer três métodos de identificar os pontos cardeais sem bússola.', 'P'),
    r('PI+', 'Especialidade Mapa e Bússola: direção sem bússola e os 8 pontos com seus graus.', 'P'),
  ],
  fala: 'O sol é uma bússola que nunca fica sem pilha.',
  passos: [
    '(3 min) Finque a vara bem reta em um lugar plano e com sol. Marque a ponta da sombra com uma pedra: é a 1ª marca.',
    '(15 min de espera) Enquanto isso, ensine os outros métodos (quadro abaixo) e comecem a rosa dos ventos no papel.',
    '(5 min) Marque a nova ponta da sombra: é a 2ª marca. Risque uma linha ligando as duas. A 1ª marca é o Oeste e a 2ª é o Leste.',
    'Ponha o pé esquerdo na 1ª marca e o direito na 2ª: você está olhando para o Norte. Atrás de você fica o Sul.',
    '(12 min) Cada Companheiro aponta os 4 pontos cardeais sem ajuda e termina a rosa dos ventos com os 8 pontos.',
    '(5 min) Jogo rápido: você grita um ponto ("Sudeste!") e todos apontam.',
  ],
  cola: [
    ['Outros métodos', [
      'Sol nascente: de manhã cedo, aponte o braço direito para onde o sol nasceu (Leste). À sua frente está o Norte.',
      'Relógio de ponteiros (no hemisfério sul): aponte o número 12 para o sol. O Norte fica no meio do caminho entre o 12 e o ponteiro das horas. É um método aproximado: perto do meio-dia, e no Norte e Nordeste do Brasil, prefira a sombra da vara.',
      'Cruzeiro do Sul (de noite): estique o braço maior da cruz 4 vezes e meia, na direção do pé da cruz. Desse ponto, desça em linha reta até o horizonte: ali é o Sul.',
    ]],
    ['Rosa dos ventos: 8 pontos e graus', ['N Norte 0°, NE Nordeste 45°, L Leste 90°, SE Sudeste 135°.', 'S Sul 180°, SO Sudoeste 225°, O Oeste 270°, NO Noroeste 315°.']],
  ],
  cuidado: ['Nunca olhe direto para o sol. Se o dia estiver nublado, faça a parte da rosa dos ventos e deixe a sombra para quando o sol abrir.'],
  avaliar: ['Companheiro: aponta os 4 pontos cardeais sem ajuda e entrega a rosa dos ventos certa. Pode assinar.'],
};

G[42] = {
  objetivo: 'Montar um quadro bonito com 15 nós, para ficar na sala do clube.',
  req: [
    r('CO+', 'Preparar um quadro com 15 nós diferentes.', 'C', 'O quadro é da unidade, mas o Companheiro de Excursionismo precisa ter feito os nós com as próprias mãos.'),
    r('AM', 'Fazer e explicar o uso dos 14 nós (segunda chance para quem ficou devendo).', 'C'),
    r('CO', 'Aprender ou recapitular os 9 nós (segunda chance).', 'C'),
  ],
  passos: [
    '(5 min) Mostre um quadro pronto, ou um desenho, e distribua o material.',
    '(5 min) A unidade escolhe os 15 nós e divide quem faz qual. Os nós do Amigo e do Companheiro juntos já passam de 15.',
    '(20 min) Cada um faz os seus nós com corda fina, confere com o instrutor e só depois fixa na tábua.',
    '(5 min) Etiqueta com o nome embaixo de cada nó. Em cima, o nome da unidade e a data.',
    '(5 min) Conferência final: 15 nós diferentes, certos e firmes.',
    'Enquanto isso, quem ficou devendo nós de domingo mostra para o instrutor.',
  ],
  cola: [['Dicas', ['Nós que prendem em alguma coisa (volta do fiel, fateixa) ficam melhores amarrados em um palito ou graveto.', 'Organize do mais fácil para o mais difícil.', 'Corda de duas cores ajuda a enxergar as emendas (direito, escota, pescador).']]],
  cuidado: ['Cola quente queima: só o adulto usa a pistola.'],
  avaliar: ['Quadro com 15 nós diferentes, corretos e com nome. O Companheiro de Excursionismo fez a parte dele sozinho.'],
};

G[43] = {
  objetivo: 'Duas técnicas para não se perder: seguir um rumo com a bússola e deixar sinais de pista.',
  req: [
    r('AM', 'Aprender os sinais de pista; preparar e seguir uma pista de no mínimo 10 sinais, que outros também consigam seguir.', 'C'),
    r('PE', 'Aprender a usar uma bússola ou GPS e demonstrar a habilidade encontrando endereços em zona urbana.', 'P', 'Aqui aprende a bússola. A parte na cidade fica para depois.'),
    r('PI+', 'Completar a especialidade de Mapa e Bússola.', 'P', 'Aqui: partes da bússola, azimute e contra-azimute.'),
    r('EX+', 'Especialidade Vida Silvestre: seguir um percurso com 3 azimutes e mais de 1.200 metros.', 'T', 'O percurso daqui é curto. Vale como treino.'),
  ],
  fala: 'Azimute é o número que diz para que lado ir. Pista é um recado deixado no chão para quem vem atrás.',
  passos: [
    'Divida em 2 grupos: um começa na bússola e o outro na pista. Aos 25 minutos, trocam.',
    'BÚSSOLA (25 min): mostre as partes. Bússola deitada na palma da mão, na altura do peito, longe de celular e de ferro.',
    'Gire o anel até o número do azimute ficar na marca. Depois gire o corpo inteiro até a agulha vermelha entrar na seta do fundo. A seta de direção aponta o caminho.',
    'Escolha uma árvore ou pedra nessa direção, ande até ela contando os passos do cartão e repita nos 3 azimutes, até o tesouro.',
    'Para voltar, use o contra-azimute: some 180 se o azimute for menor que 180; tire 180 se for maior.',
    'PISTA (25 min): mostre os sinais do cartaz e monte 3 no chão para o grupo decifrar.',
    'Cada metade do grupo monta uma pista de 10 sinais, com material solto do chão, e a outra metade segue. Depois trocam.',
    'No fim, quem montou desmancha todos os sinais.',
  ],
  cola: [
    ['Azimute', ['É o ângulo, em graus, contado a partir do Norte no sentido do relógio.', 'Norte 0°, Leste 90°, Sul 180°, Oeste 270°.', 'Exemplo de percurso: 40° por 20 passos, 160° por 15 passos, 280° por 25 passos.']],
    ['10 sinais de pista', [
      '1. Seta: siga por aqui.',
      '2. Seta dobrada para a direita: vire à direita.',
      '3. Seta dobrada para a esquerda: vire à esquerda.',
      '4. X: caminho errado, não siga.',
      '5. Seta com um traço atravessado: obstáculo à frente.',
      '6. Seta com duas pontas abertas (Y): o grupo se divide.',
      '7. Quadrado com seta e pedrinhas: mensagem escondida a tantos passos (uma pedrinha por passo).',
      '8. Linhas onduladas com seta: água boa para beber nessa direção. Com um X em cima: água ruim.',
      '9. Triângulo com seta: acampamento nessa direção.',
      '10. Círculo com um ponto no meio: fim da pista.',
      'Os desenhos mudam um pouco de um manual para outro. Use um só padrão no clube: o do cartaz impresso.',
    ]],
    ['Regras da pista', ['Sinais do lado direito do caminho, em lugar bem visível.', 'Sempre marcar os cruzamentos.', 'Só material solto: gravetos caídos, pedras, folhas. Nada de arrancar planta, pintar ou riscar árvore.']],
  ],
  cuidado: ['O percurso é montado e conferido antes pelos líderes, em área aberta e à vista. Ninguém sai sozinho.'],
  avaliar: [
    'Amigo: reconhece os sinais, monta a pista com o grupo e segue a pista do outro grupo até o fim. Pode assinar.',
    'Pioneiro de Novas Fronteiras: chega ao tesouro pelos 3 azimutes e sabe calcular o contra-azimute. Marque na ficha.',
  ],
};

G[44] = {
  objetivo: 'Saber improvisar um abrigo contra chuva, vento e sol, e usar um de verdade.',
  req: [
    r('GU+', 'Projetar três tipos diferentes de abrigo, explicar seu uso e utilizar um deles em um acampamento.', 'C', 'O Guia de Exploração desenha os 3, explica e usa o abrigo montado.'),
  ],
  fala: 'Um abrigo bem feito é a diferença entre uma noite ruim e uma noite segura.',
  passos: [
    '(10 min) Cada Guia de Exploração desenha em uma folha os 3 tipos de abrigo e escreve embaixo para que serve cada um. Os outros acompanham.',
    '(5 min) Os Guias apresentam os desenhos ao clube.',
    '(5 min) Escolham o local: plano, sem galho seco por cima, fora de baixada.',
    '(20 min) Construção, com os Guias liderando: corda bem esticada entre duas árvores, lona por cima, pontas presas com estacas e caimento para a água escorrer.',
    '(5 min) Teste: o grupo entra, e um líder joga um pouco de água em cima para ver se escorre.',
    '(5 min) O abrigo fica montado. Será a sombra do almoço e do tempo livre. Desmonta antes do encerramento.',
  ],
  cola: [['3 tipos de abrigo', [
    'Lona em A: corda entre duas árvores, lona por cima caindo para os dois lados. Protege de chuva e vento dos dois lados. Bom em mata e bosque.',
    'Meia-água: lona presa no alto de um lado e no chão do outro, de costas para o vento. Rápido de montar. Com um fogo refletor na frente, aquece bem.',
    'Galhos e folhas: uma vara comprida apoiada em um tronco, galhos encostados dos dois lados e uma camada grossa de folhas secas. Para quando não há lona. Bom em floresta.',
    'Em lugar de pedra: use um paredão como parede e feche o outro lado. Em brejo: durma fora do chão, em cama de varas.',
  ]]],
  cuidado: ['Sem galhos soltos por cima. Não cortar galhos verdes: use material caído. Corda na altura do peito, não do pescoço.'],
  avaliar: ['Guia de Exploração: entregou os 3 projetos, explicou o uso de cada um e usou o abrigo montado. Pode assinar.'],
};

G[45] = {
  objetivo: 'Desmontar com ordem, arrumar bem a mochila e deixar o lugar melhor do que estava.',
  req: [
    r('PI', 'Participar de um acampamento de fim de semana, arrumando de forma apropriada a mochila com o equipamento pessoal.', 'C'),
    r('PE+', 'Participar de uma caminhada de 10 km e fazer uma lista dos equipamentos, incluindo roupa e calçado.', 'P', 'Aqui faz só a lista. A caminhada de 10 km fica para outra saída.'),
    r('AM', 'Especialidade Acampamento I: praticar o lema "não levar nada além de fotos, não deixar nada além de pegadas, não matar nada além do tempo".', 'P'),
    r('AM+', 'Especialidade Arte de Acampar: deixar o local como se ninguém tivesse estado ali.', 'P'),
    r('CO', 'Especialidade Acampamento II: limpar, secar e guardar uma barraca; enrolar saco de dormir.', 'P'),
    r('PE', 'Especialidade Acampamento III: itens de barraca e de cuidado com o local.', 'P'),
  ],
  fala: 'Desbravador não deixa rastro. Só vamos embora quando ninguém conseguir dizer que acampamos aqui.',
  passos: [
    '(20 min) Móveis e portal: desfazer as amarras, enrolar o sisal e empilhar os bambus.',
    '(15 min) Fogueiras: apagar com água, espalhar as cinzas frias, recolocar as placas de grama e tampar os buracos de lixo orgânico.',
    '(30 min) Mochila: cada um arruma a sua. Os Pioneiros mostram ao instrutor como arrumaram.',
    '(30 min) Barracas: tirar tudo de dentro, varrer, deixar secar ao sol, dobrar e guardar com as estacas contadas.',
    '(10 min) Os Pesquisadores de Campo e Bosque escrevem a lista de equipamento, roupa e calçado para uma caminhada.',
    '(15 min) Operação pente-fino: todos em linha, lado a lado, atravessando o terreno e recolhendo qualquer lixo, mesmo o que não é nosso.',
  ],
  cola: [
    ['Mochila bem arrumada', [
      'Saco de dormir no fundo.',
      'Coisas pesadas no meio, encostadas nas costas.',
      'Roupas em sacos plásticos, por tipo.',
      'Em cima e nos bolsos, o que se usa toda hora: capa de chuva, lanterna, água e lanche.',
      'Nada pendurado por fora. O peso vai no quadril, com o cinto fechado.',
      'Peso total: no máximo 15% do peso do desbravador.',
    ]],
    ['Regras de saída (Manual Administrativo)', ['Fazer o pente-fino depois de tudo carregado.', 'Lixo seco volta com o clube.', 'Fechar as porteiras e deixar o local limpo, se possível melhor que antes.']],
  ],
  cuidado: ['Fogo só está apagado quando dá para pôr a mão nas cinzas. Estacas e ferramentas são contadas antes de guardar.'],
  avaliar: [
    'Pioneiro: mochila arrumada do jeito certo, sem ajuda. Pode assinar.',
    'Pesquisador de Campo e Bosque: guarde a lista; o requisito só fecha com a caminhada de 10 km.',
  ],
};

G[47] = {
  objetivo: 'Registrar com honestidade o que cada um cumpriu e encerrar agradecendo a Deus.',
  req: [],
  fala: 'A assinatura no cartão diz que você fez de verdade. Por isso a gente só assina o que foi cumprido por inteiro.',
  passos: [
    'Arriamento das bandeiras.',
    'Abra a tabela "Requisitos por classe" (no fim deste guia) e chame os desbravadores por classe.',
    'Requisito marcado como "fecha aqui" e cumprido pelo desbravador: o instrutor assina no cartão.',
    'Requisito "parcial" ou "treino": não assina. Anote na ficha de controle o que foi feito e o que falta.',
    'Requisito que "fecha depois": lembre o prazo do relatório ou do parágrafo.',
    'Prêmio da melhor unidade, agradecimentos e oração final.',
    'Antes de sair: contagem dos desbravadores e entrega de cada um ao seu responsável.',
  ],
  cola: [['Regra de assinatura (Manual Administrativo)', [
    'O instrutor só assina depois que o requisito foi cumprido e avaliado.',
    'A assinatura atesta o cumprimento integral do requisito.',
    'Assinar por assinar ensina que a classe pode ser feita de qualquer jeito.',
    'A investidura depende da avaliação final do regional ou distrital.',
  ]]],
  avaliar: ['Em até uma semana, a liderança se reúne para avaliar o acampamento nas áreas física, mental e espiritual (Manual).'],
};

module.exports = G;
