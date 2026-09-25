import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/share/team_flag.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/sticker/register/sticker_register_viewmodel.dart';

class const HintBanner({super.key, required final StickerMatch? _match})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final match = _match;
    final found = match != null;

    final background = (found ? AppColors.green : AppColors.ink).withValues(
      alpha: found ? .1 : .05,
    );

    final style = AppTextStyles.caption.copyWith(
      color: found ? AppColors.green : AppColors.grayText,
    );

    return Container(
      height: 36,
      padding: .symmetric(horizontal: 16),
      decoration: ShapeDecoration(color: background, shape: StadiumBorder()),
      child: FittedBox(
        fit: .scaleDown,
        child: found
            ? Row(
                children: [
                  Icon(Icons.check_rounded, size: 12, color: AppColors.green),
                  const SizedBox(width: 6),
                  Text('ENCONTRADA:  ${match.label} · ', style: style),
                  switch (match.flagPath) {
                    final path? => TeamFlag.url(path, size: 12, circle: false),
                    null => Icon(
                      Icons.star_rounded,
                      size: 12,
                      color: AppColors.green,
                    ),
                  },
                  Text(' ${match.team.toUpperCase()}', style: style),
                ],
              )
            : Text('DIGITE 3 LETRAS DO TIME + 3 NÚMEROS', style: style),
      ),
    );
  }
}
