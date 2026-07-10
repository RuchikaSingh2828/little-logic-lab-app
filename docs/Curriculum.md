# Curriculum

Educational specification for Little Logic Lab. **Every future puzzle belongs here first**—before code.

Progression is mastery-based. Age is a recommendation only.

## Learning journey order

1. Matching  
2. Sorting  
3. Same / Different  
4. Patterns  
5. Sequences  
6. Rows  
7. Columns  
8. Elimination  
9. Deduction  
10. Mini Sudoku  
11. 4×4 Sudoku  
12. 6×6 Sudoku  
13. 9×9 Sudoku  

---

## Concept catalog

### Matching

| Field | Detail |
|-------|--------|
| **Objective** | Recognize and pair identical or related items |
| **Skills** | Observation, attention |
| **Puzzle types** | Pair matching, find the match |
| **Difficulty** | Few items → more items; visual similarity increases |
| **Prerequisites** | None |

### Sorting

| Field | Detail |
|-------|--------|
| **Objective** | Group items by a shared attribute |
| **Skills** | Observation, categorization |
| **Puzzle types** | Sort by color, shape, size |
| **Difficulty** | One attribute → multiple attributes |
| **Prerequisites** | Matching |

### Same / Different

| Field | Detail |
|-------|--------|
| **Objective** | Identify what is alike and what differs |
| **Skills** | Observation, comparison |
| **Puzzle types** | Odd one out, find the same |
| **Difficulty** | Obvious differences → subtle differences |
| **Prerequisites** | Sorting |

### Patterns

| Field | Detail |
|-------|--------|
| **Objective** | Detect and continue repeating structures |
| **Skills** | Pattern recognition |
| **Puzzle types** | ABAB, ABC, growing patterns |
| **Difficulty** | Short / simple → longer / nested |
| **Prerequisites** | Same / Different |

### Sequences

| Field | Detail |
|-------|--------|
| **Objective** | Order items by a rule |
| **Skills** | Pattern recognition, logical thinking |
| **Puzzle types** | Order by size, story order, number-like sequences without requiring formal math |
| **Difficulty** | Short sequences → longer with distractors |
| **Prerequisites** | Patterns |

### Rows

| Field | Detail |
|-------|--------|
| **Objective** | Understand constraints along a horizontal line |
| **Skills** | Logical thinking, observation |
| **Puzzle types** | Fill / place so a row rule holds (e.g. no repeats) |
| **Difficulty** | Short rows → longer; fewer clues → more reasoning |
| **Prerequisites** | Sequences |

### Columns

| Field | Detail |
|-------|--------|
| **Objective** | Understand constraints along a vertical line |
| **Skills** | Logical thinking, observation |
| **Puzzle types** | Same family as rows, vertical focus |
| **Difficulty** | Parallel to Rows |
| **Prerequisites** | Rows |

### Elimination

| Field | Detail |
|-------|--------|
| **Objective** | Rule out impossible options systematically |
| **Skills** | Deduction, persistence |
| **Puzzle types** | “What cannot go here?”, process of elimination grids |
| **Difficulty** | Few candidates → denser possibility spaces |
| **Prerequisites** | Rows, Columns |

### Deduction

| Field | Detail |
|-------|--------|
| **Objective** | Combine multiple constraints to reach a necessary conclusion |
| **Skills** | Deduction, independent problem solving |
| **Puzzle types** | Multi-constraint placement, simple logic grids |
| **Difficulty** | One-step → multi-step reasoning |
| **Prerequisites** | Elimination |

### Mini Sudoku

| Field | Detail |
|-------|--------|
| **Objective** | Apply row/column (and region if used) constraints on a tiny board |
| **Skills** | All prior skills in combination |
| **Puzzle types** | Very small Sudoku-like boards (e.g. 4 cells / tiny grids as designed) |
| **Difficulty** | Highly scaffolded → less scaffolding |
| **Prerequisites** | Deduction |

### 4×4 Sudoku

| Field | Detail |
|-------|--------|
| **Objective** | Classic Sudoku rules on a 4×4 grid |
| **Skills** | Deduction, persistence, independent solving |
| **Puzzle types** | 4×4 Sudoku |
| **Difficulty** | Clue density and uniqueness of paths |
| **Prerequisites** | Mini Sudoku |

### 6×6 Sudoku

| Field | Detail |
|-------|--------|
| **Objective** | Scale Sudoku reasoning to 6×6 |
| **Skills** | Same as 4×4 with greater working memory load |
| **Puzzle types** | 6×6 Sudoku |
| **Difficulty** | Gradual increase in complexity |
| **Prerequisites** | 4×4 Sudoku |

### 9×9 Sudoku

| Field | Detail |
|-------|--------|
| **Objective** | Full classic Sudoku as a *destination*, not a starting point |
| **Skills** | Full reasoning stack |
| **Puzzle types** | 9×9 Sudoku |
| **Difficulty** | Easy → harder, still without answer reveal |
| **Prerequisites** | 6×6 Sudoku |

---

## Adding a new puzzle

1. Add or extend a concept section above (objective, skills, types, difficulty, prerequisites).  
2. Confirm it advances at least one mission skill.  
3. Confirm hints can be question-based (never answer reveal).  
4. Then implement against the Puzzle Engine (`Architecture.md`).
