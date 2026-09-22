import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const StickerTile({
  super.key,
  required final int number,
  required final String label,
  required final String player,
  required final Color teamColor,
  required final bool collected,
  final VoidCallback? onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final baseColor = collected ? teamColor : AppColors.gray;

    return Container(
      clipBehavior: .antiAlias,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: AppDimens.borderRadiusSm,
        boxShadow: collected ? AppShadows.glow : null,
      ),
      child: Stack(
        fit: .expand,
        children: [
          Image.asset(
            AppAssets.images.albumPanini2026,
            fit: .cover,
            opacity: AlwaysStoppedAnimation(collected ? .8 : .5),
          ),
          ColoredBox(color: baseColor.withValues(alpha: collected ? .55 : .85)),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: .topCenter,
                end: .bottomCenter,
                colors: [
                  baseColor.withValues(alpha: 0),
                  baseColor.withValues(alpha: .15),
                  AppColors.ink.withValues(alpha: collected ? .85 : .65),
                ],
              ),
            ),
          ),
          Positioned(
            top: 6,
            left: 0,
            right: 0,
            height: 69.5,
            child: Image.asset(
              AppAssets.images.logoFifaWc26,
              fit: .contain,
              opacity: AlwaysStoppedAnimation(collected ? .92 : .35),
            ),
          ),
          Positioned(
            top: 4,
            left: 4,
            child: _Tag(
              text: label,
              backgroundColor: collected
                  ? AppColors.yellow
                  : AppColors.white.withValues(alpha: .6),
              foregroundColor: AppColors.ink,
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: _Tag(
              text: number.toString().padLeft(2, '0'),
              backgroundColor: collected
                  ? AppColors.white
                  : AppColors.white.withValues(alpha: .6),
              foregroundColor: collected ? teamColor : AppColors.ink,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 22,
            child: ColoredBox(
              color: AppColors.ink.withValues(alpha: collected ? .45 : .6),
              child: Center(
                child: Padding(
                  padding: .symmetric(horizontal: 4),
                  child: FittedBox(
                    fit: .scaleDown,
                    child: Text(
                      collected ? player : '— FALTANDO —',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class const _Tag({
  required final String text,
  required final Color backgroundColor,
  required final Color foregroundColor,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 14,
      alignment: .center,
      padding: .symmetric(horizontal: 2),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: .all(.circular(3))),
      ),
      child: FittedBox(
        fit: .scaleDown,
        child: Text(
          text,
          style: AppTextStyles.caption.copyWith(color: foregroundColor),
        ),
      ),
    );
  }
}
