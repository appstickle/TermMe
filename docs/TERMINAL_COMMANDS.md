# TerMe Terminal Command Spec (v1)

## Command design goals

- 1 command = 1 intention
- low typing overhead
- discoverable by `/help`

## Auth

- `/signup <email> <password>`
- `/login <email> <password>`
- `/logout`

## Account

- `/handle set @newhandle`
- `/me`

## Friends

- `/find @query`
- `/invite @handle`
- `/invites`
- `/accept <invite_id>`
- `/decline <invite_id>`

## Messaging

- `/chat @handle`
- `/msg @handle <text>`
- `/ok @handle`
- `/ack @handle <text>`
- `/eta @handle <duration>`

## Stats

- `/stats`
- `/stats 24h`
- `/stats 48h`

## Modes

- `/mode cipher on`
- `/mode cipher off`

## Help

- `/help`
- `/help <command>`
