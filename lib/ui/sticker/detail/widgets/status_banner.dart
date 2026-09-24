import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const StatusBanner({
  super.key,
  required final int count,
  required final Color teamColor,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final collected = count > 0;

    return Container(
      height: 64,
      padding: .only(left: 18, right: 14),
      decoration: BoxDecoration(
        color: collected ? teamColor : AppColors.grayDark,
        borderRadius: AppDimens.borderRadiusMd,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36 / 2,
            backgroundColor: collected ? AppColors.yellow : AppColors.red,
            child: Icon(
              collected ? Icons.check_rounded : Icons.close_rounded,
              size: 20,
              color: collected ? AppColors.ink : AppColors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              spacing: 6,
              children: [
                FittedBox(
                  fit: .scaleDown,
                  child: Text(
                    collected
                        ? 'VOCÊ TEM ESTA FIGURINHA'
                        : 'VOCÊ NÃO TEM ESSA FIGURINHA',
                    style: AppTextStyles.overline.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),

                FittedBox(
                  fit: .scaleDown,
                  child: Text(
                    collected
                        ? '×$count repetidas disponíveis'
                        : 'Ainda falta colar no álbum',
                    style: AppTextStyles.subhead.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 60,
            height: 40,
            alignment: .center,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: .15),
              borderRadius: AppDimens.borderRadiusSm,
              border: .all(color: AppColors.white.withValues(alpha: .25)),
            ),
            child: Text(
              '×$count',
              style: AppTextStyles.heading.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
