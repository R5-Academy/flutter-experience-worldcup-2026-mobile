import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/more/widgets/menu_row.dart';

class const MenuSection({
  super.key,
  required final String title,
  required final List<MenuRow> rows,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 10,
      children: [
        Text(
          title,
          style: AppTextStyles.overline.copyWith(color: AppColors.grayText),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppDimens.borderRadiusMd,
            boxShadow: AppShadows.sm,
          ),
          child: Material(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: AppDimens.borderRadiusMd,
              side: BorderSide(color: AppColors.hairline),
            ),
            child: Column(
              children: [
                for (final (index, row) in rows.indexed) ...[
                  if (index > 0)
                    Divider(
                      height: 1,
                      thickness: 1,
                      indent: 62,
                      color: AppColors.border,
                    ),
                  row,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
