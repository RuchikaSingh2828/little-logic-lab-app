import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:little_logic_lab_app/core/profile/child_profile.dart';
import 'package:little_logic_lab_app/core/profile/profile_repository.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('sharedPreferencesProvider must be overridden');
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(sharedPreferencesProvider));
});

final profilesProvider =
    AsyncNotifierProvider<ProfilesNotifier, List<ChildProfile>>(
  ProfilesNotifier.new,
);

final activeChildIdProvider =
    AsyncNotifierProvider<ActiveChildIdNotifier, String?>(
  ActiveChildIdNotifier.new,
);

final activeChildProvider = Provider<AsyncValue<ChildProfile?>>((ref) {
  final profiles = ref.watch(profilesProvider);
  final activeId = ref.watch(activeChildIdProvider);

  return profiles.when(
    data: (list) {
      return activeId.when(
        data: (id) {
          if (id == null) {
            return const AsyncData(null);
          }
          final match = list.where((p) => p.id == id);
          return AsyncData(match.isEmpty ? null : match.first);
        },
        loading: () => const AsyncLoading(),
        error: AsyncError.new,
      );
    },
    loading: () => const AsyncLoading(),
    error: AsyncError.new,
  );
});

class ProfilesNotifier extends AsyncNotifier<List<ChildProfile>> {
  @override
  Future<List<ChildProfile>> build() {
    return ref.read(profileRepositoryProvider).loadProfiles();
  }

  Future<void> addProfile(ChildProfile profile) async {
    final repo = ref.read(profileRepositoryProvider);
    await repo.addProfile(profile);
    state = AsyncData(await repo.loadProfiles());
  }
}

class ActiveChildIdNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() {
    return ref.read(profileRepositoryProvider).activeChildId();
  }

  Future<void> select(String id) async {
    await ref.read(profileRepositoryProvider).setActiveChildId(id);
    state = AsyncData(id);
  }

  Future<void> clear() async {
    await ref.read(profileRepositoryProvider).setActiveChildId(null);
    state = const AsyncData(null);
  }
}
