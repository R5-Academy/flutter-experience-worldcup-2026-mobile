import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';

class const InitialsAvatar({
  super.key,
  required final String initials,
  required final double size,
  required final TextStyle style,
  final Color? ringColor,
}) extends StatelessWidget {
  final _ringWidth = 2.0;

  @override
  Widget build(BuildContext context) {
    final disc = CircleAvatar(
      radius: ringColor == null ? size / 2 : size / 2 - _ringWidth,
      child: Text(initials, style: style.copyWith(color: AppColors.white)),
    );

    if (ringColor case final ringColor?) {
      return CircleAvatar(
        radius: size / 2,
        backgroundColor: ringColor,
        child: disc,
      );
    }

    return disc;
  }
}
