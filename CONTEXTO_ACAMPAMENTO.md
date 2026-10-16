# Contexto do projeto: Acampamento do Clube de Desbravadores

> **Para o Claude:** este documento resume uma conversa anterior. Leia tudo antes de responder. Responda sempre em **português do Brasil**. Sou o Henrique, líder no Clube de Desbravadores. Quero ajuda como de um **líder de Desbravadores experiente em acampamentos e especialidades**.

---

## 1. O que estou fazendo

Estou planejando o **acampamento do meu Clube de Desbravadores** (Igreja Adventista). O objetivo é cumprir o máximo de **requisitos de classe e especialidades** durante o acampamento. Tenho três entregas:

1. **Cronograma** completo, dia a dia, com as atividades e os requisitos. ✅ Feito (planilha Excel).
2. **Pesquisa** dos requisitos de acampamento das 6 classes. ✅ Feita.
3. **Site** para acompanhar e editar o cronograma, hospedado no **GitHub Pages** com **Supabase** como banco de dados. ✅ Código pronto, mas **ainda não publicado nem testado com o Supabase real**.

---

## 2. Regras e decisões do acampamento

- **Datas:** sexta **09/10/2026** a segunda **12/10/2026** (feriado).
- **Chegada:** **sexta à noite** (~19h). Nessa noite o clube monta o acampamento e faz alguns requisitos.
- **Sábado:** vai do pôr do sol de sexta (~18h10, **ainda a confirmar para a cidade**) até o pôr do sol de sábado. Nesse período só entram atividades espirituais, de natureza, de observação e de conversa. Nada de construção, fogo ou cozinha.
- **Todos fazem tudo juntos:** as atividades **não são divididas por classe**. O clube trabalha **por unidade** e cada atividade cobre requisitos de várias classes ao mesmo tempo.
- **Não é preciso completar todos os requisitos** de cada especialidade. A ideia é juntar requisitos parecidos em atividades comuns.
- **Rodízio de estações:** o clube é dividido em grupos (G1, G2…) que passam por todas as estações, em rodízio (quadrado latino).
- **Siglas das classes:** AM Amigo, CO Companheiro, PE Pesquisador, PI Pioneiro, EX Excursionista, GU Guia. O "+" indica a classe avançada (ex.: AM+ = Amigo da Natureza).

### Especialidades e requisitos que eu pedi no início

| Classe | Especialidades | Requisitos |
|---|---|---|
| Amigo | Arte de Acampar | Fogueira; Cozinha ao ar livre |
| Companheiro | Acampamento II | — |
| Pesquisador | Acampamento III, Primeiros Socorros | — |
| Pioneiro | Resgate Básico (prático), Pioneirismo, Vida Silvestre, Ordem Unida | Purificar água; Percurso com 3 azimutes; Construir um **abrigo** na natureza*; Construção de móveis; Tipos de fogueira e como manter com muita umidade |

\* No meu texto original faltou a palavra ("Construir um ___ natureza"). Foi considerado **abrigo**.

⚠️ **Divergência a conferir:** no MDAWiki, Vida Silvestre e Ordem Unida aparecem na classe avançada do **Excursionista**. Purificar água, 3 azimutes e abrigo não aparecem no cartão do Pioneiro. Talvez o clube use um cartão revisado mais recente.

---

## 3. Pesquisa: requisitos de acampamento nas 6 classes

Fonte: cartões das classes no MDAWiki (mda.wiki.br).

- **Amigo:** 14 nós; especialidade Acampamento I; 10 regras de caminhada e o que fazer se estiver perdido; pista com 10 sinais; montar barraca em local apropriado.
  - **Avançada:** Arte de Acampar; fogueira com 1 fósforo; faca, facão e machadinha; 10 flores e 10 insetos.
- **Companheiro:** pontos cardeais sem bússola e rosa dos ventos; acampamento de fim de semana com relatório; 9 nós; Acampamento II.
  - **Avançada:** refeição em fogueira; quadro de 15 nós; caminhada de 6 km com relatório; Excursionismo pedestre com mochila.
- **Pesquisador:** 6 segredos de um bom acampamento; planejar e cozinhar 2 refeições; Acampamento III; Primeiros Socorros básico; bússola ou GPS em zona urbana.
  - **Avançada:** caminhada de 10 km com lista de equipamento; 4 amarras e 1 móvel; cardápio vegetariano para 3 dias.
- **Pioneiro:** fogo refletor; arrumar a mochila corretamente; Resgate Básico; dilúvio e fossilização; uma especialidade de Estudo da Natureza.
  - **Avançada:** caminhada de 10 km; Mapa e Bússola; machadinha; fogueira na chuva; Fogueiras e Cozinha ao Ar Livre.
- **Excursionista:** expedição de 20 km com uma noite fora (planejamento, anotações de terreno, flora e fauna, discussão depois); Pioneirias.
  - **Avançada:** 5 móveis e um portal; 5 atividades para sábado à tarde; plantas comestíveis x tóxicas; técnicas de trilha; Vida Silvestre; Ordem Unida.
- **Guia:** acampamento com estrutura de pioneiria (planejar); 3 refeições ao ar livre; um móvel em tamanho real; uma especialidade de Aquática, Esportes, Recreação ou Vida Campestre.
  - **Avançada:** projetar 3 tipos de abrigo e usar 1; mestrado em Vida Campestre.

**Ficam fora deste acampamento:** caminhadas de 10 e 20 km, bússola ou GPS em zona urbana, Excursionismo com mochila e o mestrado em Vida Campestre.

---

## 4. Roteiro final (versão atual — sem rodízio de estações)

> Nesta versão as atividades que antes eram feitas em grupos simultâneos (estações) viraram uma sequência única, com o clube inteiro fazendo cada coisa junto, uma de cada vez. Isso porque com 9 líderes e sem ninguém com formação técnica em saúde/resgate, ficou mais simples e seguro concentrar a atenção de todo mundo numa atividade por vez, em vez de dividir os 9 líderes em 3 estações simultâneas. Duas atividades que estavam em domingo à tarde (Azimutes e Abrigos) foram para a segunda-feira, porque domingo estava muito cheio.

> **Revisão de 09/10/2026.** O roteiro foi conferido com os cartões de classe e com o Manual Administrativo do Clube de Desbravadores (DSA, ed. 2020). A grade de horários continua a mesma. O que mudou:
> - Nas horas do sábado não há instrução técnica (Manual, "O sábado no acampamento"). A antiga "Roda sob as estrelas" virou culto, e o conteúdo dela foi para uma roda de conversa no domingo às 19:30.
> - O Manual também pede chegar e montar o acampamento antes do pôr do sol de sexta. Neste acampamento a chegada é à noite, então monta-se só o essencial. **Nos próximos, planejar a chegada antes do pôr do sol.**
> - Requisito parcial não é assinado (Manual, 4.1.4). O almoço das unidades conta como 1 das 2 refeições do Pesquisador e 1 das 3 do Guia.
> - Classes corrigidas: purificar água é do Amigo; anotações e discussão da expedição são do Excursionista (e aqui são só treino, porque o requisito pede 20 km); abrigos é só do Guia de Exploração.
> - Em outubro o Cruzeiro do Sul não aparece no começo da noite; os pontos cardeais são feitos pelo sol, na segunda.
>
> **Fonte do conteúdo:** a pasta `pdf/fonte/` (cronograma.js, guias-1.js, guias-2.js). O comando `node pdf/fonte/gerar.js` gera de uma vez o `js/dados-exemplo.js`, o `supabase/02_cronograma.sql` e os dois PDFs da pasta `pdf/`.

### Sexta 09/10: chegada à noite (já é sábado)
- **19:00** Chegada e check-in: autorizações, fichas de saúde e o essencial para a noite. Sem avaliação de requisito.
- **19:30** Montagem das barracas, só o essencial para dormir.
- **21:00** Lanche e culto de recepção do sábado.
- **21:45** Culto sob as estrelas (Salmo 19 e Salmo 8).
- **22:30** Silêncio.

### Sábado 10/10
- **Manhã:** 07:00 alvorada, devocional, café, cerimônia de abertura, Escola Sabatina e culto.
- **14:00–16:30** Caminhada ecológica de ~6 km, em ritmo leve (AM, AM+, CO, CO+, EX+; treino para o EX).
- **16:30** Cada unidade apresenta uma atividade de natureza para o sábado à tarde (EX+).
- **17:15** Estudo do dilúvio e dos fósseis (PI).
- **17:50** Culto do pôr do sol.
- **18:20** Oficina do Fogo, só depois do pôr do sol (AM, AM+, PE, PI, PI+).
- **19:15** Jantar (cozinha do clube).
- **20:30** Fogo do conselho, com os relatos da caminhada (CO, CO+).
- **22:00** Silêncio.

### Domingo 11/10: dia de prática
- **06:45** Treino de Ordem Unida (PE+, EX+).
- **08:30** Inspeção e revisão das barracas: aqui se avalia a montagem (AM, AM+, CO, PE).
- **08:45** Segurança com faca, facão e machadinha + nós e amarras (2 grupos trocam).
- **09:30–12:00** Grande pioneiria: móveis de acampamento e portal do clube.
- **12:00** Almoço das unidades: única refeição cozinhada pelas unidades (1 de 2 do Pesquisador, 1 de 3 do Guia).
- **14:00–14:50** Primeiros socorros (PE, EX+).
- **14:55–15:45** Resgate básico (PI), parcial.
- **15:45** Banho. **16:30** Jantar (cozinha do clube).
- **17:45–19:30** Culto ao redor da fogueira e noite de relatos (CO; treino para o EX).
- **19:30–20:15** Roda de conversa: 10 regras de caminhada, o que fazer se perdido, 6 segredos do bom acampamento e técnicas de trilha (AM, CO, PE, EX+).
- **22:00** Silêncio.

### Segunda 12/10: encerramento (saída às 18h)
- **08:00** Apresentação de Ordem Unida (PE+, EX+).
- **08:30–09:10** Purificação de água (AM; EX+ pela Vida Silvestre).
- **09:10–09:50** Orientação pelo sol e rosa dos ventos (CO).
- **09:50–10:30** Quadro de 15 nós (CO+).
- **10:30–11:20** Azimutes e pista (AM, PE, PI+, EX+).
- **11:20–12:10** Abrigos (GU+): o abrigo fica montado e é usado no almoço.
- **12:10–14:10** Desmontagem e limpeza; mochila do Pioneiro e lista de equipamento do PE+.
- **14:10–17:15** Almoço e tempo livre (espera dos pais).
- **17:15–18:00** Encerramento e assinatura dos requisitos cumpridos por inteiro.
- **18:00** Saída.

### Antes e depois
- **Antes:**
  - cada unidade planeja o cardápio da **única** refeição que vai cozinhar (almoço de domingo);
  - os Guias planejam o acampamento com a liderança;
  - enviar a lista de equipamento;
  - treinar os nós nas reuniões de sábado;
  - a liderança separa bambu e sisal, reconhece a trilha e monta o percurso dos azimutes.
- **Depois:** relatório do acampamento (CO) e relatório da caminhada de 6 km (CO+).

---

## 5. Arquivos já criados

### 5.1 Planilha: `Cronograma_Acampamento_Desbravadores.xlsx`

| Aba | Conteúdo |
|---|---|
| Resumo | Visão dos dias, regras do roteiro e segurança |
| Sex, Sáb, Dom, Seg | Uma aba por dia. Colunas: Horário, Atividade, Como conduzir, Requisitos, Classes atendidas, Material, Responsável |
| Rodízios | Grade dos grupos por estação e o passo a passo de cada estação |
| Antes e Depois | Tarefas de preparação, relatórios e o que fica fora |
| Controle | Status de cada item (lista suspensa) e % concluído |
| Pesquisa 6 Classes | 46 requisitos de acampamento das 6 classes (regulares e avançadas) |

### 5.2 Site: `acampamento-site.zip`

- **Tecnologia:** HTML, CSS e JavaScript puro, **sem build**, pronto para o GitHub Pages. Usa o supabase-js v2 carregado do jsDelivr.

**Estrutura:**
```
index.html · css/style.css · js/config.js · js/app.js · js/dados-exemplo.js · .nojekyll · README.md
supabase/01_estrutura.sql · supabase/02_cronograma.sql · supabase/03_editores.sql
```

**Banco (Supabase):**
- Tabelas: `dias`, `atividades`, `rodizios` (com `horarios` em jsonb), `estacoes`, `requisitos` (agora com o campo `classes`), `tarefas` e `editores`.
- `atividades` tem: início e fim ("HH:MM"), título, condução, requisitos, classes, material, responsável, `sabado` (bool), `status` (pendente, andamento ou concluída) e ordem.
- As tabelas `rodizios` e `estacoes` continuam existindo no banco (compatibilidade), mas ficam **vazias** — o conceito de estação/rodízio foi removido do cronograma; agora as atividades acontecem em sequência, com o clube inteiro junto.
- **Segurança (RLS):** leitura pública. Inserir, alterar e excluir só se a função `eh_editor()` for verdadeira, ou seja, se o e-mail do usuário logado estiver na tabela `editores`.
- **Tempo real:** as tabelas estão na publicação `supabase_realtime`, então o site recarrega sozinho quando alguém edita.
- `02_cronograma.sql` apaga o cronograma e recarrega o original. Ele não mexe na tabela `editores`.

**Funções do site:**
- Abas: Programação, Requisitos e Antes e depois (a aba Rodízios foi removida, já que não existe mais estação).
- A aba **Requisitos** agora agrupa os itens **por classe** (Amigo, Amigo da Natureza, Companheiro, Companheiro de Excursionismo, Pesquisador, Pesquisador de Campo e Bosque, Pioneiro, Pioneiro de Novas Fronteiras, Excursionista, Excursionista na Mata, Guia, Guia de Exploração), mostrando quantos itens cada classe tem.
- O **guia do instrutor** fica na **Programação** (campo `guia_instrutor` de cada atividade), porque uma atividade pode cumprir 2 ou mais requisitos. Ele lista os requisitos cumpridos, o material, o tempo e, para cada requisito: o que falar, conteúdo pronto (ex.: as 10 regras), passo a passo, erros comuns, segurança, como avaliar e fontes. A aba Requisitos só mostra o que está sendo cumprido, por classe, e onde.
- Faixa "Agora / Depois" com a atividade do momento (usa o relógio do celular). Antes do acampamento mostra a contagem regressiva.
- Busca em todos os dias.
- Status que muda com um toque.
- Formulários para criar, editar e excluir dias, atividades, requisitos (com classe) e tarefas.
- Login dos líderes por e-mail e senha.
- Impressão do dia.
- Modo escuro e layout para celular.
- **Modo demonstração:** se `config.js` estiver vazio, o site usa `dados-exemplo.js` e as edições ficam só na memória.

**Configuração:** só o `js/config.js` precisa ser editado: `NOME_CLUBE`, `TITULO`, `DATAS`, `SUPABASE_URL` e `SUPABASE_ANON_KEY` (chave anon ou publishable, **nunca** a service_role).

**O que já foi testado:**
- Os scripts SQL, num PostgreSQL 16 local com simulação do Supabase: o público lê e não altera; um usuário logado que não é editor é bloqueado; o editor consegue alterar.
- O site no modo demonstração, com Playwright: telas, edição, status, busca, rodízios, requisitos e tarefas.
- **Não testado:** login e tempo real com um projeto Supabase de verdade.

**Passo a passo de publicação** (está no README):
1. Rodar `01` e `02` no SQL Editor.
2. Criar os usuários dos líderes (Auto Confirm), colocar os e-mails no `03` e rodar.
3. Colar a URL e a chave no `config.js`.
4. Subir no GitHub e ativar Settings → Pages → main / root.
5. Recomendado: desligar "Allow new users to sign up".
6. Lembrete: o Supabase grátis pausa depois de 7 dias sem uso.

---

## 6. Pendências e dúvidas em aberto

- [ ] Confirmar o horário do pôr do sol na cidade do acampamento (afeta a Oficina do Fogo às 18h20 de sábado).
- [ ] Confirmar a estrutura do local: trilha de 6 km e se pode fazer fogo no chão.
- [ ] Publicar o site: criar o projeto no Supabase, rodar os SQL, cadastrar os editores e subir no GitHub.
- [ ] Possíveis melhorias no site: página de avisos e controle por desbravador. (Os PDFs do cronograma já existem na pasta `pdf/`.)
- [ ] Rodar o novo `02_cronograma.sql` no Supabase para o site publicado mostrar o roteiro revisado (isso zera status e edições feitas pelo site).

**Já resolvido nesta versão:** abrigo e purificação de água foram corrigidos para a classe certa (Guia de Exploração e Amigo/Excursionista na Mata, não Pioneiro); Ordem Unida corrigida para Excursionista na Mata; número de grupos e estações não é mais necessário, já que o rodízio foi removido; instrutores de Primeiros Socorros e Resgate são os próprios 9 líderes, sem formação técnica — por isso essas atividades ficaram só com 1-2 requisitos práticos, não a especialidade inteira.

---

## 7. Como quero que você me ajude daqui para frente

- Continue a partir deste roteiro e **não recomece do zero**.
- Se mudar o cronograma, mantenha **a planilha, o `02_cronograma.sql` e o `dados-exemplo.js` coerentes**, porque os três têm os mesmos dados.
- Pense como um líder experiente: segurança em primeiro lugar, respeito às horas do sábado e juntar requisitos para o clube fazer tudo em conjunto.
