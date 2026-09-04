import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_dimens.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';

class const StatsBar({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.ink,
        borderRadius: AppDimens.borderRadiusMd,
      ),
      child: Row(
        children: [
          Expanded(child: _Stat('48', 'SELEÇÕES')),
          _StatDivider(),
          Expanded(child: _Stat('980', 'FIGURINHAS')),
          _StatDivider(),
          Expanded(child: _Stat('16', 'CIDADES')),
        ],
      ),
    );
  }
}

class const _Stat(final String value, final String label)
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      mainAxisSize: .min,
      spacing: 4,
      children: [
        Text(
          value,
          style: AppTextStyles.heading.copyWith(color: AppColors.gold),
        ),
        Text(
          label,
          style: AppTextStyles.overline.copyWith(color: AppColors.cream),
        ),
      ],
    );
  }
}

class const _StatDivider() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: AppColors.white.withValues(alpha: .15),
      thickness: 1,
      indent: 15,
      endIndent: 15,
    );
  }
}
