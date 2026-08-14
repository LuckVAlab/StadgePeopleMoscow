import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

/// Styled dropdown button for consistent look.
class AppDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final void Function(T?) onChanged;
  final String? label;

  const AppDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.label,
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.textMuted),
          ),
          child: items.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Нет доступных вариантов',
                    style: TextStyle(
                      color: AppTheme.textDisabled,
                      fontSize: 14,
                    ),
                  ),
                )
              : DropdownButton<T>(
                  value: value,
                  isExpanded: true,
                  underline: const SizedBox(),
                  dropdownColor: AppTheme.surfaceLight,
                  icon: const Icon(Icons.arrow_drop_down,
                      color: AppTheme.textMuted),
                  items: items.map((item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        item.toString(),
                        style: const TextStyle(color: AppTheme.textSecondary),
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                  style: const TextStyle(color: AppTheme.textPrimary),
                ),
        ),
      ],
    );
  }
}
