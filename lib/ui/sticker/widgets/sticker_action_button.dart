import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const StickerActionButton({
  super.key,
  required final String label,
  required final IconData icon,
  required final VoidCallback? onPressed,
  final ButtonStyle? style,
  final double discSize = 24,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return FilledButton(
      onPressed: onPressed,
      child: Row(
        children: [
          SizedBox(width: discSize),
          Expanded(
            child: Center(child: Text(label, style: AppTextStyles.bodyBold)),
          ),
          CircleAvatar(
            radius: discSize / 2,
            backgroundColor: enabled ? AppColors.ink : AppColors.borderStrong,
            child: Icon(
              icon,
              size: 14,
              color: enabled ? AppColors.yellow : AppColors.grayText,
            ),
          ),
        ],
      ),
    );
  }
}
