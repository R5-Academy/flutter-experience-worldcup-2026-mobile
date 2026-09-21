import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';
import 'package:wc_2026_mobile/ui/core/share/team_flag.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_dimens.dart';

class const TeamStrip({
  super.key,
  required final List<Team> teams,
  required final String? selected,
  required final ValueChanged<String> onSelected,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: ListView.separated(
        scrollDirection: .horizontal,
        padding: .only(left: AppDimens.gridMargin),
        itemBuilder: (context, index) {
          final Team(:code, flagUrl: flagPath, primaryColor: backgroundColor) =
              teams[index];

          return _TeamDisc(
            flagPath: flagPath,
            color: Color(backgroundColor),
            selected: code == selected,
            onTap: () => onSelected(code),
          );
        },
        separatorBuilder: (_, _) => SizedBox(width: 8),
        itemCount: teams.length,
      ),
    );
  }
}

class const _TeamDisc({
  required final String flagPath,
  required final Color color,
  required final bool selected,
  required final VoidCallback onTap,
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
        onTap: onTap,
        customBorder: CircleBorder(),
        child: SizedBox.square(
          dimension: size,
          child: Center(child: TeamFlag.url(flagPath, size: flagSize)),
        ),
      ),
    );
  }
}
