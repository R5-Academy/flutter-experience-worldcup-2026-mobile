import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/core/share/command_builder.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/home/home_viewmodel.dart';
import 'package:wc_2026_mobile/ui/home/widgets/action_card.dart';
import 'package:wc_2026_mobile/ui/home/widgets/album_hero.dart';
import 'package:wc_2026_mobile/ui/home/widgets/header.dart';
import 'package:wc_2026_mobile/ui/home/widgets/recent_stickers.dart';
import 'package:wc_2026_mobile/ui/home/widgets/repeated_strip.dart';

class const HomeScreen({
  super.key,
  required final HomeViewModel _viewModel,
  required final AuthSessionNotifier _session,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        initials: _session.initials,
        name: _session.user?.name ?? '',
      ),
      body: RefreshIndicator(
        onRefresh: _viewModel.refresh,
        child: ListView(
          padding: .only(top: 8, bottom: 24),
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Padding(
              padding: .symmetric(horizontal: AppDimens.gridMargin),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  _Progress(viewModel: _viewModel),
                  const SizedBox(height: 24),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(
                        child: ActionCard(
                          icon: Icons.add_rounded,
                          bubbleColor: AppColors.red,
                          iconColor: AppColors.white,
                          title: 'ADICIONAR',
                          subTitle: 'figurinha',
                          onTap: () {
                            context.push(Routes.stickerRegister);
                          },
                        ),
                      ),
                      Expanded(
                        child: ActionCard(
                          icon: Icons.swap_horiz_rounded,
                          bubbleColor: AppColors.yellow,
                          iconColor: AppColors.ink,
                          title: 'TROCAR',
                          subTitle: 'com amigos',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Text('COLADAS RECENTEMENTE', style: AppTextStyles.overline),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _Recent(viewModel: _viewModel, onStickerTap: (value) {}),
            const SizedBox(height: 22),
            Padding(
              padding: const .symmetric(horizontal: AppDimens.gridMargin),
              child: _Repeated(viewModel: _viewModel, onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

class const _Recent({
  required final HomeViewModel viewModel,
  required final ValueChanged<RecentStickerView> onStickerTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommandBuilder<List<RecentStickerView>>(
      asyncCommand: viewModel.loadRecent,
      data: () => viewModel.recentStickers,
      loading: (context, loaderWidget) =>
          SizedBox(height: 138, child: loaderWidget),
      retry: () => viewModel.loadRecent.execute(),
      builder: (data) {
        return RecentStickers(stickers: data, onStickerTap: onStickerTap);
      },
    );
  }
}

class const _Progress({required final HomeViewModel viewModel})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommandBuilder(
      asyncCommand: viewModel.loadSummary,
      data: () => viewModel.progress,
      retry: () => viewModel.loadSummary.execute(),
      builder: (result) =>
          AlbumHero(collected: result.collected, total: result.total),
    );
  }
}

class const _Repeated({
  required final HomeViewModel _viewModel,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel.loadSummary,
      builder: (context, _) {
        if (_viewModel.progress case final progress?) {
          return RepeatedStrip(count: progress.repeated, onTap: onTap);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
