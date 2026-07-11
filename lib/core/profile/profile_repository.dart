import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:little_logic_lab_app/core/profile/child_profile.dart';

class ProfileRepository {
  ProfileRepository(this._prefs);

  static const profilesKey = 'profiles';
  static const activeChildIdKey = 'activeChildId';

  static const demoProfiles = [
    ChildProfile(id: 'ava', name: 'Ava', ageYears: 4, accentKey: 'fox'),
    ChildProfile(id: 'arjun', name: 'Arjun', ageYears: 5, accentKey: 'panda'),
    ChildProfile(id: 'mia', name: 'Mia', ageYears: 6, accentKey: 'bunny'),
  ];

  final SharedPreferences _prefs;

  Future<List<ChildProfile>> loadProfiles() async {
    final raw = _prefs.getString(profilesKey);
    if (raw == null || raw.isEmpty) {
      await _saveProfiles(demoProfiles);
      return List<ChildProfile>.from(demoProfiles);
    }

    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((item) => ChildProfile.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> addProfile(ChildProfile profile) async {
    final profiles = await loadProfiles();
    profiles.add(profile);
    await _saveProfiles(profiles);
  }

  Future<String?> activeChildId() async {
    return _prefs.getString(activeChildIdKey);
  }

  Future<void> setActiveChildId(String? id) async {
    if (id == null) {
      await _prefs.remove(activeChildIdKey);
      return;
    }
    await _prefs.setString(activeChildIdKey, id);
  }

  Future<void> _saveProfiles(List<ChildProfile> profiles) async {
    final encoded = jsonEncode(profiles.map((p) => p.toJson()).toList());
    await _prefs.setString(profilesKey, encoded);
  }
}
