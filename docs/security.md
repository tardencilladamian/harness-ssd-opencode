# Security

This file defines security, privacy, permission, upload, secret, logging, and payment rules.

## Authentication

- Replace with auth strategy.
- Password rules:
- Session/token rules:
- Social login providers:

## Authorization

- Define roles.
- Define resource ownership.
- Define admin-only actions.
- Define public/private visibility.

## Sensitive Data

- List sensitive fields.
- Do not log sensitive data.
- Do not expose private data through public URLs.
- Do not store payment card data unless the approved provider and compliance scope explicitly allow it.

## Uploads

- Storage provider:
- Public/private policy:
- File type limits:
- Size limits:
- Virus/malware scanning:
- Signed URL rules:

## Secrets

- Secrets must live in environment variables or secret storage.
- Do not commit secrets.
- Do not print secrets in logs.

## Audit / Logging

- Log security-relevant actions.
- Avoid storing sensitive payloads.
- Include enough context to debug without exposing private data.

## Security Review Triggers

Use the critical quality gate for:

- Authentication.
- Authorization.
- Payments.
- Private data.
- Uploads.
- Public visibility.
- Data migration.
- Admin actions.

## Open Questions

- Replace with unresolved security questions.
