# Initial Profile Picker & Child Home — Design

**Date:** 2026-07-11  
**Status:** Approved for implementation

## Summary

First product surface for Little Logic Lab: a multi-child **profile picker** (visual match to the provided mockup), an **Add Child** setup flow (Option C UI), and a shared **child home** visual shell (second mockup). Every child lands on the same home after selection. Home is static for V1 (no real progress/activities).

## Goals

- Replace the Flutter counter demo with the real app shell.
- Let a household pick who is playing, create a new child profile, and open a calm shared home.
- Look like the provided mockups via a **hybrid** approach (full-screen mockup images + hotspot / light overlays).
- Establish Riverpod + GoRouter + folder layout per `Architecture.md` / `CodingStandards.md`.

## Non-goals (V1)

- Real activity / puzzle play
- Live progress, activity counts, or journey data
- Parent Zone gate or settings functionality
- Pixel-perfect Flutter recreation of 3D avatars/icons
- Gamification (streaks, coins, leaderboards)

## Screen flow

```
App launch → /profiles
  Continue Learning → set active child → /home
  Add Child → /profiles/create → save → /home
  Gear / Parent Zone → no-op (visual only)
/home
  Back → /profiles
  Parents / Continue / tiles / See My Journey → no-op
```

## UI approach (hybrid)

| Screen | Visual | Interaction |
|--------|--------|-------------|
| Profile picker | `assets/mockups/profile_picker.jpg` full-bleed | Transparent hit targets over 2×2 grid + Parent Zone ignored |
| Create profile | Flutter Option C UI (name, age band, avatar placeholder) | Real form; saves profile |
| Child home | `assets/mockups/child_home.jpg` full-bleed | Back hotspot; optional name overlay; other controls no-op |

Known limitation: profile-picker artwork still shows Ava/Arjun/Mia until a later widget rebuild; hit targets map to the real profile list by slot index (first three + Add Child).

## Data model

```dart
class ChildProfile {
  final String id;
  final String name;
  final int ageYears; // recommendation only
  final String accentKey; // e.g. fox, panda, bunny, leaf
}
```

- Seeded demo profiles: Ava (4), Arjun (5), Mia (6).
- Persist list + `activeChildId` with `shared_preferences` (JSON).
- Age is stored for display/recommendation only; does not gate content.

## State & navigation

- **Riverpod:** `childProfilesProvider`, `activeChildProvider`, repository notifier for load/add/select.
- **GoRouter:** `/profiles`, `/profiles/create`, `/home` (redirect to `/profiles` if no active child).
- **Theme:** warm cream / wood / soft green tokens (no deepPurple seed).

## Folder layout

```
lib/
  main.dart
  app/app.dart, router.dart, theme.dart
  core/profile/child_profile.dart, profile_repository.dart, profile_providers.dart
  features/profile_selection/profile_picker_screen.dart, create_profile_screen.dart
  features/child_home/child_home_screen.dart
  shared/widgets/mockup_hotspot_layer.dart (optional helper)
```

## Decisions to record

- Multi-child profiles with local persistence
- Hybrid mockup backgrounds for V1 entry UI
- Shared child home visual shell (static)
- Parent Zone / settings deferred as no-ops

## Success criteria

- App launches to profile picker matching the mockup look.
- Tapping a profile Continue target opens child home mockup.
- Add Child opens Option C form; saving creates a profile and opens home.
- Back from home returns to profiles.
- Counter demo and purple theme are gone.
- Basic widget/unit tests cover profile model/repo and navigation smoke.
