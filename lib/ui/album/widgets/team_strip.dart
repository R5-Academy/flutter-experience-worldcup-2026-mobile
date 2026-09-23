import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';
import 'package:wc_2026_mobile/ui/core/share/team_disc.dart';
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

          return TeamDisc(
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
