import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/share/team_flag.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/sticker/register/sticker_register_viewmodel.dart';
import 'package:wc_2026_mobile/ui/sticker/widgets/sticker_desaturate.dart';

class const PreviewCard({super.key, required final StickerMatch? _match})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 238,
      child: Container(
        clipBehavior: .antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppDimens.borderRadiusMd,
          boxShadow: AppShadows.lg,
        ),
        child: Column(
          children: [
            SizedBox(height: 46, child: _Header(match: _match)),
            Expanded(child: StickerPreview(match: _match)),
          ],
        ),
      ),
    );
  }
}

class const _Header({required final StickerMatch? _match})
    extends StatelessWidget {
  final _discSize = 30.0;
  final _ringWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    final match = _match;
    final identified = match != null;
    final accent = identified ? AppColors.yellow : AppColors.grayLight;

    return ColoredBox(
      color: identified ? match.color : AppColors.grayDark,
      child: Padding(
        padding: const .only(left: 12, right: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: _discSize / 2,
              backgroundColor: AppColors.white,
              child: CircleAvatar(
                radius: _discSize / 2 - _ringWidth,
                backgroundColor: accent,
                child: identified
                    ? switch (match.flagPath) {
                        final path? => TeamFlag.url(
                          path,
                          size: _discSize - _ringWidth * 2,
                        ),
                        null => Icon(
                          Icons.start_rounded,
                          size: _discSize - _ringWidth * 2,
                          color: AppColors.white,
                        ),
                      }
                    : SizedBox(
                        height: 16,
                        child: FittedBox(
                          child: Text('?', style: AppTextStyles.title),
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  FittedBox(
                    fit: .scaleDown,
                    child: Text(
                      identified ? match.team.toUpperCase() : 'SEM TIME',
                      style: AppTextStyles.subhead.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: .scaleDown,
                    child: Text(
                      identified
                          ? (match.flagPath == null ? 'ESPECIAL' : 'SELEÇÃO')
                          : 'AGUARDANDO',
                      style: AppTextStyles.overline.copyWith(
                        color: identified
                            ? AppColors.white
                            : AppColors.grayLight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 48,
              height: 30,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: AppDimens.borderRadiusXs,
              ),
              child: Column(
                mainAxisAlignment: .center,
                spacing: 2,
                children: [
                  FittedBox(
                    fit: .scaleDown,
                    child: Text('Nº', style: AppTextStyles.overline),
                  ),
                  FittedBox(
                    fit: .scaleDown,
                    child: Text(
                      identified ? match.number : '?',
                      style: AppTextStyles.title,
                    ),
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

class const StickerPreview({super.key, required final StickerMatch? _match})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final match = _match;
    final identified = match != null;
    final base = identified ? match.color : AppColors.gray;

    return StickerDesaturate(
      active: !identified,
      child: Stack(
        fit: .expand,
        children: [
          ColoredBox(color: base),
          Image.asset(
            AppAssets.images.albumPanini2026,
            fit: .fill,
            opacity: AlwaysStoppedAnimation(identified ? .8 : .45),
          ),
          ColoredBox(color: base.withValues(alpha: identified ? .55 : .7)),

          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                stops: const [0, .6, 1],
                colors: [
                  base.withValues(alpha: 0),
                  base.withValues(alpha: .15),
                  AppColors.ink.withValues(alpha: .55),
                ],
              ),
            ),
          ),
          Padding(
            padding: const .fromLTRB(37.5, 8, 37.5, 36.5),
            child: Image.asset(
              AppAssets.images.logoFifaWc26,
              fit: .contain,
              opacity: AlwaysStoppedAnimation(identified ? .92 : .35),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 6,
            height: 24,
            child: _CodePill(match: match),
          ),
        ],
      ),
    );
  }
}

class const _CodePill({required final StickerMatch? _match})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final match = _match;

    return Container(
      alignment: .center,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: AppColors.ink.withValues(alpha: .85),
      ),
      child: FittedBox(
        fit: .scaleDown,
        child: Text(
          match == null ? 'DIGITE O CÓDIGO' : match.label,
          style: AppTextStyles.overline.copyWith(
            color: match == null ? AppColors.grayLight : AppColors.yellow,
          ),
        ),
      ),
    );
  }
}
