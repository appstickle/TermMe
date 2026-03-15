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

## Implemented Flutter structure

```text
terme_flutter/lib/
  main.dart
  app/
    app.dart
    di/
      dependency_container.dart
  core/
    theme/
      terminal_theme.dart
    widgets/
      terminal_panel.dart
  features/
    auth/
      domain/
        entities/
          account.dart
    chat/
      data/
        repositories/
          in_memory_message_repository.dart
      domain/
        entities/
          terminal_message.dart
        repositories/
          message_repository.dart
        use_cases/
          send_message_use_case.dart
      presentation/
        screens/
          chat_screen.dart
    friends/
      data/
        repositories/
          in_memory_friend_repository.dart
      domain/
        entities/
          friend_user.dart
        repositories/
          friend_repository.dart
        use_cases/
          search_users_use_case.dart
          send_invite_use_case.dart
      presentation/
        screens/
          friends_screen.dart
    stats/
      domain/
        entities/
          chat_stats.dart
        repositories/
          stats_repository.dart
      data/
        repositories/
          in_memory_stats_repository.dart
      presentation/
        screens/
          stats_screen.dart
```

### Folder naming conventions

- `domain/use_cases` contains business actions (pure logic orchestration)
- `data/repositories` contains concrete implementations of domain contracts
- `presentation/screens` contains route-level UI screens

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
