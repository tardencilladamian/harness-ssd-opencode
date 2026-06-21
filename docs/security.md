# Security

## Purpose

Define security, privacy, permission, and sensitive data rules.

## Hard Rules

- Do not commit secrets.
- Do not expose private data in logs.
- Do not store payment card data unless explicitly approved and compliant.
- Do not rely only on frontend permission checks.
- Do not make private files publicly accessible by direct URL.
- Do not weaken authentication or authorization without approval.

## Secrets

Secrets must live in environment variables or approved secret storage.

Never commit:

- API keys.
- Tokens.
- Passwords.
- Private keys.
- Production database URLs.

## Permissions

Every protected action must define:

- Who can perform it.
- What data they can access.
- What data they can modify.
- What audit trail is required.

## Security Review

Every feature review must check:

- Authentication.
- Authorization.
- Input validation.
- Sensitive data exposure.
- Logging.
- Storage access.
- Public/private visibility.
