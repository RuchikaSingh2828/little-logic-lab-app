# Decision Log

Record significant product or architectural decisions briefly. Newest entries at the top.

---

## 2026-07-11

### Decision: Flutter + Riverpod + GoRouter

**Reason:** Cross-platform support, strong ecosystem, and maintainable architecture for long-term development. Riverpod for testable state outside the UI; GoRouter for declarative navigation as features grow.

### Decision: No gamification in V1

**Reason:** The product’s goal is to foster intrinsic motivation and reasoning rather than maximize engagement. No streaks, coins, leaderboards, or manipulative engagement mechanics.

### Decision: Docs-first source of truth

**Reason:** `AGENTS.md` plus `docs/*` define vision, curriculum, architecture, UI, and standards so humans and AI assistants share the same constraints before writing code.

### Decision: Curriculum before implementation

**Reason:** Every puzzle type must be specified in `docs/Curriculum.md` before code, ensuring educational sequencing and reusable engine design over ad-hoc screens.
