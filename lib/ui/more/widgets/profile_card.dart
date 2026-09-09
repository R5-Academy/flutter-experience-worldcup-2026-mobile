import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/initials_avatar.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const ProfileCard({
  super.key,
  required final String initials,
  required final String name,
  required final String email,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.ink,
          borderRadius: AppDimens.borderRadiusMd,
        ),
        child: Padding(
          padding: .symmetric(horizontal: 16),
          child: Row(
            children: [
              InitialsAvatar(
                initials: initials,
                size: 58,
                style: AppTextStyles.title,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                spacing: 8,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.title.copyWith(color: AppColors.white),
                  ),
                  Text(
                    email,
                    style: AppTextStyles.footnote.copyWith(
                      color: AppColors.white.withValues(alpha: .62),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.yellow,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
