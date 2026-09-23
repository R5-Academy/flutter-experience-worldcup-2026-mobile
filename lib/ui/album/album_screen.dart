import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/album/album_viewmodel.dart';
import 'package:wc_2026_mobile/ui/album/widgets/filter_tabs.dart';
import 'package:wc_2026_mobile/ui/album/widgets/header.dart';
import 'package:wc_2026_mobile/ui/album/widgets/team_selection.dart';
import 'package:wc_2026_mobile/ui/album/widgets/team_strip.dart';
import 'package:wc_2026_mobile/ui/core/share/app_loading.dart';
import 'package:wc_2026_mobile/ui/core/share/error_indicator.dart';
import 'package:wc_2026_mobile/ui/core/share/error_messages.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const AlbumScreen({super.key, required final AlbumViewModel _viewModel})
    extends StatefulWidget {
  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        onBack: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(Routes.home);
          }
        },
      ),
      body: RefreshIndicator(
        onRefresh: widget._viewModel.refresh,
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: const .symmetric(horizontal: AppDimens.gridMargin),
                    child: TextField(
                      controller: _search,
                      decoration: AppTheme.searchInput.copyWith(
                        fillColor: AppColors.white,
                        hintText: 'Buscar figurinha, país ou nº…',
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const .symmetric(horizontal: AppDimens.gridMargin),
                    child: _SummaryFilter(viewModel: widget._viewModel),
                  ),
                  SizedBox(height: 16),
                  _TeamsFilter(viewModel: widget._viewModel),
                  SizedBox(height: 20),
                ],
              ),
            ),
            _Album(viewModel: widget._viewModel, search: _search),
          ],
        ),
      ),
    );
  }
}

class const _SummaryFilter({required final AlbumViewModel _viewModel})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([_viewModel, _viewModel.loadSummary]),
      builder: (context, _) {
        if (_viewModel.counts case final counts?) {
          return FilterTabs(
            total: counts.total,
            missing: counts.missing,
            repeated: counts.repeated,
            selected: _viewModel.status,
            onSelected: _viewModel.selectedStatus,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class const _TeamsFilter({required final AlbumViewModel _viewModel})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([_viewModel, _viewModel.loadTeams]),
      builder: (context, _) {
        if (_viewModel.teams.isEmpty) return const SizedBox.shrink();

        return TeamStrip(
          teams: _viewModel.teams,
          selected: _viewModel.teamCode,
          onSelected: _viewModel.toggleTeam,
        );
      },
    );
  }
}

class const _Album({
  required final AlbumViewModel viewModel,
  required final TextEditingController search,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([viewModel, viewModel.loadAlbum, search]),
      builder: (context, _) {
        if (viewModel.loadAlbum.running) {
          return SliverFillRemaining(hasScrollBody: false, child: AppLoading());
        }

        if (viewModel.loadAlbum.result case Error(:final error)) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: ErrorIndicator(
              title: ErrorMessages.of(error),
              label: 'Tentar Novamente',
              onPressed: viewModel.loadAlbum.execute,
            ),
          );
        }

        final sections = viewModel.sectionsMatching(search.text);
        if (sections.isEmpty) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: AppDimens.edgeInsetsScreen,
                child: Text('Nenhuma figurinha neste recorte'),
              ),
            ),
          );
        }

        return SliverMainAxisGroup(
          slivers: [
            for (final section in sections)
              TeamSelection(
                name: section.name,
                flagPath: section.flagPath,
                color: section.color,
                progress: section.progress,
                stickers: section.stickers,
                onStickerTap: (value) {},
              ),
          ],
        );
      },
    );
  }
}
