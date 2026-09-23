-- =====================================================================
--  QUEM PODE EDITAR O SITE
--  1) Crie o usuário do líder em: Authentication > Users > Add user
--     (marque "Auto Confirm User" e defina uma senha).
--  2) Coloque o MESMO e-mail aqui embaixo e rode este script.
--  Para tirar alguém:  delete from public.editores where email = 'fulano@email.com';
-- =====================================================================

insert into public.editores (email) values
  ('seu-email@exemplo.com')
  -- , ('diretor@exemplo.com')
  -- , ('conselheiro@exemplo.com')
on conflict (email) do nothing;
