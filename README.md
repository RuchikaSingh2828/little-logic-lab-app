# Little Logic Lab

A calm, Montessori-inspired reasoning app that helps children aged **3–7** learn how to think—through observation, patterns, deduction, and carefully sequenced puzzles.

This is **not** a Sudoku drill app. Sudoku appears only after children have built the underlying reasoning skills.

## Why it exists

Many kids' apps optimize for engagement: timers, streaks, badges, and pressure. Little Logic Lab optimizes for **thinking**.

Children develop:

- Observation
- Pattern recognition
- Logical thinking
- Deduction
- Persistence
- Independent problem solving

The app adapts to the child. Progress follows concept mastery, not age labels or speed.

## Tech stack

| Layer | Choice |
|-------|--------|
| Framework | Flutter |
| State management | Riverpod (planned) |
| Navigation | GoRouter (planned) |
| Platforms | iOS, Android, macOS, Web (and desktop as needed) |

See `docs/DECISIONS.md` for why these choices were made.

## Folder structure

```
lib/                 # App source (to grow with clean architecture)
docs/                # Product & engineering source of truth
scripts/             # Local setup helpers
test/                # Tests
android/ ios/ ...    # Platform runners
```

Key documents:

| Doc | Purpose |
|-----|---------|
| `AGENTS.md` | Rules for humans and AI assistants |
| `docs/Vision.md` | Product vision (no implementation) |
| `docs/Architecture.md` | System structure |
| `docs/Curriculum.md` | Educational specification |
| `docs/UI-Guidelines.md` | Design system |
| `docs/Roadmap.md` | Milestones |
| `docs/CodingStandards.md` | Engineering conventions |
| `docs/PromptLibrary.md` | Reusable AI prompts |
| `docs/DECISIONS.md` | Decision log |

## How to run

Prerequisites: Flutter stable, and for native targets Xcode (macOS/iOS) and/or Android SDK.

```bash
flutter pub get
flutter run -d chrome    # quickest smoke test
flutter run -d macos     # desktop
flutter run              # pick a connected device
```

Optional helpers:

```bash
./scripts/setup_android.sh
./scripts/setup_xcode.sh
./scripts/run.sh
```

## Roadmap

See `docs/Roadmap.md`. V1 focuses on project foundation, design system, puzzle framework, early reasoning activities (matching → patterns → rows/columns), mini Sudoku, and progress—without gamification.

## Contributing (including AI)

Read `AGENTS.md` before changing architecture or product behavior. Prefer simple, reusable, testable solutions aligned with the educational philosophy. Never add manipulative engagement mechanics.
