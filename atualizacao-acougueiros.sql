-- Rode UMA vez no Supabase > SQL Editor (lista de açougueiros + quem faz cada pedido)
create table if not exists public.acougueiros (
  id bigint generated always as identity primary key,
  nome text not null,
  created_at timestamptz not null default now()
);
alter table public.acougueiros enable row level security;
drop policy if exists "logados gerenciam acougueiros" on public.acougueiros;
create policy "logados gerenciam acougueiros" on public.acougueiros
  for all to authenticated using (true) with check (true);
grant select, insert, update, delete on public.acougueiros to authenticated;

alter table public.pedidos_bancada add column if not exists acougueiro text;
