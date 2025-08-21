create table if not exists tasks (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  status text check (status in ('todo','doing','done')) default 'todo',
  created_at timestamp with time zone default now(),
  owner uuid references auth.users not null
);
alter table tasks enable row level security;
create policy "Users can view own tasks" on tasks for select using (auth.uid() = owner);
create policy "Users can insert own tasks" on tasks for insert with check (auth.uid() = owner);
create policy "Users can update own tasks" on tasks for update using (auth.uid() = owner);
create policy "Users can delete own tasks" on tasks for delete using (auth.uid() = owner);
