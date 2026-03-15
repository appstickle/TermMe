# TerMe Product Requirements Document (v1)

## 1) Product summary

TerMe is a terminal-inspired messenger for iOS and Android focused on one
behavioral goal: help busy friends respond quickly and consistently.

Unlike standard messaging apps, TerMe emphasizes low-friction, command-based
responses and lightweight response game mechanics.

## 2) Problem statement

Many close relationships weaken due to delayed responses, even when both people
care. Existing messenger UX often makes replying feel like work.

TerMe aims to reframe replies as:

- tiny, fast interactions
- playful terminal micro-actions
- measurable response health over time

## 3) Target users

- Adults with busy schedules (work + family load)
- Tech-friendly users who enjoy terminal/retro aesthetics
- Close relationships where consistency matters more than long messages

## 4) Product principles

1. Replying must feel easier than postponing.
2. Respect user time: 5-15 second interactions should be first-class.
3. Playful, not manipulative: no shame loops.
4. Terminal identity should be authentic and coherent.
5. Security and privacy are non-negotiable.

## 5) Core v1 features

### 5.1 Auth and account

- Sign up via email + password (phone auth optional in v1.1)
- Login via terminal command flow (`/signup`, `/login`)
- Create unique handle (e.g. `@termebuddy`)

### 5.2 Friend graph

- Search by handle
- Send invite command (`/invite @handle`)
- Accept invite command (`/accept <invite_id>`)
- Only accepted pairs can message

### 5.3 Messaging

- 1:1 real-time messaging
- Terminal chat window
- Message status: sent / delivered / read
- Message metadata for stats (length, latency)

### 5.4 Fast-reply commands

- `/ok`
- `/ack <short text>`
- `/eta <duration>`

These commands are optimized to reduce cognitive load and improve response time.

### 5.5 Stats terminal tab

- Messages sent in last 24h / 48h
- Average response latency
- Average message length
- Active reply streak

Rendered as tiny terminal-style bar/line widgets.

### 5.6 Terminal tabs

- `chat`
- `stats`
- `friends`
- `account`

## 6) Optional v1.1 extension (play mode)

- Per-chat optional "cipher mode" for playful obfuscation
- Intended as a 3-10 second decode mini-interaction
- Must be explicitly enabled by both users

## 7) Non-functional requirements

- iOS + Android from one shared codebase
- Real-time message delivery target under 1 second (network permitting)
- Offline queue for outgoing messages
- Strong account security (hashed passwords handled by provider)
- Encrypted transport (TLS)

## 8) Analytics events (privacy-safe)

- `signup_completed`
- `invite_sent`
- `invite_accepted`
- `message_sent`
- `fast_reply_used`
- `response_latency_bucket`
- `streak_incremented`

No message body collection in analytics payloads.

## 9) v1 success metrics

- Day-7 retention above 35%
- 50% of replies sent within 2 hours
- 30% of sent messages using fast-reply commands
- Invite acceptance rate above 40%

## 10) Risks and mitigations

- Risk: novelty wears off -> keep core loop short, useful, and optional
- Risk: terminal UX too complex -> provide command hints/autocomplete
- Risk: security misconceptions around "hack mode" -> keep it opt-in and clear

## 11) Delivery plan

### Milestone A

- Auth, handles, friend invites

### Milestone B

- 1:1 chat, push notifications, quick replies

### Milestone C

- Stats dashboard and streak logic

### Milestone D

- Optional cipher mode and polish
