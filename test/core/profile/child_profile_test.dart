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
