# AGENTS.md — Little Logic Lab

This file is the primary source of truth for AI coding assistants (Cursor, Codex, and others) working in this repository.

Before making architectural or product decisions, consult:

1. `AGENTS.md` (this file)
2. `docs/Vision.md`
3. `docs/Architecture.md`
4. `docs/Curriculum.md`
5. `docs/UI-Guidelines.md`
6. `docs/CodingStandards.md`
7. `docs/DECISIONS.md`

These documents take precedence over assumptions.

---

## Project Vision

Little Logic Lab is a calm, Montessori-inspired reasoning app for children aged **3–7**.

The purpose is **not** to teach Sudoku. The purpose is to teach children **how to think** through carefully designed reasoning activities.

## Mission

The app should help children develop:

- Observation
- Pattern Recognition
- Logical Thinking
- Deduction
- Persistence
- Independent Problem Solving

Every feature should improve one or more of these abilities.

## Core Principles

1. Teach reasoning, not memorization.
2. Encourage discovery instead of direct instruction.
3. Mistakes are learning opportunities.
4. Never reveal answers.
5. Reward curiosity, not speed.
6. Prioritize calm interaction over stimulation.

**We will never add manipulative engagement mechanics.**

## Product Philosophy

- The app adapts to the child.
- Children never adapt to the app.
- Age is only a recommendation.
- Progress depends on concept mastery.

## Learning Journey

```
Matching
  ↓
Sorting
  ↓
Same / Different
  ↓
Patterns
  ↓
Sequences
  ↓
Rows
  ↓
Columns
  ↓
Elimination
  ↓
Deduction
  ↓
Mini Sudoku
  ↓
4×4 Sudoku
  ↓
6×6 Sudoku
  ↓
9×9 Sudoku
```

Every new puzzle type must appear in `docs/Curriculum.md` before implementation.

## Hint Philosophy

Never give answers. Hints should ask questions.

Examples:

- What is missing?
- Can this go here?
- Why not?
- What do you notice?
- Is there another place?

## UI Philosophy

- Warm
- Minimal
- Montessori-inspired
- Large touch targets
- Accessible
- Calm animations
- Soft colors

## Engineering Philosophy

Every new feature should:

- Be reusable
- Be testable
- Avoid duplicate code
- Prefer composition over inheritance
- Keep widgets small
- Keep business logic outside UI
- Follow clean architecture

## Before Writing Code

Ask:

1. Does this improve reasoning?
2. Is it reusable?
3. Does it fit the design system?
4. Does it increase complexity unnecessarily?

If yes to #4, redesign it.

## Expected Behaviour for AI Assistants

When generating code:

- Think like a senior Flutter engineer.
- Think long term.
- Don't optimize for speed of coding.
- Optimize for maintainability.

---

## Instructions for AI Coding Assistants

This repository is intended to be developed collaboratively with AI coding assistants such as Codex and Cursor.

Before making architectural decisions, always consult:

- `AGENTS.md`
- `docs/Vision.md`
- `docs/Architecture.md`
- `docs/Curriculum.md`

These documents take precedence over assumptions.

When uncertain, choose the solution that is:

- Simpler
- More maintainable
- More reusable
- More aligned with the educational philosophy

Do not introduce new frameworks, libraries, or product features without explaining the trade-offs.

Never add gamification or engagement mechanics that conflict with the project's learning philosophy.

When implementing new functionality:

- Reuse existing components where possible.
- Follow the design system (`docs/UI-Guidelines.md`).
- Keep business logic separate from presentation.
- Write code that is easy to test and extend.
- Explain architectural decisions when they are not obvious.
- Record significant decisions in `docs/DECISIONS.md`.
