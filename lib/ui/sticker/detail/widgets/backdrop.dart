import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';

class const Backdrop({super.key, required final bool collected})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pallete = collected
        ? [
            AppColors.green,
            AppColors.yellow,
            AppColors.blue.withValues(alpha: .9),
          ]
        : [AppColors.gray, AppColors.grayLight, AppColors.grayDark];

    return Stack(
      fit: .expand,
      children: [
        ColoredBox(color: AppColors.ink),

        _Disc(size: 700, left: -150, top: -250, color: pallete[0]),
        _Disc(size: 500, left: 40, top: 400, color: pallete[1]),
        _Disc(size: 300, left: -150, top: 500, color: pallete[2]),

        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: .topCenter,
              end: .bottomCenter,
              colors: [
                AppColors.ink.withValues(alpha: .4),
                AppColors.ink.withValues(alpha: .1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class const _Disc({
  required final double size,
  required final double left,
  required final double top,
  required final Color color,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: CircleAvatar(radius: size / 2, backgroundColor: color),
    );
  }
}
