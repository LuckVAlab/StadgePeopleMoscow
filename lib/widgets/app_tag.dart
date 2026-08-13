import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

enum TagStyle { normal, urgent, success }

/// Consistent tag / chip widget.
class AppTag extends StatelessWidget {
  final String text;
  final TagStyle style;
  final VoidCallback? onRemove;

  const AppTag({
    super.key,
    required this.text,
    this.style = TagStyle.normal,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor, borderColor) = switch (style) {
      TagStyle.urgent => (
          AppTheme.error.withOpacity(0.15),
          AppTheme.error,
          AppTheme.error.withOpacity(0.3),
        ),
      TagStyle.success => (
          AppTheme.success.withOpacity(0.15),
          AppTheme.success,
          AppTheme.success.withOpacity(0.3),
        ),
      TagStyle.normal => (
          AppTheme.surfaceLight,
          AppTheme.textMuted,
          Colors.transparent,
        ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 13, color: textColor),
          ),
          if (onRemove != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: onRemove,
              child: Icon(Icons.close, size: 16, color: textColor),
            ),
          ],
        ],
      ),
    );
  }
}
