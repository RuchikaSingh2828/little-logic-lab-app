import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:little_logic_lab_app/app/theme.dart';
import 'package:little_logic_lab_app/core/profile/child_profile.dart';
import 'package:little_logic_lab_app/core/profile/profile_providers.dart';
import 'package:little_logic_lab_app/shared/widgets/soft_ui.dart';

class ProfilePickerScreen extends ConsumerWidget {
  const ProfilePickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilesAsync = ref.watch(profilesProvider);

    return Scaffold(
      backgroundColor: AppTheme.cream,
      body: SafeArea(
        child: profilesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Could not load profiles: $error')),
          data: (profiles) => _ProfilePickerBody(profiles: profiles),
        ),
      ),
    );
  }
}

class _ProfilePickerBody extends ConsumerWidget {
  const _ProfilePickerBody({required this.profiles});

  final List<ChildProfile> profiles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              tooltip: 'Settings',
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.woodBrown,
                foregroundColor: Colors.white,
                minimumSize: const Size(48, 48),
              ),
              icon: const Icon(Icons.settings_rounded),
            ),
          ),
          const SizedBox(height: 4),
          Semantics(
            header: true,
            label: 'Little Logic Lab profile picker',
            explicitChildNodes: true,
            child: Column(
              children: [
          Center(
            child: SoftCard(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              borderRadius: 40,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Little ', style: Theme.of(context).textTheme.titleLarge),
                    Text(
                      'L',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.leafGreen,
                          ),
                    ),
                    const Icon(
                      Icons.lightbulb_rounded,
                      color: Color(0xFFE6B84D),
                      size: 22,
                    ),
                    Text(
                      'gic ',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppTheme.leafGreen,
                          ),
                    ),
                    Text(
                      'Lab',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: const Color(0xFFE09F5A),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
                const SizedBox(height: 16),
                Text(
                  'Who’s ready to explore today?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                const Icon(Icons.eco_rounded, color: AppTheme.leafGreen, size: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: profiles.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                mainAxisExtent: 210,
              ),
              itemBuilder: (context, index) {
                if (index == profiles.length) {
                  return const _AddChildCard();
                }
                return _ProfileCard(profile: profiles[index]);
              },
            ),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.lock_rounded, size: 18),
            label: const Text('Parent Zone'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.woodBrown,
              side: const BorderSide(color: AppTheme.woodBrown, width: 1.4),
              minimumSize: const Size(220, 48),
              shape: const StadiumBorder(),
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'For grown-ups',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends ConsumerWidget {
  const _ProfileCard({required this.profile});

  final ChildProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accent = AppTheme.accentFor(profile.accentKey);

    return SoftCard(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ProfileAvatar(accentKey: profile.accentKey, size: 56),
            const SizedBox(height: 8),
            Text(
              profile.name,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              'Age ${profile.ageYears}',
              style: TextStyle(
                color: accent,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: PillButton(
                label: 'Continue',
                semanticsLabel: 'Continue learning as ${profile.name}',
                color: accent,
                compact: true,
                onPressed: () async {
                  await ref
                      .read(activeChildIdProvider.notifier)
                      .select(profile.id);
                  if (context.mounted) {
                    context.go('/home');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddChildCard extends StatelessWidget {
  const _AddChildCard();

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      onTap: () => context.go('/profiles/create'),
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: Semantics(
          button: true,
          label: 'Add Child',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.leafGreen,
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.add_rounded,
                  size: 36,
                  color: AppTheme.leafGreen,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Add Child',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.leafGreen,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
