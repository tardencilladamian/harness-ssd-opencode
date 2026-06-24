# UI

This file defines visual, interaction, accessibility, and frontend rules.

## Design System

- Component library:
- Styling:
- Icons:
- Fonts:
- Color tokens:

## Layout

- Responsive breakpoints:
- App shell:
- Navigation:
- Forms:
- Tables/lists:

## States

Every user-facing flow should define:

- Loading state.
- Empty state.
- Error state.
- Success state.
- Validation state.
- Permission-denied state when applicable.

## Forms

- Use accessible labels.
- Preserve user input when validation fails.
- Show field-level errors.
- Avoid client-only validation for security-sensitive rules.

## Accessibility

- Keyboard navigation must work.
- Interactive elements need accessible names.
- Color alone must not communicate state.
- Use semantic HTML where possible.

## Browser Testing

When UI behavior is part of a feature, Auto Test should perform real browser checks.

When Playwright is used, run headed mode:

```bash
pnpm exec playwright test --headed
```

## Open Questions

- Replace with unresolved UI questions.
