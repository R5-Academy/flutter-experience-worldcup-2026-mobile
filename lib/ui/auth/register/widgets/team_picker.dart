import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';
import 'package:wc_2026_mobile/ui/core/share/app_loading.dart';
import 'package:wc_2026_mobile/ui/core/share/error_indicator.dart';
import 'package:wc_2026_mobile/ui/core/share/required_text.dart';
import 'package:wc_2026_mobile/ui/core/share/team_flag.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const TeamPicker({
  super.key,
  required final List<Team> teams,
  required final int available,
  required final Set<String> selected,
  required final ValueChanged<String> onToggled,
  final TextEditingController? searchController,
  final bool loading = false,
  final String? errorMessage,
  final VoidCallback? onRetry,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            RequiredText(
              text: 'SELEÇÃO FAVORITA',
              style: AppTextStyles.overline,
            ),
            if (available > 0) _AvailableBadge(count: available),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          controller: searchController,
          decoration: AppTheme.searchInput,
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300),
          child: _Grid(
            teams: teams,
            selected: selected,
            onToggled: onToggled,
            loading: loading,
            errorMessage: errorMessage,
            onRetry: onRetry,
          ),
        ),
      ],
    );
  }
}

class const _Grid({
  required final List<Team> teams,
  required final Set<String> selected,
  required final ValueChanged<String> onToggled,
  required final bool loading,
  required final String? errorMessage,
  required final VoidCallback? onRetry,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SizedBox(height: 120, child: AppLoading());
    }

    if (errorMessage case final message?) {
      return ErrorIndicator(
        title: message,
        label: 'Tentar Novamente',
        onPressed: onRetry ?? () {},
      );
    }

    if (teams.isEmpty) {
      return SizedBox(
        height: 120,
        child: Center(
          child: Text(
            'Nenhuma seleção com esse nome',
            style: AppTextStyles.body.copyWith(color: AppColors.grayText),
          ),
        ),
      );
    }

    return GridView.builder(
      padding: .zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        childAspectRatio: 68 / 52,
      ),
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return _TeamTile(
          team: team,
          selected: selected.contains(team.code),
          onTap: () => onToggled(team.code),
        );
      },
    );
  }
}

class const _AvailableBadge({required final int count})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 10, vertical: 5),
      decoration: ShapeDecoration(
        color: AppColors.red.withValues(alpha: .1),
        shape: StadiumBorder(),
      ),
      child: Text(
        '$count DISPONÍVEIS',
        style: AppTextStyles.overline.copyWith(color: AppColors.red),
      ),
    );
  }
}

class const _TeamTile({
  required final Team team,
  required final bool selected,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foreground = selected ? AppColors.white : AppColors.ink;

    return Material(
      color: selected ? AppColors.green : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimens.borderRadiusSm,
        side: BorderSide(color: selected ? AppColors.green : AppColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppDimens.borderRadiusSm,
        child: Center(
          child: Column(
            mainAxisSize: .min,
            spacing: 8,
            children: [
              TeamFlag.url(team.flagUrl, size: 18, circle: false),
              Text(
                team.code,
                style: AppTextStyles.caption.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
