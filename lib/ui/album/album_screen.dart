import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/album/album_viewmodel.dart';
import 'package:wc_2026_mobile/ui/album/widgets/filter_tabs.dart';
import 'package:wc_2026_mobile/ui/album/widgets/header.dart';
import 'package:wc_2026_mobile/ui/album/widgets/team_selection.dart';
import 'package:wc_2026_mobile/ui/album/widgets/team_strip.dart';
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
            _Album(),
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

class const _Album() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        TeamSelection(
          name: 'Brasil',
          flagPath: '/flags/bra.png',
          color: Color(0XFFFFDF00),
          progress: '2/21',
          stickers: [
            (
              code: 'BRA',
              number: 1,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 2,
            ),
            (
              code: 'BRA',
              number: 10,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 1,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
          ],
          onStickerTap: (value) {},
        ),
        TeamSelection(
          name: 'BEL',
          flagPath: '/flags/bel.png',
          color: Color(0XFFED2939),
          progress: '5/21',
          stickers: [
            (
              code: 'BEL',
              number: 1,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 2,
            ),
            (
              code: 'BRA',
              number: 10,
              label: 'Brasil',
              collected: true,
              player: 'JOGADOR',
              count: 1,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
            (
              code: 'BRA',
              number: 20,
              label: 'Brasil',
              collected: false,
              player: 'JOGADOR',
              count: 0,
            ),
          ],
          onStickerTap: (value) {},
        ),
      ],
    );
  }
}
