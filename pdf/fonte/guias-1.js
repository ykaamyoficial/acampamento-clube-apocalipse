// Guias do instrutor: sexta, sábado e manhã de domingo.
// Situação do requisito: C = fecha aqui | D = fecha depois, com a entrega | P = parcial (não assina ainda) | T = treino
const G = {};
const r = (classe, texto, sit, obs = '') => ({ classe, texto, sit, obs });

G[1] = {
  objetivo: 'Receber todo mundo com segurança e garantir que ninguém passe a noite sem o essencial.',
  req: [],
  passos: [
    'Um líder fica na entrada com a pasta de segurança e recebe de cada desbravador a autorização assinada e a ficha de saúde.',
    'Recolha os remédios e anote nome, dose e horário. Pergunte sobre alergias (comida, picada de inseto, remédio).',
    'Cada conselheiro confere com a sua unidade só 4 coisas: saco de dormir ou cobertor, agasalho, lanterna e garrafa de água.',
    'Faltou algo essencial? Resolva agora com material reserva do clube.',
    'Mostre onde ficam o banheiro, a água potável e a barraca dos líderes.',
  ],
  cuidado: [
    'Menor de idade sem autorização assinada pelo responsável não fica no acampamento (Manual Administrativo).',
    'O seguro anual cobre só membros ativos e cadastrados. Confira se todos estão no cadastro.',
    'Deixe anotado o hospital mais próximo e teste o sinal de celular no local.',
  ],
  avaliar: ['Nada é assinado agora. A mochila do Pioneiro é avaliada na segunda-feira, na desmontagem.'],
};

G[2] = {
  objetivo: 'Montar só o que é preciso para dormir. A aula sobre barraca fica para o domingo.',
  req: [],
  fala: 'Hoje a gente monta rápido e em paz, porque o sábado já começou. No domingo cada unidade vai me explicar por que escolheu este lugar.',
  passos: [
    'Antes de soltar as unidades, dois líderes percorrem o terreno com lanterna e marcam onde cada barraca vai ficar.',
    'Meninas de um lado, meninos do outro. As barracas dos líderes ficam no meio, entre as duas alas.',
    'Cada unidade monta a sua barraca: lona no chão, varas, estacas inclinadas (apontando para fora) e sobreteto esticado, sem encostar na barraca de dentro.',
    'Dentro da barraca: mochilas no fundo, calçados na entrada, lanterna à mão.',
    'Nada de móveis, portal, fogueira ou corte de madeira hoje.',
  ],
  cola: [
    ['Onde montar (Manual Administrativo)', [
      'Lugar alto, limpo e quase plano (uma inclinação leve ajuda a água a escorrer).',
      'Nunca embaixo de árvore: galho pode cair, atrai raio e fica pingando depois da chuva.',
      'Nunca em baixada, leito seco de rio ou no meio de uma trilha.',
      'Protegido de vento forte e longe de formigueiro.',
    ]],
    ['Por que só o essencial', [
      'O Manual pede que tudo esteja pronto antes do pôr do sol de sexta e que não se monte acampamento na sexta à noite.',
      'Como a chegada é à noite, faça só o necessário para dormir e, nos próximos acampamentos, planeje chegar antes do pôr do sol.',
    ]],
  ],
  cuidado: ['Olhe para cima antes de escolher o lugar. Ninguém anda sozinho no escuro. Cuidado com estacas e cordas no caminho.'],
  avaliar: ['Só observe quem participou da montagem. A conversa sobre o local e a assinatura são na inspeção de domingo, 08:30.'],
};

G[4] = {
  objetivo: 'Terminar o primeiro dia adorando a Deus sob o céu. É culto, não é aula.',
  req: [],
  fala: 'Os céus proclamam a glória de Deus. Vamos ficar em silêncio um minuto e só olhar.',
  passos: [
    'Apaguem as lanternas por 2 minutos, para os olhos se acostumarem com o escuro.',
    'Um desbravador lê o Salmo 19:1-4. Pergunte: o que o céu está contando sobre Deus agora?',
    'Outro lê o Salmo 8:3-4. Cada unidade agradece a Deus por uma coisa da criação.',
    'Cântico calmo, oração e avisos para o sábado. Depois, silêncio.',
  ],
  cola: [
    ['Por que não procurar o Cruzeiro do Sul hoje', [
      'Em outubro o Cruzeiro do Sul se põe logo no começo da noite. Às 21:45 ele já está abaixo do horizonte em quase todo o Brasil.',
      'Para ver: domingo ou segunda, por volta das 5 da manhã, baixo no horizonte a sudeste. Nessa hora Órion (as Três Marias) está bem alto, ao norte.',
      'Os pontos cardeais sem bússola (Companheiro) são feitos na segunda, 09:10, pelo sol.',
    ]],
  ],
  avaliar: ['Nada é assinado. As 10 regras de caminhada e os 6 segredos do bom acampamento foram para a roda de conversa de domingo, 19:30.'],
};

G[13] = {
  objetivo: 'Passeio de observação da natureza, em ritmo leve. Quem observa a criação conhece melhor o Criador.',
  req: [
    r('AM', 'Acompanhar, pela observação, todo o planejamento e a execução de uma caminhada de 5 km.', 'C', 'Mostre o plano ao clube antes de sair.'),
    r('AM+', 'Conhecer e identificar 10 flores silvestres e 10 insetos da região.', 'C', 'Se não chegar a 10 de cada, continua nos outros dias.'),
    r('CO', 'Participar de uma caminhada ecológica em meio à natureza por uma hora.', 'C'),
    r('CO+', 'Participar de uma caminhada de 6 km e preparar um relatório de uma página.', 'D', 'Só fecha com o relatório entregue. Confirme se o percurso tem mesmo 6 km.'),
    r('CO+', 'Identificar e descrever 12 aves nativas e 12 árvores nativas.', 'P', 'Aqui só adianta: anote as que aparecerem.'),
    r('EX+', 'Encontrar alimento em plantas silvestres da região e diferenciá-las das plantas tóxicas.', 'P', 'Só identificação. Ninguém come nada.'),
    r('EX', 'Anotações sobre terreno, flora e fauna durante a expedição de 20 km.', 'T', 'É treino. A expedição de 20 km com pernoite fica para outra saída.'),
  ],
  fala: 'Hoje não é corrida. Vamos andar devagar, de olhos e ouvidos abertos. Não se colhe nem se mata nada.',
  passos: [
    '(10 min) Antes de sair, mostre o plano: por onde vamos, quantos quilômetros, a que horas voltamos, onde são as paradas e quem leva os primeiros socorros. É isso que o Amigo precisa acompanhar.',
    'Confira: calçado fechado e já usado, boné, lenço, água e 1 apito por unidade.',
    'Fila indiana, o menor na frente. Um adulto abre e outro fecha. Conte o grupo na saída e em toda parada.',
    'Ande no passo dos menores. A cada 15 ou 20 minutos, parada de 5 minutos: cada unidade encontra e anota 2 flores e 2 insetos (nome ou desenho, cor, onde estava).',
    'Nas paradas maiores, olhem também aves, árvores, pegadas e o tipo de terreno (seco, úmido, pedra, areia).',
    'Plantas: mostre só as que você conhece com certeza, 2 ou 3 comestíveis e 2 ou 3 tóxicas. Só olhar.',
    'Na metade do caminho, leia o Salmo 104:24 e faça uma oração curta.',
    'Na volta, conte o grupo e dê 5 minutos para as unidades completarem o caderno.',
  ],
  cola: [
    ['Regras da caminhada (Manual Administrativo)', [
      'Fila indiana, do menor para o maior; em estrada, andar na contramão.',
      'Mãos livres (ou um bastão). Calçado usado, nunca novo. Roupa clara.',
      'Água em pequenos goles, sem esperar a sede. Nada de refrigerante. Lanche leve.',
      'Sem gritaria. Caixa de primeiros socorros à mão. Caderninho para anotar.',
    ]],
    ['O que anotar no caderno de campo', ['Hora e lugar.', 'Nome ou desenho do que viu.', 'Cor, tamanho e uma curiosidade.', 'Se não souber o nome, escreva "a identificar" e pesquise depois.']],
  ],
  cuidado: [
    'No sábado a caminhada não pode ser exaustiva (Manual). Se o terreno for pesado ou o grupo cansar, encurte e avise que os 6 km do Companheiro de Excursionismo ficam para outro dia.',
    'Quem tem alergia a picada avisa antes de sair. Ninguém toca em lagarta, aranha ou cobra.',
    'Riacho: só no raso, com um adulto de cada lado. Ninguém sai da fila sem avisar.',
  ],
  avaliar: [
    'Amigo: conta com as próprias palavras como a caminhada foi planejada.',
    'Amigo da Natureza: mostra no caderno 10 flores e 10 insetos e reconhece pelo menos metade ao vivo.',
    'Companheiro de Excursionismo: entrega o relatório de uma página depois do acampamento.',
  ],
};

G[14] = {
  objetivo: 'Mostrar que o sábado à tarde pode ser alegre e cheio de natureza.',
  req: [
    r('EX+', 'Apresentar cinco atividades na natureza para serem realizadas no sábado à tarde.', 'C', 'O Excursionista na Mata entrega a lista das 5 por escrito e ajuda a conduzir pelo menos uma.'),
  ],
  fala: 'Cada unidade preparou uma atividade. Depois de cada uma eu pergunto: o que isso mostra sobre Deus?',
  passos: [
    'Sorteie a ordem. Cada unidade tem 7 minutos: 1 para explicar e 6 para fazer com o clube.',
    'Depois de cada atividade, faça uma pergunta rápida: o que aprendemos? O que isso mostra sobre Deus?',
    'No fim, os Excursionistas na Mata escrevem em uma folha as 5 atividades: nome, objetivo, material e como conduzir.',
  ],
  cola: [
    ['Ideias, se alguma unidade não preparou', [
      'Caça às cores: achar na natureza, sem arrancar, algo de 6 cores diferentes.',
      'Um minuto de silêncio: contar quantos sons diferentes cada um ouviu.',
      'Detetive da criação: achar algo que lembre cada dia da criação.',
      'Folhas caídas: juntar 5 formatos diferentes e comparar.',
      'História ao ar livre: os lírios do campo (Mateus 6:28-30) ou o Salmo 19.',
      'Desenho da paisagem em 5 minutos.',
    ]],
  ],
  cuidado: ['É sábado: nada de esporte, correria, brincadeira na água, fogo ou construção. Vale brincadeira que envolva a natureza (Manual).'],
  avaliar: ['Excursionista na Mata: entregou a lista escrita com as 5 atividades e participou da condução.'],
};

G[15] = {
  objetivo: 'Entender, pela Bíblia e pela natureza, como o dilúvio se relaciona com os fósseis.',
  req: [r('PI', 'Estudar a história do dilúvio e o processo de fossilização.', 'C')],
  fala: 'Como um bicho ou uma planta vira pedra? Vamos ver o que a Bíblia e as rochas contam.',
  passos: [
    'Mostre a imagem ou o fóssil e pergunte: como isso se formou?',
    'Um desbravador lê Gênesis 7:11-12 e 7:17-23.',
    'Explique a fossilização em 3 passos: 1) o ser vivo é coberto depressa por lama ou areia; 2) sem ar, ele não apodrece; 3) com o tempo os minerais da água entram no lugar do corpo e ele endurece como pedra.',
    'Ligue os pontos: para formar tantos fósseis bem conservados é preciso muita água e muita lama cobrindo tudo rápido. O dilúvio descrito na Bíblia foi um acontecimento assim.',
    'Abra para perguntas. Se não souber responder, diga: vamos pesquisar juntos.',
    'Cada Pioneiro explica com as próprias palavras o que entendeu.',
  ],
  cola: [['Textos', ['Gênesis 6 a 8 (a história do dilúvio).', '2 Pedro 3:5-6.', 'Fóssil: resto ou marca de um ser vivo conservado na rocha.']]],
  avaliar: ['O Pioneiro conta a história do dilúvio e explica, do jeito dele, como um fóssil se forma.'],
};

G[17] = {
  objetivo: 'Aprender a fazer fogo com segurança: preparar, acender, usar e apagar.',
  req: [
    r('AM+', 'Começar uma fogueira com apenas um fósforo, usando materiais naturais, e mantê-la acesa.', 'C', 'É individual: cada Amigo da Natureza acende a sua.'),
    r('PI', 'Fazer um fogo refletor e demonstrar seu uso.', 'C'),
    r('PI+', 'Acender uma fogueira em dia de chuva, saber como conseguir lenha seca e manter o fogo aceso.', 'C', 'Fecha se o próprio desbravador fizer, não só assistir.'),
    r('AM', 'Especialidade Acampamento I: escolher o local e preparar uma fogueira, regras de segurança, uso do fósforo, fogueira com um fósforo e como proteger a lenha da chuva.', 'P'),
    r('PE', 'Especialidade Acampamento III: construir as fogueiras estrela, caçador e refletor e explicar o uso; revisar as regras de segurança.', 'P'),
    r('PI+', 'Especialidade Fogueiras e Cozinha ao Ar Livre: tipos de fogueira, começar com um fósforo, tempo chuvoso, regras de segurança.', 'P'),
  ],
  fala: 'Fogo bem feito é fogo preparado. Quem arruma tudo antes acende com um fósforo só.',
  passos: [
    '(5 min) Local e segurança: círculo limpo de 2 metros, grama retirada em placas para recolocar depois, pedras em volta, balde de água e pá ao lado.',
    '(5 min) Cada unidade separa o material em 4 montes: isca, gravetos finos como lápis, gravetos médios como dedo e lenha grossa como pulso.',
    '(15 min) Desafio de um fósforo: a unidade monta a fogueira (cabana ou pirâmide) com a isca no meio. Você confere antes: tem isca seca? Tem espaço para o ar? Só então entrega 1 fósforo. Acende pelo lado de onde vem o vento.',
    'Os Amigos da Natureza acendem cada um a sua fogueirinha e mantêm acesa por 10 minutos, pondo graveto aos poucos.',
    '(15 min) Tipos de fogo: os Pioneiros montam o refletor e mostram o calor de um lado e do outro. Os Pesquisadores montam o estrela e o caçador.',
    '(10 min) Lenha molhada: o adulto racha um galho molhado e mostra o miolo seco. Lascas finas, base de gravetos para tirar o fogo do chão molhado, isca guardada em saco plástico.',
    '(5 min) Apagar: água, mexer as cinzas, mais água. Só está apagado quando dá para pôr a mão. Fica acesa apenas a fogueira que será usada no jantar ou no fogo do conselho.',
  ],
  cola: [
    ['Tipos de fogo e para que servem', [
      'Estrela: toras em forma de raios, com as pontas no centro. Vai empurrando conforme queima. Gasta pouca lenha e dura a noite.',
      'Caçador: duas toras lado a lado com o fogo no meio. A panela apoia em cima. É fogo de cozinhar.',
      'Refletor: parede de toras grossas atrás do fogo. Joga o calor para um lado só. Serve para aquecer um abrigo ou secar roupa.',
      'Fogo do conselho: fogueira maior, em pirâmide. Serve para iluminar a reunião da noite.',
    ]],
    ['Regras de segurança do fogo', [
      'Só com adulto por perto. Fogueira nunca fica sozinha.',
      'A 5 metros ou mais das barracas e sem galhos por cima.',
      'Balde de água e pá sempre ao lado.',
      'Nunca usar álcool, gasolina ou outro líquido para acender.',
      'Nada de vela, lampião ou fogareiro dentro da barraca.',
      'Ao sair ou dormir, apagar até esfriar.',
    ]],
    ['Isca natural que funciona', ['Capim seco, folhas secas esfareladas, casca fina e seca, palha, fiapos de coco. Graveto bom é o que estala ao quebrar.']],
  ],
  cuidado: [
    'Só começa depois do pôr do sol de sábado. A lenha é separada pelos líderes antes do sábado ou trazida de casa (no sábado não se apanha lenha).',
    'Facão e machadinha: hoje só o adulto usa. Cabelo comprido preso. Ninguém pula nem corre perto do fogo.',
    'Não faça fogueira maior que o necessário (Manual).',
  ],
  avaliar: [
    'Amigo da Natureza: acendeu com 1 fósforo e manteve aceso. Anote quantas tentativas precisou.',
    'Pioneiro: montou o refletor e explicou para que serve.',
    'Pioneiro de Novas Fronteiras: conseguiu lenha seca de um galho molhado e manteve o fogo.',
    'Especialidades: marque na ficha de controle os itens feitos. Elas não ficam completas hoje.',
  ],
};

G[19] = {
  objetivo: 'O momento mais esperado do acampamento: cantar, rir, contar a caminhada e tomar uma decisão ao lado de Jesus.',
  req: [
    r('CO+', 'Relatório de uma página da caminhada de 6 km.', 'D', 'O relato no fogo do conselho é o ensaio. O requisito fecha com o relatório escrito.'),
    r('CO', 'Especialidade Acampamento II: conhecer o uso do fogo do conselho e rever as normas de segurança de fogueiras.', 'P'),
  ],
  passos: [
    'Tenha o programa escrito, com hora para começar e para terminar. Dois adultos cuidam só do fogo.',
    'Comece animado: 2 ou 3 cânticos curtos e conhecidos.',
    'Relatos da caminhada: cada unidade tem 2 a 3 minutos para contar uma descoberta e mostrar o caderno. Mais de um da unidade deve falar.',
    'Premiação da melhor fogueira da Oficina do Fogo.',
    'Vá acalmando: cântico mais calmo, uma história e a reflexão espiritual final, com oração.',
  ],
  cola: [['Regras do fogo do conselho (Manual Administrativo)', [
    'Dura de 30 minutos a 1 hora e meia. Respeite o cansaço dos juvenis.',
    'Do mais animado para o mais reverente.',
    'Sempre termina com um momento espiritual.',
    'Não se cozinha nem se assa nada neste fogo.',
    'Tenha músicas e uma história de reserva, caso alguma parte falhe.',
  ]]],
  cuidado: ['Todos sentados a uma distância segura. Ao terminar, apague o fogo até esfriar.'],
  avaliar: ['Companheiro de Excursionismo: participou do relato. Combine o prazo do relatório (primeira reunião depois do acampamento).'],
};

G[22] = {
  objetivo: 'Treinar os movimentos básicos de Ordem Unida para a apresentação de segunda-feira.',
  req: [
    r('EX+', 'Especialidade de Ordem Unida: executar os movimentos a pé firme e em deslocamento.', 'P', 'Falta a teoria: 5 objetivos, 15 definições, cadência, 4 tipos de passo e cuidados com a Bandeira Nacional.'),
    r('PE+', 'Conhecer e saber usar a Bandeira dos Desbravadores, o bandeirim de unidade e os comandos de ordem unida.', 'P', 'Hoje, os comandos. Bandeira e bandeirim entram na formatura de segunda.'),
  ],
  fala: 'Ordem Unida é o clube inteiro se movendo junto. Somos Desbravadores, não militares: é disciplina com alegria.',
  passos: [
    'Forme o clube por unidades, o capitão na frente de cada coluna.',
    'Ensine um comando por vez: mostre, todos fazem devagar, depois no tempo certo.',
    'Ordem sugerida: sentido, descansar, cobrir e firme, direita volver, esquerda volver, meia-volta volver.',
    'Em marcha: marcar passo, ordinário marche e alto. Sempre rompe com o pé esquerdo.',
    'Nos últimos 5 minutos, repita a sequência inteira sem parar. É a mesma da apresentação de segunda.',
  ],
  cola: [
    ['Voz de comando em 3 partes (Manual Administrativo)', [
      'Advertência: avisa o grupo. Exemplo: "Atenção, clube!"',
      'Comando: diz o movimento. Exemplo: "Direita..."',
      'Execução: marca o momento. Exemplo: "VOLVER!" Dê uma pequena pausa antes.',
      'O instrutor comanda em posição de sentido, de frente para o grupo, com voz clara e firme.',
    ]],
    ['Como é cada posição', [
      'Sentido: imóvel e em silêncio, calcanhares unidos, pontas dos pés abertas, mãos espalmadas nas coxas, olhando para a frente.',
      'Descansar (só a partir do sentido): o pé esquerdo se afasta para o lado; a mão esquerda segura o punho direito na altura da cintura.',
      'Cobrir: braço esquerdo estendido para a frente na altura do ombro, palma para baixo (o da frente estende para o lado). Firme: abaixa o braço e volta ao sentido.',
      'Direita volver: gira 90 graus sobre o calcanhar direito e a planta do pé esquerdo, e une os calcanhares. Esquerda volver: o contrário.',
      'Meia-volta volver: gira 180 graus pela esquerda.',
    ]],
  ],
  cuidado: ['Ordem Unida não se treina nas horas do sábado (Manual). Por isso o treino é domingo cedo.'],
  avaliar: ['Hoje é treino. A avaliação prática é a apresentação de segunda, 08:00.'],
};

G[25] = {
  objetivo: 'Conferir a organização do acampamento e avaliar a montagem das barracas.',
  req: [
    r('AM', 'Aprender e montar uma barraca em local apropriado.', 'C', 'Montou na sexta; hoje explica o local e ajusta a barraca.'),
    r('AM', 'Especialidade Acampamento I: saber montar uma barraca, prevenção de incêndio depois de montada e higiene do acampamento.', 'P'),
    r('AM+', 'Especialidade Arte de Acampar: preparar o chão, montar corretamente a barraca e proteger o acampamento.', 'P'),
    r('CO', 'Especialidade Acampamento II: escolher o local das barracas e montar corretamente.', 'P'),
    r('PE', 'Especialidade Acampamento III: prender firmemente uma barraca, tipos de barraca e condensação.', 'P'),
  ],
  passos: [
    'Formatura: cada unidade em frente à sua barraca.',
    'Inspeção com a ficha: barraca esticada, estacas firmes, interior arrumado, calçados na entrada, lixo ensacado, área limpa. Dê os pontos.',
    'Em cada barraca, pergunte a um Amigo: por que este lugar é bom? O que nunca pode ter dentro ou perto da barraca? (fogo, vela, lampião)',
    'Peça que reapertem os tensores e recravem as estacas inclinadas.',
    'Pergunte a um Pesquisador: por que a barraca molha por dentro de manhã? (o ar quente da respiração encosta no teto frio e vira água; resolve abrindo a ventilação e não deixando o sobreteto encostar)',
  ],
  cola: [
    ['Local apropriado', ['Alto, limpo e quase plano.', 'Nunca embaixo de árvore, em baixada ou em leito seco de rio.', 'Protegido de vento forte, fora de trilha, com água potável perto.', 'Fogueira a 5 metros ou mais das barracas.']],
    ['Tipos de barraca', ['Iglu: em forma de cúpula, com varetas flexíveis; fácil de montar.', 'Canadense: em forma de A, com 2 mastros.', 'Bangalô: alta, com paredes quase retas; para acampamento fixo e famílias.']],
  ],
  avaliar: ['Amigo: explica por que o local é apropriado e ajusta a barraca sem ajuda. Pode assinar.', 'Especialidades: marque os itens feitos na ficha de controle.'],
};

G[26] = {
  objetivo: 'Duas oficinas ao mesmo tempo: ferramentas de corte com segurança, e nós e amarras. Aos 20 minutos os grupos trocam.',
  req: [
    r('AM+', 'Usar corretamente uma faca, um facão e uma machadinha e conhecer dez regras para usá-los com segurança.', 'C'),
    r('PI+', 'Demonstrar habilidade no uso correto de uma machadinha.', 'C'),
    r('AM', 'Cuidar corretamente de uma corda; fazer e explicar o uso prático dos 14 nós.', 'C', 'Os nós são treinados antes. Aqui é conferência.'),
    r('CO', 'Aprender ou recapitular os 9 nós.', 'C'),
    r('PE+', 'Aprender a fazer quatro amarras básicas e construir um móvel de acampamento.', 'D', 'Fecha na Grande Pioneiria, quando o móvel ficar pronto.'),
    r('AM', 'Especialidade Acampamento I: usar corretamente canivete e machadinha e conhecer 10 regras de segurança.', 'P'),
  ],
  fala: 'Ferramenta de corte não é brinquedo. Quem brinca, perde o direito de usar.',
  passos: [
    'Divida o clube em 2 grupos. Deixe as duas oficinas afastadas uma da outra.',
    'OFICINA A (ferramentas): leia as 10 regras com o grupo sentado, longe do toco.',
    'Mostre você primeiro, devagar: faca tirando lascas de um graveto, facão cortando uma vara, machadinha rachando lenha no toco.',
    'Chame um desbravador por vez. Os outros esperam sentados, a 3 metros. Ele repete o corte e devolve a ferramenta na bainha antes de chamar o próximo.',
    'OFICINA B (nós e amarras): cada um com a sua corda. Chame os nós pelo nome, de 3 em 3. Cada um faz o seu; você olha e não faz por ele.',
    'Pergunte para que serve cada nó. Anote na lista quem fez todos.',
    'Últimos 8 minutos da oficina B: as 4 amarras, em duplas, com duas varas e sisal.',
    'Aos 20 minutos, troque os grupos.',
  ],
  cola: [
    ['10 regras de segurança com faca, facão e machadinha', [
      '1. Ferramenta não é brinquedo.',
      '2. Mantenha afiada, limpa e seca. Lâmina cega escorrega e machuca.',
      '3. Ninguém a menos de 3 metros de quem está cortando.',
      '4. Corte sempre para longe do corpo.',
      '5. Com facão e machadinha, corte inclinado (em diagonal), nunca em ângulo reto.',
      '6. Apoie a madeira em um toco firme, nunca na perna ou na mão.',
      '7. Não use o cabo nem o lado da lâmina como martelo.',
      '8. Não ande nem corra com a ferramenta fora da bainha.',
      '9. Para entregar, segure pelas costas da lâmina (o lado sem corte) e ofereça o cabo. Só solte quando o outro disser "peguei".',
      '10. Terminou, limpou e guardou na bainha.',
    ]],
    ['Como usar a machadinha', ['De joelhos na frente do toco: se errar, a lâmina bate no chão e não na perna.', 'Uma mão no fim do cabo. A outra mão fica longe da linha do corte.', 'Para rachar lenha fina: encoste a lâmina na ponta da lenha e bata as duas juntas no toco.']],
    ['Cuidados com a corda', ['Guardar seca e enrolada, longe do sol forte.', 'Não pisar nem arrastar no chão.', 'Arrematar as pontas para não desfiar.']],
    ['14 nós do Amigo e para que servem', [
      'Simples: trava a ponta da corda; é a base de outros nós.',
      'Cego: nó inseguro, que ora desata sozinho, ora emperra. Aprende-se para nunca usar.',
      'Direito: emenda duas cordas da mesma grossura; fecha ataduras.',
      'Cirurgião: direito com uma volta a mais; não escorrega.',
      'Lais de guia: laço que não corre nem aperta; nó de salvamento.',
      'Lais de guia duplo: dois laços fixos; para sustentar uma pessoa.',
      'Escota: emenda cordas de grossuras diferentes.',
      'Catau: encurta a corda sem cortar.',
      'Pescador: emenda cordas finas ou lisas.',
      'Fateixa: prende a corda em argola ou estaca.',
      'Volta do fiel: prende a corda em poste ou vara; começa e termina as amarras.',
      'Nó de gancho: prende a corda em um gancho.',
      'Volta da ribeira: arrasta troncos; começa a amarra diagonal.',
      'Ordinário: une duas cordas com firmeza, mas fica volumoso e é difícil de desatar molhado; também serve de enfeite.',
    ]],
    ['9 nós do Companheiro', ['Oito: trava a corda em um furo ou roldana.', 'Volta do salteador: prende e solta com um puxão.', 'Caminhoneiro: estica bem uma corda (varal, lona, carga).', 'Duplo: confira o desenho no manual de nós do clube.', 'Direito, volta do fiel, escota, lais de guia e simples: iguais aos do Amigo.']],
    ['4 amarras básicas', [
      'Quadrada: une duas varas em cruz (ângulo reto).',
      'Diagonal: une duas varas em X, que tendem a se abrir.',
      'Paralela (ou redonda): une duas varas lado a lado; com três varas faz o tripé.',
      'Contínua: prende várias varinhas sobre duas varas, como tampo de mesa.',
      'Toda amarra começa com um nó, tem voltas bem apertadas, o arremate entre as varas e termina com outro nó.',
    ]],
  ],
  cuidado: [
    'Na oficina A, no máximo 6 desbravadores por adulto. Só o instrutor entrega e recebe a ferramenta.',
    'Um desbravador cortando por vez, com o adulto olhando só para ele.',
    'Ferramentas cortantes são tratadas como elemento de alto risco (Manual). Fora da oficina, ficam guardadas com os líderes.',
  ],
  avaliar: [
    'Amigo da Natureza: usa as 3 ferramentas do jeito certo e diz as 10 regras.',
    'Pioneiro de Novas Fronteiras: usa a machadinha com segurança, sem precisar de correção.',
    'Amigo e Companheiro: fazem todos os nós da sua lista sozinhos e dizem o uso. Faltou algum? Mostra de novo na segunda, 09:50.',
  ],
};

G[27] = {
  objetivo: 'Construir móveis de verdade só com bambu, sisal e amarras, e levantar o portal do clube.',
  req: [
    r('PE+', 'Aprender a fazer quatro amarras básicas e construir um móvel de acampamento.', 'C'),
    r('GU', 'Construir e utilizar um móvel de acampamento em tamanho real, com nós e amarras.', 'C', 'O "utilizar" acontece no almoço.'),
    r('GU', 'Participar com sua unidade de um acampamento com estrutura de pioneiria, planejando o que levar e o que vai acontecer.', 'C', 'Vale para o Guia que ajudou no planejamento antes do acampamento.'),
    r('EX+', 'Com sua unidade, construir cinco móveis de acampamento e um portal para o clube.', 'P', 'Aqui sai 1 móvel e o portal. Faltam 4 móveis.'),
    r('EX', 'Especialidade de Pioneirias: amarras, ferramentas e móveis.', 'P'),
  ],
  fala: 'Móvel bom é o que aguenta uso. Vamos comer nele daqui a pouco.',
  passos: [
    '(15 min) Projeto: cada unidade mostra o desenho do móvel com as medidas e separa as varas por tamanho. O Guia da unidade coordena.',
    '(85 min) Construção: primeiro as pernas e travessas, com amarra quadrada. Depois os reforços em X, com amarra diagonal. Por último o tampo.',
    '(10 min) Teste: balance, apoie peso, sente (se for banco). Balançou? Reaperte ou ponha reforço diagonal.',
    '(35 min) Portal: todos juntos. Dois postes bem enterrados, travessa amarrada no alto e cordas de sustentação presas em estacas.',
    '(5 min) Recolher sobras de sisal e bambu. Guardar as ferramentas com os líderes.',
  ],
  cola: [
    ['Móveis que cabem no tempo', ['Mesa ou bancada de cozinha.', 'Porta-panelas ou escorredor.', 'Sapateira.', 'Lavatório (tripé com bacia).', 'Varal ou porta-toalhas.', 'Lixeira com tripé.']],
    ['Regras da pioneiria', ['Sem prego, parafuso ou arame: só nós e amarras.', 'Use bambu e não corte árvores nem arbustos (Manual).', 'Amarra boa não se mexe quando você torce as varas.']],
  ],
  cuidado: [
    'Serrote e serra só com adulto, ou com Guia treinado e adulto ao lado. Luva para carregar bambu (farpas).',
    'Ninguém sobe nas estruturas. Na hora de levantar o portal, quem não está ajudando fica longe.',
    'Confira o portal todos os dias. Portal bambo se desmonta.',
  ],
  avaliar: [
    'Pesquisador de Campo e Bosque: fez as amarras do móvel com as próprias mãos.',
    'Guia: liderou a equipe, e o móvel aguentou o uso no almoço.',
    'Excursionista na Mata: não assina ainda. Anote 1 móvel e o portal; faltam 4 móveis.',
  ],
};

module.exports = G;
