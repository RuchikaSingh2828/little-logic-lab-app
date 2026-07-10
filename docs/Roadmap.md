# Roadmap

Milestones for Little Logic Lab. Adjust dates in the Decision Log if scope changes; keep philosophy fixed unless explicitly revised.

## V1

Foundation and a **scaffolded vertical slice** through mini Sudoku—**no gamification**.

### V1 vertical slice (authoritative for unlocks in V1)

`Curriculum.md` defines the **full long-term** learning journey and prerequisites. V1 does **not** ship every concept. For V1 Progress Engine unlocks, use this subset only:

**Matching → Patterns → Rows → Columns → Mini Sudoku**

Concepts deferred to V2+ (Sorting, Same/Different, Sequences, Elimination, Deduction, larger Sudoku) remain in the curriculum catalog but are **not** required to unlock V1 activities. Scaffolding and gentle onboarding stand in for missing intermediate concepts until those activities ship.

1. **Project setup** — Flutter app, docs, tooling, CI basics as needed  
2. **Navigation** — GoRouter shell; child vs parent entry points  
3. **Design system** — Theme, typography, colors, shared components per UI Guidelines  
4. **Puzzle framework** — Puzzle Engine interfaces + first adapters  
5. **Matching** — First curriculum activity  
6. **Patterns** — Pattern continuation / recognition  
7. **Rows** — Horizontal constraint reasoning  
8. **Columns** — Vertical constraint reasoning  
9. **Mini Sudoku** — Tiny Sudoku-like destination for V1  
10. **Progress** — Mastery-based Progress Engine along the V1 slice (no XP/streaks)  
11. **Polish** — Accessibility, calm motion, hint questions, parent clarity  

### Explicitly out of V1

- Coins, streaks, leaderboards, timed pressure modes  
- Sorting, Same/Different, Sequences, Elimination, Deduction (see V2)  
- Full 4×4 / 6×6 / 9×9 Sudoku (post–Mini Sudoku path)  
- Manipulative notifications or engagement loops  

## V2 (indicative)

- Sorting, Same/Different, Sequences (complete early journey)  
- Elimination and Deduction activities  
- Richer Hint Engine  
- Stronger parent progress views  

## V3 (indicative)

- 4×4 Sudoku  
- 6×6 Sudoku  
- 9×9 Sudoku  
- Deeper adaptive placement  

## Working agreement

- New puzzle types: `Curriculum.md` first, then code  
- Significant choices: `DECISIONS.md`  
- Prefer shipping a calm vertical slice over many half-finished activities  
