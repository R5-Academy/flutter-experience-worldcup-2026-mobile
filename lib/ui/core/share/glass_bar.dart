import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';

class const GlassBar({
  super.key,
  final VoidCallback? onBack,
  final Widget? title,
  final AlignmentGeometry titleAlignment = .center,
  final List<Widget> actions = const [],
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          if (onBack case final onBack?)
            Align(
              alignment: .centerLeft,
              child: SizedBox.square(
                dimension: 40,
                child: IconButton(
                  padding: .zero,
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white.withValues(alpha: .2),
                    foregroundColor: AppColors.white,
                    shape: CircleBorder(
                      side: BorderSide(
                        color: AppColors.white.withValues(alpha: .3),
                      ),
                    ),
                  ),
                  onPressed: onBack,
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ),
          if (title case final title?)
            Align(alignment: titleAlignment, child: title),

          if (actions.isNotEmpty)
            Align(
              alignment: .centerRight,
              child: Row(mainAxisSize: .min, spacing: 10, children: actions),
            ),
        ],
      ),
    );
  }
}
