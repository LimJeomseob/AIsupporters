-- 앱 전체 상태를 한 행(id = 'main')에 JSON으로 저장
create table if not exists public.app_state (
  id          text primary key,
  data        jsonb  not null,
  updated_at  bigint not null default 0
);

alter table public.app_state enable row level security;

-- 링크를 아는 사람은 누구나 읽고 고칠 수 있음 (아티팩트와 같은 공유 방식)
drop policy if exists "app_state read"   on public.app_state;
drop policy if exists "app_state insert" on public.app_state;
drop policy if exists "app_state update" on public.app_state;
create policy "app_state read"   on public.app_state for select to anon, authenticated using (true);
create policy "app_state insert" on public.app_state for insert to anon, authenticated with check (id = 'main');
create policy "app_state update" on public.app_state for update to anon, authenticated using (id = 'main') with check (id = 'main');

-- 실시간 동기화
do $$ begin
  alter publication supabase_realtime add table public.app_state;
exception when duplicate_object then null; end $$;
