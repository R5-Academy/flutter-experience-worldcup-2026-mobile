import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/share/licensed_badge.dart';
import 'package:wc_2026_mobile/ui/core/share/logo_card.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';
import 'package:wc_2026_mobile/ui/splash/widgets/boot_bar.dart';

class const SplashScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(AppAssets.patterns.paniniArcSplashSvg, fit: .cover),
          ColoredBox(color: AppColors.cream.withValues(alpha: .35)),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    const LicensedBadge(),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 290,
                        maxHeight: 380,
                      ),
                      child: LogoCard(),
                    ),
                    const SizedBox(height: 36),
                    Text('SEU ÁLBUM', style: AppTextStyles.display),
                    Text(
                      'OFICIAL',
                      style: AppTextStyles.display.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 290),
                      child: SizedBox(
                        height: 72,
                        child: BootBar(progress: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Text('V1.0.0 - Fifa World Cup 26', style: AppTextStyles.overline),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
