import 'package:flutter/material.dart';
import '../theme.dart';

enum AppButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool loading;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = type == AppButtonType.primary
        ? AppColors.accent
        : Colors.transparent;
    final textColor = type == AppButtonType.primary
        ? AppColors.primary
        : AppColors.accent;
    final border = type == AppButtonType.secondary
        ? BorderSide(color: AppColors.accent, width: 2)
        : BorderSide.none;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: border,
          ),
          elevation: 0,
        ),
        onPressed: loading ? null : onPressed,
        child: loading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
