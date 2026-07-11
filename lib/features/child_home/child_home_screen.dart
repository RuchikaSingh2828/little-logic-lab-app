import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:little_logic_lab_app/app/theme.dart';
import 'package:little_logic_lab_app/core/profile/child_profile.dart';
import 'package:little_logic_lab_app/core/profile/profile_providers.dart';
import 'package:little_logic_lab_app/shared/widgets/soft_ui.dart';

class ChildHomeScreen extends ConsumerWidget {
  const ChildHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeChild = ref.watch(activeChildProvider);

    return Scaffold(
      backgroundColor: AppTheme.cream,
      body: activeChild.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Something went wrong: $error')),
        data: (child) {
          if (child == null) {
            return const SizedBox.shrink();
          }
          return _ChildHomeBody(child: child);
        },
      ),
    );
  }
}

class _ChildHomeBody extends StatelessWidget {
  const _ChildHomeBody({required this.child});

  final ChildProfile child;

  static const _activities = [
    _ActivityItem('Matching', '12 Activities', AppTheme.matching, Icons.search_rounded),
    _ActivityItem('Sorting', '14 Activities', AppTheme.sorting, Icons.train_rounded),
    _ActivityItem('Patterns', '18 Activities', AppTheme.patterns, Icons.auto_awesome_rounded),
    _ActivityItem('Sequencing', '11 Activities', AppTheme.sequencing, Icons.filter_1_rounded),
    _ActivityItem('Spatial Reasoning', '15 Activities', AppTheme.spatial, Icons.extension_rounded),
    _ActivityItem('Detective Puzzles', '10 Activities', AppTheme.detective, Icons.travel_explore_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              children: [
                _HomeHeader(child: child),
                const SizedBox(height: 22),
                _SectionTitle(
                  icon: Icons.eco_rounded,
                  title: 'Continue Learning',
                ),
                const SizedBox(height: 10),
                const _ContinueLearningCard(),
                const SizedBox(height: 22),
                Row(
                  children: [
                    const Expanded(
                      child: _SectionTitle(
                        icon: Icons.explore_rounded,
                        title: 'Explore Activities',
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: AppTheme.leafGreen,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _activities.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 168,
                  ),
                  itemBuilder: (context, index) {
                    return _ActivityCard(item: _activities[index]);
                  },
                ),
                const SizedBox(height: 16),
                const _EncourageBanner(),
              ],
            ),
          ),
          const _HomeBottomNav(),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.child});

  final ChildProfile child;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          button: true,
          label: 'Back to profiles',
          child: GestureDetector(
            onTap: () => context.go('/profiles'),
            child: ProfileAvatar(accentKey: child.accentKey, size: 56),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, ${child.name}!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                'Let’s explore and have fun discovering new things.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SoftCard(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          borderRadius: 18,
          onTap: () {},
          child: const Column(
            children: [
              Icon(Icons.family_restroom_rounded, color: AppTheme.woodBrown, size: 22),
              SizedBox(height: 2),
              Text(
                'Parents',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.woodBrown,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.leafGreen, size: 20),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

class _ContinueLearningCard extends StatelessWidget {
  const _ContinueLearningCard();

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppTheme.matching,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(Icons.category_rounded, color: AppTheme.leafGreen, size: 32),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pattern Explorer',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  'Spot the pattern and complete it!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: const LinearProgressIndicator(
                    value: 0.6,
                    minHeight: 7,
                    backgroundColor: AppTheme.mutedLine,
                    color: AppTheme.leafGreen,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '60%',
                  style: TextStyle(
                    color: AppTheme.leafGreen,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          PillButton(
            label: 'Continue',
            color: AppTheme.leafGreen,
            compact: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ActivityItem {
  const _ActivityItem(this.title, this.subtitle, this.color, this.icon);

  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard({required this.item});

  final _ActivityItem item;

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      padding: EdgeInsets.zero,
      borderRadius: 24,
      onTap: () {},
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: ColoredBox(
                color: item.color,
                child: Center(
                  child: Icon(
                    item.icon,
                    size: 40,
                    color: AppTheme.woodBrown.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppTheme.leafGreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EncourageBanner extends StatelessWidget {
  const _EncourageBanner();

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      color: const Color(0xFFE4F0D8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.7),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.hiking_rounded, color: AppTheme.leafGreen, size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Keep exploring! You’re doing great!',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16),
            ),
          ),
          const Icon(Icons.eco_rounded, color: AppTheme.leafGreen),
        ],
      ),
    );
  }
}

class _HomeBottomNav extends StatelessWidget {
  const _HomeBottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppTheme.woodBrown.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _NavItem(icon: Icons.home_rounded, label: 'Home', selected: true),
          _NavItem(icon: Icons.explore_rounded, label: 'Explore'),
          _NavItem(icon: Icons.map_rounded, label: 'Journey'),
          _NavItem(icon: Icons.menu_book_rounded, label: 'Library'),
          _NavItem(icon: Icons.settings_rounded, label: 'Settings'),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppTheme.leafGreen : AppTheme.softBrown.withValues(alpha: 0.55);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 11,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
