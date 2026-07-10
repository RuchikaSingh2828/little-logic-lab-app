# Architecture

High-level system structure for Little Logic Lab. Prefer composition, small widgets, and business logic outside the UI.

## Overview

```
App
  ↓
Navigation
  ↓
Features
  ↓
Puzzle Engine
  ↓
Progress Engine
  ↓
Hint Engine
  ↓
Storage
```

## Layers

### App

- Flutter application shell
- Theme / design system wiring
- Dependency / provider setup (Riverpod planned)
- Global configuration

### Navigation

- Route definitions (GoRouter planned)
- Child-facing flows vs parent/settings flows
- Deep links only if they serve learning continuity (not engagement tricks)

### Features

Feature modules map to curriculum concepts and supporting surfaces, for example:

- Onboarding / age recommendation (non-binding)
- Activity home / concept map
- Matching, Sorting, Patterns, Sequences, etc.
- Sudoku family (mini → 4×4 → 6×6 → 9×9)
- Parent / progress overview
- Settings (accessibility, sound soft-toggle, etc.)

Features compose shared engines; they do not reimplement puzzle rules ad hoc.

### Puzzle Engine

Reusable core for:

- Puzzle definition and validation
- Move application and legality
- Win / incomplete / invalid states
- Difficulty parameters per curriculum entry

Puzzle types plug into a common interface so new curriculum items reuse the framework.

### Progress Engine

- Concept mastery tracking (not XP/points)
- Prerequisites and unlock based on mastery
- Age as recommendation only
- Session history useful for parents and adaptive placement

### Hint Engine

- Never reveals answers
- Produces question-style prompts
- Context-aware (board state, concept, recent mistakes)
- Rate/limit hints to encourage independent thinking without frustration cliffs

### Storage

- Local-first persistence of progress and preferences
- Serializable models for mastery and puzzle state
- Clear separation from UI; engines own domain rules

## Cross-cutting rules

- Keep business logic outside widgets
- Prefer composition over inheritance
- Shared UI from the design system only
- New architecture choices must be recorded in `DECISIONS.md`
- No gamification subsystems (streaks, coins, leaderboards, manipulative notifications)

## Planned stack (see Decision Log)

- Flutter
- Riverpod
- GoRouter

Folder layout under `lib/` will evolve toward clean architecture (e.g. `core/`, `features/`, `shared/`) as V1 lands. Update this document when the concrete tree is established.
