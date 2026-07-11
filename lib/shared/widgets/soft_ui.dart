import 'package:flutter/material.dart';

import 'package:little_logic_lab_app/app/theme.dart';

class SoftCard extends StatelessWidget {
  const SoftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.color = AppTheme.cardWhite,
    this.borderRadius = 28,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final content = DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
        boxShadow: AppTheme.softShadow,
      ),
      // Clip children so colored sections can't square off the rounded corners.
      child: ClipRRect(
        borderRadius: radius,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );

    if (onTap == null) {
      return content;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: content,
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.accentKey,
    this.size = 72,
  });

  final String accentKey;
  final double size;

  @override
  Widget build(BuildContext context) {
    final accent = AppTheme.accentFor(accentKey);
    final asset = AppTheme.avatarAssetFor(accentKey);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accent.withValues(alpha: 0.22),
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: asset == null
            ? Icon(Icons.eco_rounded, color: accent, size: size * 0.45)
            : Padding(
                // Portrait stickers sit high in the PNG; pad + contain keeps
                // faces centered without clipping ears or leaving empty space.
                padding: EdgeInsets.all(size * 0.06),
                child: Image.asset(
                  asset,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
      ),
    );
  }
}

class PillButton extends StatelessWidget {
  const PillButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.compact = false,
    this.semanticsLabel,
  });

  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool compact;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: semanticsLabel ?? label,
      child: ExcludeSemantics(
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            minimumSize: Size(compact ? 44 : 48, compact ? 40 : 48),
            padding: EdgeInsets.symmetric(
              horizontal: compact ? 14 : 18,
              vertical: compact ? 8 : 12,
            ),
            shape: const StadiumBorder(),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: compact ? 13 : 14,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right_rounded, size: compact ? 18 : 20),
            ],
          ),
        ),
      ),
    );
  }
}
