import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.background,
                AppColors.surface,
                AppColors.surfaceAlt,
              ],
            ),
          ),
        ),
        Positioned(
          top: -140,
          left: -100,
          child: _GlowBlob(color: AppColors.primary.withAlpha(70), size: 260),
        ),
        Positioned(
          top: 140,
          right: -120,
          child: _GlowBlob(
            color: AppColors.secondary.withAlpha(120),
            size: 280,
          ),
        ),
        Positioned(
          bottom: -160,
          left: 40,
          child: _GlowBlob(
            color: AppColors.accentSoft.withAlpha(120),
            size: 300,
          ),
        ),
        Positioned(
          bottom: 80,
          right: -80,
          child: _GlowBlob(
            color: AppColors.highlight.withAlpha(130),
            size: 200,
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withAlpha(0)]),
      ),
    );
  }
}
