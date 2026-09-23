# Site do Acampamento: Desbravadores (09 a 12/10/2026)

Site para acompanhar e editar o cronograma do acampamento. Ele fica hospedado no **GitHub Pages** e guarda os dados no **Supabase**.

- **Todos podem ver**: pais, desbravadores e conselheiros abrem o link no celular.
- **Só os líderes cadastrados editam**: horários, atividades, responsáveis, status dos requisitos e tarefas.
- **"Agora / Depois"**: durante o acampamento, o topo do site mostra a atividade do momento e a próxima.
- **Tempo real**: quando um líder altera algo, o site atualiza sozinho no celular de todo mundo.
- **Busca** em todos os dias (ex.: "abrigo", "fogueira", "PI").
- **Imprimir** o dia para colar no mural.

```
site/
├── index.html              → página do site
├── css/style.css           → visual
├── js/config.js            → ⚙️ ÚNICO arquivo que você precisa editar
├── js/app.js               → funcionamento do site
├── js/dados-exemplo.js     → cronograma usado no modo demonstração
└── supabase/
    ├── 01_estrutura.sql    → cria as tabelas e a segurança
    ├── 02_cronograma.sql   → carrega todo o cronograma planejado
    └── 03_editores.sql     → quem pode editar
```

> **Dá para testar antes de configurar:** abra o `index.html` no navegador. Sem o Supabase, o site abre em **modo demonstração**. Tudo funciona, mas as alterações somem ao recarregar a página.

---

## Passo 1: criar o banco no Supabase

1. Entre em <https://supabase.com> e crie um projeto (o plano grátis serve).
2. No menu da esquerda, abra **SQL Editor** → **New query**.
3. Copie todo o conteúdo de `supabase/01_estrutura.sql`, cole e clique em **Run**.
4. Faça o mesmo com `supabase/02_cronograma.sql`. Isso coloca todo o cronograma no banco.

## Passo 2: cadastrar os líderes que vão editar

1. Vá em **Authentication** → **Users** → **Add user** → **Create new user**.
2. Informe o e-mail e a senha do líder e marque **Auto Confirm User**.
3. Repita para cada líder que vai editar (diretor, secretário, conselheiros…).
4. Abra o `supabase/03_editores.sql` e troque `seu-email@exemplo.com` pelos e-mails dos líderes.
5. Rode esse arquivo no **SQL Editor**.

> **Segurança extra (recomendado):** em **Authentication** → **Sign In / Providers**, desligue a opção **Allow new users to sign up**. Mesmo sem isso, só quem está na lista de editores consegue alterar o cronograma.

## Passo 3: ligar o site ao Supabase

1. No Supabase, clique no botão **Connect** no topo, ou vá em **Project Settings** → **API Keys**.
2. Copie a **Project URL** e a chave pública (**anon** ou **publishable**).
3. Abra o `js/config.js` e cole:

```js
SUPABASE_URL: "https://xxxxxxxx.supabase.co",
SUPABASE_ANON_KEY: "eyJhbGciOi...  (ou sb_publishable_...)",
```

Nesse mesmo arquivo você também pode mudar o nome do clube e o título.

> ⚠️ **Nunca** coloque a chave `service_role` (ou `secret`) no site. A chave anon/publishable é pública de propósito: quem protege os dados são as regras de segurança criadas no passo 1.

## Passo 4: publicar no GitHub Pages

1. No GitHub, clique em **New repository** e crie um repositório público (ex.: `acampamento-2026`).
2. Clique em **Add file** → **Upload files** e arraste **o conteúdo** da pasta `site/`: `index.html`, as pastas `css`, `js` e `supabase`, e este README. Depois clique em **Commit changes**.
3. Vá em **Settings** → **Pages**.
   - Em **Source**, escolha **Deploy from a branch**.
   - Em **Branch**, escolha **main** e a pasta **/ (root)**.
   - Clique em **Save**.
4. Em 1 ou 2 minutos o site estará em:
   `https://SEU-USUARIO.github.io/acampamento-2026/`

Depois é só compartilhar esse link no grupo do clube.

---

## Como usar

| Quero… | Como |
|---|---|
| Editar | Clique em **Entrar** (canto superior) com o e-mail e a senha do líder. |
| Mudar horário, texto ou responsável | Abra a atividade → **✎ Editar**. |
| Marcar uma atividade como feita | Toque no status (**Pendente → Em andamento → Concluída**). |
| Criar ou excluir atividade | **+ Atividade**. Para excluir, abra o **Editar** e clique em **Excluir**. |
| Controlar os requisitos (por classe) | Aba **Requisitos** → escolha o status na lista. Os itens já vêm agrupados por classe (Amigo, Companheiro, Pioneiro...). |
| Imprimir o dia | **🖨 Imprimir** na aba Programação. |
| Voltar ao cronograma original | Rode de novo o `02_cronograma.sql`. ⚠️ Isso apaga as alterações. |

O "Agora / Depois" usa o relógio do celular de quem está vendo o site.

## Dicas importantes

- **O Supabase grátis pausa o projeto depois de 7 dias sem uso.** Abra o site alguns dias antes do acampamento. Se estiver pausado, entre no painel do Supabase e clique em **Restore project**.
- No local do acampamento, o site precisa de internet (3G/4G) para carregar. Imprima o cronograma como reserva.
- Os horários de sábado aparecem com fundo amarelo. Para mudar isso, marque ou desmarque **Horário de sábado** na edição da atividade.
