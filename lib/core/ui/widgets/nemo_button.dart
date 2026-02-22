import 'package:flutter/material.dart';

import '../theme/app_colors.dart';


class NemoButton extends StatelessWidget {
  const NemoButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.variant = NemoButtonVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final NemoButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final isPrimary = variant == NemoButtonVariant.primary;
    final foreground = AppColors.ink;
    final border = Colors.transparent;
    final gradient = isPrimary
        ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.accent],
          )
        : null;

    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isPrimary
              ? const [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isPrimary
                ? Colors.transparent
                : AppColors.surfaceAlt,
            foregroundColor: foreground,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: border),
            ),
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: foreground,
              fontWeight: FontWeight.w700,
            ),
          ),
          child: isLoading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(foreground),
                  ),
                )
              : Text(label),
        ),
      ),
    );
  }
}

enum NemoButtonVariant { primary, ghost }
