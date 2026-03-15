# TerMe Architecture (Flutter + Clean Architecture)

## Goals

- Shared iOS + Android codebase
- High testability
- Clear dependency inversion boundaries
- Replaceable backend implementations

## Layered architecture

```text
presentation  ->  domain  <-  data
                    ^
                    |
             interfaces (contracts)
```

### Presentation layer

- Flutter widgets and state management
- Receives user actions and renders terminal UI
- Depends only on domain use cases and domain entities

### Domain layer

- Business rules, entities, and use cases
- Defines repository interfaces (contracts)
- No framework/backend details

### Data layer

- Repository implementations
- Remote/local datasources
- DTO mapping
- Depends on external services (Supabase, local DB)

## Dependency inversion strategy

Domain owns abstractions. Data implements abstractions.

Example:

- `AuthRepository` interface lives in `domain`
- `SupabaseAuthRepository` lives in `data`
- Composition root wires implementation to interface

This preserves testability and allows swapping backend providers.

## Proposed Flutter structure

```text
terme_flutter/lib/
  app/
    app.dart
    router.dart
    di/
      providers.dart
  core/
    constants/
    theme/
    widgets/
  features/
    auth/
      domain/
      data/
      presentation/
    contacts/
      domain/
      data/
      presentation/
    messaging/
      domain/
      data/
      presentation/
    stats/
      domain/
      data/
      presentation/
```

## State management

- Riverpod recommended for testable, composable state logic
- Keep business rules in use cases, not widgets

## Backend recommendation

- Supabase Auth for login/signup
- Supabase Postgres for data persistence
- Supabase Realtime for message streams

## Security baseline

- TLS in transit
- Auth token handling via secure storage
- Server-side row-level security (RLS) for all user data tables

## Testing approach

- Domain: pure unit tests for use cases/entities
- Data: repository tests with mocked data source clients
- Presentation: widget tests for terminal command flows

## Notes on "cipher mode"

Cipher mode should be treated as optional playful UX, not primary security.
Actual message confidentiality should rely on robust cryptographic design
in future milestones (prefer audited libraries and formal threat modeling).
