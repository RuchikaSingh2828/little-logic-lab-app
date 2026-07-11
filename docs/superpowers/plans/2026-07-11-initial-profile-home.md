# Initial Profile Picker & Child Home Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship the app shell with a hybrid profile picker, Option C create-profile flow, and a static shared child-home mockup screen.

**Architecture:** Riverpod + GoRouter app shell; `ChildProfile` domain + `shared_preferences` repository; feature screens under `lib/features/`; soft shared widgets and character avatar assets (mockup PNGs are design references only).

**Tech Stack:** Flutter, flutter_riverpod, go_router, shared_preferences

**Spec:** [docs/superpowers/specs/2026-07-11-initial-profile-home-design.md](../specs/2026-07-11-initial-profile-home-design.md)

---

## File map

| Path | Responsibility |
|------|----------------|
| `pubspec.yaml` | Add deps + mockup assets |
| `assets/mockups/profile_picker.jpg` | Profile screen artwork |
| `assets/mockups/child_home.jpg` | Home screen artwork |
| `lib/main.dart` | `ProviderScope` + `LittleLogicLabApp` |
| `lib/app/app.dart` | `MaterialApp.router` |
| `lib/app/theme.dart` | Warm Montessori-inspired theme |
| `lib/app/router.dart` | GoRouter routes |
| `lib/core/profile/child_profile.dart` | Model + JSON |
| `lib/core/profile/profile_repository.dart` | Load/save/seed |
| `lib/core/profile/profile_providers.dart` | Riverpod providers |
| `lib/features/profile_selection/profile_picker_screen.dart` | Hybrid picker |
| `lib/features/profile_selection/create_profile_screen.dart` | Option C form |
| `lib/features/child_home/child_home_screen.dart` | Hybrid home shell |
| `test/core/profile/child_profile_test.dart` | Model JSON tests |
| `test/core/profile/profile_repository_test.dart` | Repo seed/add tests |
| `test/app/navigation_smoke_test.dart` | Router smoke test |
| `docs/DECISIONS.md` | Record V1 entry UI decisions |
| `.gitignore` | Ignore `.superpowers/` |

---

### Task 1: Dependencies, assets, gitignore

**Files:**
- Modify: `pubspec.yaml`
- Modify: `.gitignore`
- Assets already at: `assets/mockups/profile_picker.jpg`, `assets/mockups/child_home.jpg`

- [ ] **Step 1: Update pubspec**

Add dependencies and assets:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_riverpod: ^2.6.1
  go_router: ^15.1.2
  shared_preferences: ^2.5.3

flutter:
  uses-material-design: true
  assets:
    - assets/mockups/profile_picker.jpg
    - assets/mockups/child_home.jpg
```

- [ ] **Step 2: Append to `.gitignore`**

```
# Local brainstorm / agent artifacts
.superpowers/
```

- [ ] **Step 3: Resolve packages**

Run: `flutter pub get`  
Expected: exit 0

---

### Task 2: ChildProfile model (TDD)

**Files:**
- Create: `lib/core/profile/child_profile.dart`
- Create: `test/core/profile/child_profile_test.dart`

- [ ] **Step 1: Write failing test**

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:little_logic_lab_app/core/profile/child_profile.dart';

void main() {
  test('round-trips through JSON', () {
    const profile = ChildProfile(
      id: 'ava',
      name: 'Ava',
      ageYears: 4,
      accentKey: 'fox',
    );
    expect(ChildProfile.fromJson(profile.toJson()), profile);
  });
}
```

- [ ] **Step 2: Run test — expect FAIL**

Run: `flutter test test/core/profile/child_profile_test.dart`  
Expected: compilation failure (library missing)

- [ ] **Step 3: Implement model**

```dart
import 'package:flutter/foundation.dart';

@immutable
class ChildProfile {
  const ChildProfile({
    required this.id,
    required this.name,
    required this.ageYears,
    required this.accentKey,
  });

  final String id;
  final String name;
  final int ageYears;
  final String accentKey;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ageYears': ageYears,
        'accentKey': accentKey,
      };

  factory ChildProfile.fromJson(Map<String, dynamic> json) {
    return ChildProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      ageYears: json['ageYears'] as int,
      accentKey: json['accentKey'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ChildProfile &&
      other.id == id &&
      other.name == name &&
      other.ageYears == ageYears &&
      other.accentKey == accentKey;

  @override
  int get hashCode => Object.hash(id, name, ageYears, accentKey);
}
```

- [ ] **Step 4: Run test — expect PASS**

Run: `flutter test test/core/profile/child_profile_test.dart`

---

### Task 3: ProfileRepository (TDD)

**Files:**
- Create: `lib/core/profile/profile_repository.dart`
- Create: `test/core/profile/profile_repository_test.dart`

- [ ] **Step 1: Write failing tests** using an in-memory fake prefs map OR `SharedPreferences.setMockInitialValues({})`.

Cover: seeds three demos when empty; `addProfile` persists; `setActiveChildId` / `activeChildId` round-trip.

- [ ] **Step 2: Implement repository** with keys `profiles` (JSON list) and `activeChildId`.

Seed:

```dart
static const demoProfiles = [
  ChildProfile(id: 'ava', name: 'Ava', ageYears: 4, accentKey: 'fox'),
  ChildProfile(id: 'arjun', name: 'Arjun', ageYears: 5, accentKey: 'panda'),
  ChildProfile(id: 'mia', name: 'Mia', ageYears: 6, accentKey: 'bunny'),
];
```

- [ ] **Step 3: Run tests — expect PASS**

---

### Task 4: Theme, router, app shell

**Files:**
- Create: `lib/app/theme.dart`, `lib/app/router.dart`, `lib/app/app.dart`
- Create: `lib/core/profile/profile_providers.dart`
- Replace: `lib/main.dart`

- [ ] **Step 1: Theme** — cream background (`Color(0xFFF7F1E8)`), brown text, soft green primary; no deepPurple.

- [ ] **Step 2: Providers** — `sharedPreferencesProvider`, `profileRepositoryProvider`, `profilesProvider` (AsyncNotifier), `activeChildIdProvider`, helper to resolve active `ChildProfile?`.

- [ ] **Step 3: GoRouter** routes `/profiles`, `/profiles/create`, `/home` with redirect if `/home` and no active child → `/profiles`.

- [ ] **Step 4: `LittleLogicLabApp`** uses `MaterialApp.router` + theme; `main` wraps `ProviderScope`.

- [ ] **Step 5: Temporary placeholder screens so the app compiles; replace in Tasks 5–6.

---

### Task 5: Profile picker + create profile screens

**Files:**
- Create: `lib/features/profile_selection/profile_picker_screen.dart`
- Create: `lib/features/profile_selection/create_profile_screen.dart`

- [ ] **Step 1: Profile picker** — `Stack` with `Image.asset('assets/mockups/profile_picker.jpg', fit: BoxFit.contain)` centered on cream; `LayoutBuilder` + 2×2 transparent `GestureDetector`s over the card region (approx. vertical 0.32–0.72, horizontal inset 0.12). Slots 0–2 select profile by index (if exists) and `context.go('/home')`; slot 3 → `context.go('/profiles/create')`. Semantics labels: profile name / "Add Child".

- [ ] **Step 2: Create profile** — Option C UI: title, dashed avatar placeholder, name `TextField`, age band chips (3–4 → age 4, 5–6 → age 5, 7 → age 7), primary "Start exploring". On submit: create `ChildProfile` with `UniqueKey`/uuid-less `DateTime.now().millisecondsSinceEpoch` id, `accentKey: 'leaf'`, save + set active, `context.go('/home')`. Disable button when name blank.

---

### Task 6: Child home screen

**Files:**
- Create: `lib/features/child_home/child_home_screen.dart`

- [ ] **Step 1: Full-bleed** `child_home.jpg` with `BoxFit.contain` on cream.

- [ ] **Step 2: Back hotspot** top-left (~48×48+) → `context.go('/profiles')`; clear active child optional (keep active for return greeting later).

- [ ] **Step 3: Optional SafeArea text overlay with active child name for debugging/accessibility (`Semantics` header). Other mockup controls: no-op.

---

### Task 7: Navigation smoke test + remove counter test

**Files:**
- Replace: `test/widget_test.dart` or add `test/app/navigation_smoke_test.dart`
- Delete counter assertions from old test

- [ ] **Step 1: Pump app with `ProviderScope` + `SharedPreferences.setMockInitialValues({})`.

- [ ] **Step 2: Expect profile picker image / semantics; tap first Continue hotspot; expect home route (find back control or home image).

- [ ] **Step 3: `flutter test` — all green.

---

### Task 8: Docs

**Files:**
- Modify: `docs/DECISIONS.md`
- Modify: `docs/Architecture.md` (note concrete `lib/` tree briefly)

- [ ] **Step 1: Append decisions** — multi-child local profiles; hybrid mockup entry UI; static shared home shell.

- [ ] **Step 2: Run `flutter analyze` — no issues in `lib/` / `test/`.

---

## Spec coverage check

| Spec requirement | Task |
|------------------|------|
| Profile picker mockup | 5 |
| Create profile Option C | 5 |
| Shared static home mockup | 6 |
| Riverpod + GoRouter shell | 4 |
| Local persistence + seeds | 3 |
| Parent/gear no-op | 5–6 |
| Warm theme | 4 |
| DECISIONS | 8 |
| Tests | 2, 3, 7 |
