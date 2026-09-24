import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/album/widgets/hero_card.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/backdrop.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/top_bar.dart';

typedef DetailArgs = ({
  String code,
  int number,
  String team,
  String country,
  Color teamColor,
  bool rare,
  int count,
});

class const DetailScreen({super.key, required final DetailArgs sticker})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: .light,
      child: Scaffold(
        backgroundColor: AppColors.ink,
        body: Stack(
          children: [
            Backdrop(collected: true),
            SafeArea(
              child: Column(
                children: [
                  TopBar(
                    number: 003,
                    total: 980,
                    onBack: () {
                      context.canPop()
                          ? context.pop(false)
                          : context.go(Routes.album);
                    },
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: .fromLTRB(
                        AppDimens.gridMargin,
                        26,
                        AppDimens.gridMargin,
                        28,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: HeroCard(
                              number: sticker.number,
                              team: sticker.team,
                              country: sticker.country,
                              teamColor: sticker.teamColor,
                              rare: false,
                              collected: sticker.count > 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
