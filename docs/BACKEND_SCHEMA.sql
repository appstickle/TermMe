-- TerMe v1 draft schema (Supabase/Postgres)
-- Apply and refine in Supabase SQL editor.

create extension if not exists pgcrypto;

create table if not exists profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  handle text unique not null check (char_length(handle) between 3 and 24),
  display_name text not null default '',
  created_at timestamptz not null default now()
);

create table if not exists friend_invites (
  id uuid primary key default gen_random_uuid(),
  from_user_id uuid not null references profiles(id) on delete cascade,
  to_user_id uuid not null references profiles(id) on delete cascade,
  status text not null check (status in ('pending', 'accepted', 'declined')),
  created_at timestamptz not null default now(),
  responded_at timestamptz
);

create unique index if not exists uq_friend_invites_pending
on friend_invites (from_user_id, to_user_id)
where status = 'pending';

create table if not exists friendships (
  id uuid primary key default gen_random_uuid(),
  user_a uuid not null references profiles(id) on delete cascade,
  user_b uuid not null references profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  check (user_a <> user_b)
);

create unique index if not exists uq_friendships_pair
on friendships (least(user_a, user_b), greatest(user_a, user_b));

create table if not exists conversations (
  id uuid primary key default gen_random_uuid(),
  user_a uuid not null references profiles(id) on delete cascade,
  user_b uuid not null references profiles(id) on delete cascade,
  cipher_mode_enabled boolean not null default false,
  created_at timestamptz not null default now(),
  check (user_a <> user_b)
);

create unique index if not exists uq_conversations_pair
on conversations (least(user_a, user_b), greatest(user_a, user_b));

create table if not exists messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references conversations(id) on delete cascade,
  sender_id uuid not null references profiles(id) on delete cascade,
  body text not null check (char_length(body) > 0),
  body_length int not null generated always as (char_length(body)) stored,
  created_at timestamptz not null default now(),
  delivered_at timestamptz,
  read_at timestamptz
);

create table if not exists quick_reply_events (
  id uuid primary key default gen_random_uuid(),
  message_id uuid not null references messages(id) on delete cascade,
  command text not null check (command in ('ok', 'ack', 'eta')),
  created_at timestamptz not null default now()
);

-- Optional helper view for stats
create or replace view v_message_stats_48h as
select
  sender_id,
  count(*) as message_count,
  avg(body_length)::numeric(10,2) as avg_body_length
from messages
where created_at >= now() - interval '48 hours'
group by sender_id;

-- Enable RLS and add starter policies (tighten for production use)
alter table profiles enable row level security;
alter table friend_invites enable row level security;
alter table friendships enable row level security;
alter table conversations enable row level security;
alter table messages enable row level security;
alter table quick_reply_events enable row level security;

create policy "profiles_select_self" on profiles
for select using (auth.uid() = id);

create policy "profiles_update_self" on profiles
for update using (auth.uid() = id);

create policy "profiles_insert_self" on profiles
for insert with check (auth.uid() = id);
