import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:little_logic_lab_app/app/theme.dart';
import 'package:little_logic_lab_app/core/profile/child_profile.dart';
import 'package:little_logic_lab_app/core/profile/profile_providers.dart';
import 'package:little_logic_lab_app/shared/widgets/soft_ui.dart';

class CreateProfileScreen extends ConsumerStatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  ConsumerState<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends ConsumerState<CreateProfileScreen> {
  final _nameController = TextEditingController();
  int _ageYears = 5;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty || _saving) {
      return;
    }

    setState(() => _saving = true);
    final profile = ChildProfile(
      id: 'child_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      ageYears: _ageYears,
      accentKey: 'leaf',
    );

    try {
      await ref.read(profilesProvider.notifier).addProfile(profile);
      await ref.read(activeChildIdProvider.notifier).select(profile.id);
      if (mounted) {
        context.go('/home');
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final canSubmit = _nameController.text.trim().isNotEmpty && !_saving;

    return Scaffold(
      backgroundColor: AppTheme.cream,
      appBar: AppBar(
        backgroundColor: AppTheme.cream,
        foregroundColor: AppTheme.woodBrown,
        elevation: 0,
        leading: IconButton(
          tooltip: 'Back',
          onPressed: () => context.go('/profiles'),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SoftCard(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Little Logic Lab',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Let’s meet your little thinker',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: ProfileAvatar(accentKey: 'leaf', size: 88),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        hintText: 'Child’s name',
                      ),
                      onChanged: (_) => setState(() {}),
                      onSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Age band (recommendation only)',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      children: [
                        _AgeChip(
                          label: '3–4',
                          selected: _ageYears == 4,
                          onTap: () => setState(() => _ageYears = 4),
                        ),
                        _AgeChip(
                          label: '5–6',
                          selected: _ageYears == 5,
                          onTap: () => setState(() => _ageYears = 5),
                        ),
                        _AgeChip(
                          label: '7',
                          selected: _ageYears == 7,
                          onTap: () => setState(() => _ageYears = 7),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    FilledButton(
                      onPressed: canSubmit ? _submit : null,
                      child: Text(_saving ? 'Saving…' : 'Start exploring'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AgeChip extends StatelessWidget {
  const _AgeChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: 'Age $label',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? AppTheme.leafGreen : Colors.white,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: selected ? AppTheme.leafGreen : AppTheme.mutedLine,
            ),
            boxShadow: selected ? null : AppTheme.softShadow,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : AppTheme.woodBrown,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
