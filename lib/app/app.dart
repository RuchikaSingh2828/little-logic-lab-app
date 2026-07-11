import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:little_logic_lab_app/app/router.dart';
import 'package:little_logic_lab_app/app/theme.dart';

class LittleLogicLabApp extends ConsumerWidget {
  const LittleLogicLabApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Little Logic Lab',
      theme: AppTheme.light(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
