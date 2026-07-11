import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:little_logic_lab_app/app/app.dart';
import 'package:little_logic_lab_app/core/profile/profile_providers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('selecting a profile opens child home', (tester) async {
    final view = tester.view;
    view.physicalSize = const Size(390, 844);
    view.devicePixelRatio = 1.0;
    addTearDown(view.resetPhysicalSize);
    addTearDown(view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const LittleLogicLabApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('ready to explore'), findsOneWidget);
    expect(find.text('Ava'), findsOneWidget);

    await tester.tap(find.text('Continue').first);
    await tester.pumpAndSettle();

    expect(find.text('Hello, Ava!'), findsOneWidget);
    expect(find.bySemanticsLabel('Back to profiles'), findsOneWidget);
  });
}
