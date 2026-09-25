import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/share/glass_bar.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const Header({
  super.key,
  required final VoidCallback onBack,
  required final Widget child,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Stack(
            fit: .expand,
            children: [
              ColoredBox(color: AppColors.ink),
              SvgPicture.asset(
                AppAssets.patterns.paniniArcHeaderAdicionarSvg,
                fit: .cover,
                alignment: .topCenter,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: .topCenter,
                    end: .bottomCenter,
                    stops: [0, .7, 1],
                    colors: [
                      AppColors.ink.withValues(alpha: .25),
                      AppColors.ink.withValues(alpha: .5),
                      AppColors.cream,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const .fromLTRB(
              AppDimens.gridMargin,
              10,
              AppDimens.gridMargin,
              6,
            ),
            child: Column(
              children: [
                GlassBar(
                  onBack: onBack,
                  titleAlignment: .bottomCenter,
                  title: Column(
                    mainAxisSize: .min,
                    spacing: 5,
                    children: [
                      Text(
                        'ADICIONAR',
                        style: AppTextStyles.overline.copyWith(
                          color: AppColors.yellow,
                        ),
                      ),
                      Text(
                        'FIGURINHA',
                        style: AppTextStyles.title.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
