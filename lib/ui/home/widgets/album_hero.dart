import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_dimens.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';

class const AlbumHero({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ClipRRect(
        borderRadius: AppDimens.borderRadiusLg,
        child: ColoredBox(
          color: AppColors.ink,
          child: Stack(
            fit: .expand,
            children: [
              Positioned(
                top: -100,
                right: -80,
                child: CircleAvatar(
                  radius: 130,
                  backgroundColor: AppColors.red.withValues(alpha: .9),
                ),
              ),
              Positioned(
                top: 80,
                left: -60,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: AppColors.gold.withValues(alpha: .9),
                ),
              ),

              Positioned(
                top: 140,
                right: -10,
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: AppColors.purple.withValues(alpha: .85),
                ),
              ),

              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: .centerLeft,
                    end: .centerRight,
                    colors: [
                      AppColors.ink.withValues(alpha: .45),
                      AppColors.ink.withValues(alpha: .85),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 55,
                right: 24,
                width: 115,
                height: 115,
                child: Image.asset(
                  AppAssets.images.albumPanini2026,
                  fit: .contain,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      padding: .symmetric(horizontal: 16, vertical: 7),
                      decoration: ShapeDecoration(
                        color: AppColors.yellow,
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        'MEU ÁLBUM  26',
                        style: AppTextStyles.overline,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'SEU ÁLBUM ESTÁ',
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '68%',
                      style: AppTextStyles.stat.copyWith(
                        color: AppColors.yellow,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'COMPLETO',
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '666 / 980 FIGURINHAS',
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.5,
                      minHeight: 6,
                      borderRadius: .circular(3),
                      backgroundColor: AppColors.white.withValues(alpha: .2),
                      color: AppColors.yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
