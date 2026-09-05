import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/share/licensed_badge.dart';
import 'package:wc_2026_mobile/ui/core/share/logo_card.dart';
import 'package:wc_2026_mobile/ui/welcome/widgets/stats_bar.dart';

import '../core/theme/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(AppAssets.patterns.paniniArcSplashSvg, fit: .cover),
          ColoredBox(color: AppColors.cream.withValues(alpha: .35)),
          SafeArea(
            child: Padding(
              padding: const .symmetric(
                horizontal: AppDimens.paddingHorizontal,
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  const LicensedBadge(),
                  const SizedBox(height: 40),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 290, maxHeight: 380),
                    child: LogoCard(),
                  ),
                  const SizedBox(height: 36),
                  Text('SEU ÁLBUM', style: AppTextStyles.display),
                  Text(
                    'OFICIAL',
                    style: AppTextStyles.display.copyWith(color: AppColors.red),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(height: 72, child: StatsBar()),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () => context.go(Routes.login),
                    child: Text('COMEÇAR A COLECIONAR  →'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.ink,
                      textStyle: AppTextStyles.body,
                    ),
                    onPressed: () {},
                    child: Text('Já tenho conta · Entrar'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
