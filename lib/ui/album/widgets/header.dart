import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const Header({super.key, required final VoidCallback onBack})
    extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: .only(left: AppDimens.gridMargin),
        child: _Disc(
          icon: Icons.arrow_back,
          semanticLabel: 'Voltar',
          onPressed: onBack,
        ),
      ),
      title: Column(
        mainAxisSize: .min,
        spacing: 3,
        children: [
          Text(
            'MEU',
            style: AppTextStyles.overline.copyWith(color: AppColors.grayText),
          ),
          Text('ÁLBUM', style: AppTextStyles.heading),
        ],
      ),
      actions: [
        _Disc(icon: Icons.more_horiz),
        SizedBox(width: AppDimens.gridMargin),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);
}

class const _Disc({
  required final IconData icon,
  final String? semanticLabel,
  final VoidCallback? onPressed,
}) extends StatelessWidget {
  final _iconSize = 18.0;
  final _size = 40.0;

  @override
  Widget build(BuildContext context) {
    if (onPressed case final onPressed?) {
      return IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: _iconSize),
        tooltip: semanticLabel,
        style: IconButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.ink,
          shape: CircleBorder(side: BorderSide(color: AppColors.border)),
        ),
      );
    }

    return CircleAvatar(
      radius: _size / 2,
      backgroundColor: AppColors.border,
      child: CircleAvatar(
        radius: _size / 2 - 3,
        backgroundColor: AppColors.white,
        child: Icon(icon, size: _iconSize, color: AppColors.ink),
      ),
    );
  }
}
