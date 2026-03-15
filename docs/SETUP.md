# TerMe Local Setup

## Prerequisites

- Flutter SDK (stable channel)
- Xcode (for iOS builds on macOS)
- Android Studio + SDK (for Android builds)
- Supabase project for backend services

## 1) Install dependencies

```bash
cd terme_flutter
flutter pub get
```

## 2) Configure runtime variables

Create:

`terme_flutter/.env`

```dotenv
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

## 3) Run app

```bash
cd terme_flutter
flutter run
```

## 4) Backend setup

1. Open Supabase SQL editor
2. Run `docs/BACKEND_SCHEMA.sql`
3. Validate RLS policies and tighten for production

## 5) Recommended next tasks

- Wire real Supabase implementations for auth/messages/invites
- Add push notifications (FCM/APNS)
- Build command parser autocomplete and help text
- Implement widget and domain tests
