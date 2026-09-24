import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_dimens.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_text_styles.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_theme.dart';

class const DeleteDialog({
  super.key,
  required final int number,
  required final String country,
  required final int count,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final code = '$country - ${number.toString().padLeft(2, '0')}';
    return Dialog(
      backgroundColor: AppColors.ink,
      insetPadding: .symmetric(horizontal: AppDimens.gridMargin),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimens.borderRadiusLg,
        side: BorderSide(color: AppColors.white.withValues(alpha: .15)),
      ),
      child: Padding(
        padding: const .all(24.0),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            Center(
              child: CircleAvatar(
                radius: 56 / 2,
                backgroundColor: AppColors.red,
                child: Icon(
                  Icons.delete_outline_rounded,
                  size: 26,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'EXCLUIR $code?',
              textAlign: .center,
              style: AppTextStyles.heading.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 16),

            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              style: AppTheme.dangerButton,
              child: Text('EXCLUIR'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => Navigator.pop(context, false),
              style: AppTheme.ghostButton,
              child: Text('CANCELAR'),
            ),
          ],
        ),
      ),
    );
  }
}
