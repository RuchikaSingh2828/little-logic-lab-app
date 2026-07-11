import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:little_logic_lab_app/core/profile/profile_providers.dart';
import 'package:little_logic_lab_app/features/child_home/child_home_screen.dart';
import 'package:little_logic_lab_app/features/profile_selection/create_profile_screen.dart';
import 'package:little_logic_lab_app/features/profile_selection/profile_picker_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/profiles',
    routes: [
      GoRoute(
        path: '/profiles',
        builder: (context, state) => const ProfilePickerScreen(),
        routes: [
          GoRoute(
            path: 'create',
            builder: (context, state) => const CreateProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const ChildHomeScreen(),
        redirect: (context, state) {
          final activeId = ref.read(activeChildIdProvider);
          return activeId.maybeWhen(
            data: (id) => id == null ? '/profiles' : null,
            orElse: () => null,
          );
        },
      ),
    ],
  );
});
