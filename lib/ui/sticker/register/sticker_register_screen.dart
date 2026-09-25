import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/sticker/register/sticker_register_viewmodel.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/code_field.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/header.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/hint_banner.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/keypad.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/preview_card.dart';
import 'package:wc_2026_mobile/ui/sticker/widgets/sticker_action_button.dart';

class const StickerRegisterScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: .light,
      child: Scaffold(
        body: Column(
          children: [
            Header(
              onBack: () {
                context.canPop() ? context.pop(false) : context.go(Routes.home);
              },
              child: PreviewCard(match: null),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: .fromLTRB(
                  AppDimens.gridMargin,
                  25.5,
                  AppDimens.gridMargin,
                  24,
                ),
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      'CÓDIGO DA FIGURINHA',
                      textAlign: .center,
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.grayText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CodeField(code: '', length: 6, letters: 3),
                    const SizedBox(height: 20),
                    _Hint(match: null),
                    const SizedBox(height: 12),
                    Keypad(letters: true, onKey: (_) {}, onBackspace: () {}),
                    const SizedBox(height: 16),
                    _RegisterAction(onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class const _Hint({required final StickerMatch? _match})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HintBanner(match: _match);
  }
}

class const _RegisterAction({required final VoidCallback? onPressed})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        shadows: onPressed != null ? AppShadows.fabGlow : null,
      ),
      child: StickerActionButton(
        label: 'CADASTRAR FIGURINHA',
        icon: Icons.arrow_forward_rounded,
        discSize: 28,
        onPressed: onPressed,
      ),
    );
  }
}
