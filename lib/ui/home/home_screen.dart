import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
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
      appBar: Header(),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          padding: .only(top: 8, bottom: 24),
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Padding(
              padding: .symmetric(horizontal: AppDimens.gridMargin),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  _Progress(),
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
                          onTap: () {},
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
            _Recent(onStickerTap: (value) {}),
            const SizedBox(height: 22),
            Padding(
              padding: const .symmetric(horizontal: AppDimens.gridMargin),
              child: _Repeated(onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}

class const _Recent({
  required final ValueChanged<RecentStickerView> onStickerTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecentStickers(
      stickers: [
        (
          code: 'BRA',
          number: 1,
          flagCode: 'BRA',
          label: 'BRA',
          teamColor: Color(0xFFFFDF00),
          teamName: 'Brazil',
          count: 1,
        ),
      ],
      onStickerTap: onStickerTap,
    );
  }
}

class const _Progress() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlbumHero();
  }
}

class const _Repeated({required final VoidCallback onTap})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepeatedStrip(count: 10, onTap: () {});
  }
}
