import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:little_logic_lab_app/core/profile/child_profile.dart';
import 'package:little_logic_lab_app/core/profile/profile_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late SharedPreferences prefs;
  late ProfileRepository repository;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    repository = ProfileRepository(prefs);
  });

  test('seeds demo profiles when empty', () async {
    final profiles = await repository.loadProfiles();

    expect(profiles, ProfileRepository.demoProfiles);
    expect(prefs.getString(ProfileRepository.profilesKey), isNotNull);
  });

  test('addProfile persists a new child', () async {
    await repository.loadProfiles();
    const extra = ChildProfile(
      id: 'sam',
      name: 'Sam',
      ageYears: 6,
      accentKey: 'leaf',
    );

    await repository.addProfile(extra);
    final profiles = await repository.loadProfiles();

    expect(profiles, contains(extra));
    expect(profiles.length, ProfileRepository.demoProfiles.length + 1);
  });

  test('active child id round-trips', () async {
    expect(await repository.activeChildId(), isNull);

    await repository.setActiveChildId('ava');
    expect(await repository.activeChildId(), 'ava');

    await repository.setActiveChildId(null);
    expect(await repository.activeChildId(), isNull);
  });
}
