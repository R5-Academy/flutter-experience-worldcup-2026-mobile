import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const ActionCard({
  super.key,
  required final IconData icon,
  required final Color bubbleColor,
  required final Color iconColor,
  required final String title,
  required final String subTitle,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppDimens.borderRadiusMd,
          boxShadow: AppShadows.xs,
        ),
        child: Material(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: AppDimens.borderRadiusMd,
            side: BorderSide(color: AppColors.hairline),
          ),
          clipBehavior: .antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: .symmetric(horizontal: 13),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: bubbleColor,
                    child: Icon(icon, size: 22, color: iconColor),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    spacing: 7,
                    children: [
                      FittedBox(
                        fit: .scaleDown,
                        child: Text(title, style: AppTextStyles.subhead),
                      ),
                      FittedBox(
                        fit: .scaleDown,
                        child: Text(
                          subTitle,
                          style: AppTextStyles.footnote.copyWith(
                            color: AppColors.grayText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
