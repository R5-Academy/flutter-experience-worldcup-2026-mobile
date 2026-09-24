import 'package:flutter/widgets.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/share/team_disc.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/sticker/widgets/sticker_desaturate.dart';

class const HeroCard({
  super.key,
  required final int number,
  required final String team,
  required final String country,
  required final Color teamColor,
  required final bool rare,
  required final bool collected,
}) extends StatelessWidget {
  final _cardWidth = 280.0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: _cardWidth),
      child: AspectRatio(
        aspectRatio: _cardWidth / 400,
        child: Container(
          clipBehavior: .antiAlias,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppDimens.borderRadiusLg,
            boxShadow: AppShadows.lg,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70,
                child: _Header(
                  number: number,
                  team: team,
                  country: country,
                  teamColor: teamColor,
                  collected: collected,
                ),
              ),
              Expanded(
                child: _StickerView(teamColor: teamColor, collected: collected),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _StickerView({
  required final Color teamColor,
  required final bool collected,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final base = collected ? teamColor : AppColors.gray;

    return Stack(
      fit: .expand,
      children: [
        ColoredBox(color: base),
        Image.asset(
          AppAssets.images.albumPanini2026,
          fit: .fill,
          opacity: AlwaysStoppedAnimation(collected ? .8 : .55),
        ),
        ColoredBox(color: base.withValues(alpha: collected ? .5 : .7)),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: .topCenter,
              end: .bottomCenter,
              colors: [
                base.withValues(alpha: 0),
                base.withValues(alpha: .15),
                AppColors.ink.withValues(alpha: .6),
              ],
            ),
          ),
        ),
        Padding(
          padding: const .fromLTRB(60, 10, 60, 80),
          child: Image.asset(
            AppAssets.images.logoFifaWc26,
            fit: .contain,
            opacity: AlwaysStoppedAnimation(collected ? .95 : .35),
          ),
        ),
      ],
    );
  }
}

class const _Header({
  required final int number,
  required final String team,
  required final String country,
  required final Color teamColor,
  required final bool collected,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final background = collected ? AppColors.yellow : AppColors.grayLight;

    return ColoredBox(
      color: collected ? teamColor : AppColors.grayDark,
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 14),
        child: Row(
          children: [
            StickerDesaturate(
              active: !collected,
              child: TeamDisc(color: teamColor, flagCode: country),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                spacing: 5,
                children: [
                  Text(
                    team.toUpperCase(),
                    style: AppTextStyles.title.copyWith(color: AppColors.white),
                  ),
                  Text(
                    'SELEÇÃO OFICIAL',
                    style: AppTextStyles.overline.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 50,
              height: 46,
              decoration: BoxDecoration(
                color: background,
                borderRadius: AppDimens.borderRadiusXs,
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text('Nº', style: AppTextStyles.overline),
                  Text(
                    number.toString().padLeft(2, '0'),
                    style: AppTextStyles.heading,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
