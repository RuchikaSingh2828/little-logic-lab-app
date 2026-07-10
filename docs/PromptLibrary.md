# Prompt Library

Reusable prompts for Codex / Cursor. Keep them aligned with `AGENTS.md` and the docs.

---

## Generate a new puzzle type

```
Implement a new puzzle type for Little Logic Lab.

Constraints:
- Read AGENTS.md, docs/Curriculum.md, docs/Architecture.md, docs/UI-Guidelines.md first.
- The concept must already exist (or be added) in docs/Curriculum.md before code.
- Plug into the Puzzle Engine; do not fork one-off rules in the UI.
- Hints must ask questions and never reveal answers.
- No gamification.
- Keep business logic outside widgets; add unit tests for validation and win/illegal moves.
- Follow the design system; large touch targets; calm feedback.

Concept: <NAME>
Objective: <...>
Skills: <...>
Difficulty notes: <...>
```

---

## Refactor widgets

```
Refactor the following Flutter UI for Little Logic Lab.

Goals:
- Smaller widgets, composition over inheritance
- Business logic out of build methods
- Reuse design-system components
- No behavior change unless required for clarity
- Keep Montessori-calm UX (no new engagement chrome)

Files/area: <...>
```

---

## Improve accessibility

```
Improve accessibility for <screen/feature> in Little Logic Lab.

Requirements:
- Semantic labels for controls and key puzzle states
- Color not the only signal
- Touch targets ≥ 48dp (prefer larger)
- Respect reduced motion
- Soft, non-shaming incorrect-state feedback
- Align with docs/UI-Guidelines.md
```

---

## Add tests

```
Add tests for <engine/feature> in Little Logic Lab.

Cover:
- Domain rules / validation
- Win and illegal move cases
- Hint behavior never includes the direct answer
- Keep tests readable and close to the code under test

Do not weaken production code to make tests pass.
```

---

## Build a reusable component

```
Create a reusable Flutter component for Little Logic Lab’s design system.

Requirements:
- Document props/API briefly
- Large touch targets, soft visuals, calm optional motion
- Accessible by default
- No feature-specific business logic inside the component
- Show an example usage in a feature or gallery if one exists

Component purpose: <...>
```

---

## Architecture decision

```
Propose an architectural approach for <problem>.

Must:
- Compare 2–3 options with trade-offs
- Prefer simpler / more maintainable / more reusable
- Align with educational philosophy (no manipulative engagement)
- If we adopt one, draft a DECISIONS.md entry dated today
```
