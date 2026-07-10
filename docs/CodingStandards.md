# Coding Standards

Engineering conventions for Little Logic Lab. Optimize for maintainability, not coding speed.

## Naming

- Dart: `lowerCamelCase` for members, `UpperCamelCase` for types, `snake_case.dart` for files
- Features named after curriculum concepts when possible (`matching`, `patterns`, `mini_sudoku`)
- Engines: clear domain names (`PuzzleEngine`, `HintEngine`, `ProgressEngine`)
- Avoid abbreviations unless standard (`ctx` only in tiny local scopes if at all)

## Folder structure (target)

```
lib/
  app/           # shell, router, theme wiring
  core/          # engines, domain models, storage
  features/      # feature modules (UI + feature-local glue)
  shared/        # design system widgets, utils
```

Adjust as V1 lands; update `Architecture.md` when the tree stabilizes.

## State management

- Prefer Riverpod for app/feature state (see Decision Log)
- UI reads state; domain logic lives in engines/notifiers/controllers—not in widgets
- Avoid giant god-notifiers; scope state to feature or engine

## Widget size limits

- Prefer small, focused widgets
- If a `build` method is hard to scan, extract
- Composition over deep inheritance
- No business rules inside `build`

## Testing expectations

- Domain/engines: unit tests required for new logic
- Widgets: golden or widget tests for critical interactions when stable
- New puzzle types: tests for validation, win state, and illegal moves
- Hints: assert that outputs are questions / guidance, never the solution

## Documentation rules

- Public APIs and non-obvious architecture: short dartdoc or comments explaining *why*
- Product/education changes: update `Curriculum.md` / `Vision.md` as needed
- Significant decisions: append `DECISIONS.md`
- Do not leave stale docs; update in the same PR when behavior changes

## Commit style

- Concise, imperative subject focused on *why*
- One logical change per commit when practical
- Do not commit secrets, local SDK paths, or `.DS_Store`
- Prefer committing `pubspec.lock` for the app once `.gitignore` allows it

## Dependencies

- Do not add frameworks/libraries without trade-offs noted (PR description or Decision Log)
- Prefer Flutter/Dart std and already-chosen stack
- No analytics/engagement SDKs that conflict with philosophy without an explicit decision

## Forbidden product patterns in code

- Streak counters, coin economies, leaderboards
- Answer-reveal helpers
- Dark patterns (forced ratings, nagging push for “engagement”)
