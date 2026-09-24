import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_dimens.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';

class const QuantityCounter({
  super.key,
  required final int count,
  required final ValueChanged<int> onChanged,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: .only(left: 18, right: 9),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: .08),
        borderRadius: AppDimens.borderRadiusMd,
        border: .all(color: AppColors.white.withValues(alpha: .15)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                Text(
                  'QUANTAS FIGURINHAS',
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: AppTextStyles.overline.copyWith(
                    color: AppColors.white,
                  ),
                ),
                Text(
                  'VOCÊ TEM?',
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: AppTextStyles.title.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          _StepButton(
            icon: Icons.remove,
            onPressed: count > 1 ? () => onChanged(count - 1) : () {},
          ),
          SizedBox(
            width: 52,
            child: FittedBox(
              fit: .scaleDown,
              child: Text(
                '$count',
                style: AppTextStyles.heading.copyWith(color: AppColors.white),
              ),
            ),
          ),
          _StepButton(
            icon: Icons.add,
            onPressed: () => onChanged(count + 1),
            primary: true,
          ),
        ],
      ),
    );
  }
}

class const _StepButton({
  required final IconData icon,
  required final VoidCallback onPressed,
  final bool primary = false,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: .zero,
      style: IconButton.styleFrom(
        backgroundColor: primary
            ? AppColors.yellow
            : AppColors.white.withValues(alpha: .12),
        foregroundColor: primary ? AppColors.ink : AppColors.white,
        shape: primary
            ? CircleBorder()
            : CircleBorder(
                side: BorderSide(
                  color: AppColors.white.withValues(alpha: .3),
                  width: 1.5,
                ),
              ),
      ),
      icon: Icon(icon, size: 20),
    );
  }
}
