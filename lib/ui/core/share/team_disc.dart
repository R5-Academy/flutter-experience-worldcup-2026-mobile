import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/team_flag.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';

class const TeamDisc({
  super.key,
  final String? flagPath,
  final String? flagCode,
  required final Color color,
  final bool selected = false,
  final VoidCallback? onTap,
}) extends StatelessWidget {
  final _discSize = 44.0;
  final _selectedSize = 52.0;

  @override
  Widget build(BuildContext context) {
    final size = selected ? _selectedSize : _discSize;
    final borderWith = selected ? 3.0 : 2.0;
    final flagSize = size - (borderWith + 4) * 2;

    return Material(
      color: AppColors.white,
      shape: CircleBorder(
        side: BorderSide(color: color, width: borderWith),
      ),
      child: InkWell(
        onTap: onTap ?? () {},
        customBorder: CircleBorder(),
        child: SizedBox.square(
          dimension: size,
          child: Center(
            child: flagPath != null
                ? TeamFlag.url(flagPath!, size: flagSize)
                : TeamFlag(code: flagCode, size: flagSize),
          ),
        ),
      ),
    );
  }
}
