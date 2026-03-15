# TerMe

Terminal-style messenger for iOS and Android with a game-like reply loop.

## Vision

TerMe is designed to reduce reply friction for busy people by making responses
feel like a quick terminal interaction rather than a social-media chore.

Core user promise:

- fast, low-friction replies in 5-15 seconds
- terminal-first UX (green-on-black, command driven, ASCII widgets)
- relationship maintenance through playful mechanics, not guilt mechanics

## Repository layout

- `docs/PRD.md` - v1 product requirements document
- `docs/ARCHITECTURE.md` - clean architecture and dependency inversion plan
- `docs/BACKEND_SCHEMA.sql` - initial Supabase/Postgres schema draft
- `docs/SETUP.md` - local development setup instructions
- `terme_flutter/` - Flutter starter skeleton

Flutter code is organized with explicit folder separation:
`presentation/screens`, `domain/use_cases`, and `data/repositories` per feature.

## Stack (recommended)

- Flutter (Dart) for shared iOS + Android client
- Supabase for auth, realtime, and Postgres data model
- Optional end-to-end message encryption for future phases

## Current status

This repository contains a manually scaffolded Flutter project structure and
application architecture. Flutter SDK is not available in this cloud runtime,
so generation/build commands were not executed here.

## Next commands (run locally)

```bash
cd terme_flutter
flutter pub get
flutter run
```

## Product scope snapshot

- terminal login/signup flow (email/phone + password)
- handle search and invite/accept friend flow
- 1:1 terminal messaging
- quick-reply commands (`/ack`, `/eta`, `/ok`)
- terminal stats widgets and activity tabs
