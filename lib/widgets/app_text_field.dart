import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

/// Reusable text field with consistent styling.
class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.label,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.minLines,
    this.maxLines = 1,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          style: const TextStyle(color: AppTheme.textPrimary),
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          textAlign: textAlign,
          onChanged: onChanged,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppTheme.textMuted),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
