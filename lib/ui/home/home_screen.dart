import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/home/widgets/album_hero.dart';
import 'package:wc_2026_mobile/ui/home/widgets/header.dart';

class const HomeScreen({super.key, required final String name})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final session = context.read<AuthSessionNotifier>();
    return Scaffold(
      appBar: Header(),
      body: ListView(
        padding: .only(top: 8, bottom: 24),
        physics: AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: .symmetric(horizontal: AppDimens.gridMargin),
            child: Column(children: [_Progress()]),
          ),
        ],
      ),
    );
  }
}

class const _Progress() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlbumHero();
  }
}
