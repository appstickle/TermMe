# TerMe Flutter App

This folder contains the initial Flutter application skeleton for TerMe.

## Focus of this scaffold

- Terminal-first UX foundation
- Clean architecture with dependency inversion
- Feature boundaries for auth, contacts, messaging, and stats

## Run locally

```bash
flutter pub get
flutter run
```

## Current implementation status

- Basic app shell and tabs
- Domain contracts and use cases
- In-memory repository stubs for local iteration

Replace stubs with Supabase-backed repositories in next iteration.

## Folder structure

```text
lib/
  app/
    di/
  core/
    theme/
    widgets/
  features/
    <feature_name>/
      domain/
        entities/
        repositories/
        use_cases/
      data/
        repositories/
      presentation/
        screens/
```

This separation keeps UI, business logic, and data implementations isolated and
supports dependency inversion cleanly.
