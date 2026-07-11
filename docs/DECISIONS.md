# Decision Log

Record significant product or architectural decisions briefly. Newest entries at the top.

---

## 2026-07-11

### Decision: Multi-child profiles with local persistence

**Reason:** Households often have more than one child. Profiles (name, age recommendation, accent key) live on-device via `shared_preferences` so the app works offline-first without accounts in V1.

### Decision: Widget-built entry UI (not full-screen mockup images)

**Reason:** Full-bleed mockup screens felt disconnected from a real app chrome. Profile picker and child home are composed from shared soft cards, avatars, and theme tokens so layout adapts across devices. Character PNGs are cropped accents only; activity tiles use icon placeholders until illustration assets exist.

### Decision: Shared static child home shell

**Reason:** Every child opens the same home after selection. Progress tiles, activity counts, and Parent Zone actions are visual-only until the progress engine and activities exist—avoids fake mastery metrics.

### Decision: V1 uses a scaffolded curriculum slice

**Reason:** The full journey in `Curriculum.md` is the long-term educational path. V1 ships Matching → Patterns → Rows → Columns → Mini Sudoku so we can validate the puzzle framework and calm UX without blocking on every intermediate concept. Deferred concepts stay in the curriculum; Progress unlocks for V1 follow the Roadmap slice, not the full prerequisite chain.

### Decision: Flutter + Riverpod + GoRouter

**Reason:** Cross-platform support, strong ecosystem, and maintainable architecture for long-term development. Riverpod for testable state outside the UI; GoRouter for declarative navigation as features grow.

### Decision: No gamification in V1

**Reason:** The product’s goal is to foster intrinsic motivation and reasoning rather than maximize engagement. No streaks, coins, leaderboards, or manipulative engagement mechanics.

### Decision: Docs-first source of truth

**Reason:** `AGENTS.md` plus `docs/*` define vision, curriculum, architecture, UI, and standards so humans and AI assistants share the same constraints before writing code.

### Decision: Curriculum before implementation

**Reason:** Every puzzle type must be specified in `docs/Curriculum.md` before code, ensuring educational sequencing and reusable engine design over ad-hoc screens.
