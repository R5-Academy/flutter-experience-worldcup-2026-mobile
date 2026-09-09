import 'package:flutter/widgets.dart';
import 'package:wc_2026_mobile/ui/core/share/team_flag.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const StickerCard({
  super.key,
  required final int number,
  required final String label,
  required final Color teamColor,
  required final bool rare,
  final String? flagCode,
  final VoidCallback? onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 138,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppDimens.borderRadiusMd,
          border: rare
              ? .all(color: AppColors.yellow, width: 1.5)
              : .all(color: AppColors.border),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const .all(7.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 86,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: (rare ? AppColors.yellow : teamColor).withValues(
                          alpha: .15,
                        ),
                        borderRadius: AppDimens.borderRadiusSm,
                      ),
                      child: Center(child: _Flag(flagCode)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: label, style: AppTextStyles.caption),
                        TextSpan(
                          text: ' · ',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.grayText,
                          ),
                        ),
                        TextSpan(
                          text: '#${number.toString().padLeft(2, '0')}',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    rare ? 'RARA' : 'COMUM',
                    style: AppTextStyles.caption.copyWith(
                      color: rare ? AppColors.goldText : AppColors.grayText,
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

class const _Flag(final String? code) extends StatelessWidget {
  final _flagSize = 44.0;
  final _ringWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _flagSize,
      height: _flagSize,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(color: AppColors.white, width: _ringWidth),
        ),
        shadows: AppShadows.xs,
      ),
      child: TeamFlag(code: code, size: _flagSize - _ringWidth * 2),
    );
  }
}
