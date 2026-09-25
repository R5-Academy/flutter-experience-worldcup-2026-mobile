import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/core/share/error_messages.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/sticker/register/sticker_register_viewmodel.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/code_field.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/header.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/hint_banner.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/keypad.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/preview_card.dart';
import 'package:wc_2026_mobile/ui/sticker/widgets/sticker_action_button.dart';

class const StickerRegisterScreen({
  super.key,
  required final StickerRegisterViewModel _viewModel,
}) extends StatefulWidget {
  @override
  State<StickerRegisterScreen> createState() => _StickerRegisterScreenState();
}

class _StickerRegisterScreenState extends State<StickerRegisterScreen> {
  @override
  void initState() {
    super.initState();
    widget._viewModel.register.addListener(_onRegisterResult);
  }

  @override
  void dispose() {
    widget._viewModel.register.removeListener(_onRegisterResult);
    super.dispose();
  }

  void _onRegisterResult() {
    final command = widget._viewModel.register;

    switch (command.result) {
      case null:
        break;
      case Ok<StickerMatch>(:final value):
        command.clearResult();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${value.label} colada no albúm')),
        );
      case Error<StickerMatch>(:final error):
        command.clearResult();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(ErrorMessages.of(error))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget._viewModel;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: .light,
      child: Scaffold(
        body: Column(
          children: [
            Header(
              onBack: () {
                context.canPop()
                    ? context.pop(viewModel.changed)
                    : context.go(Routes.home);
              },
              child: ListenableBuilder(
                listenable: viewModel,
                builder: (context, _) {
                  return PreviewCard(match: viewModel.match);
                },
              ),
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
                    ListenableBuilder(
                      listenable: viewModel,
                      builder: (context, _) {
                        return CodeField(
                          code: viewModel.code,
                          length: viewModel.codeLength,
                          letters: viewModel.codeLetter,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    ListenableBuilder(
                      listenable: viewModel,
                      builder: (context, _) {
                        return _Hint(match: viewModel.match);
                      },
                    ),
                    const SizedBox(height: 12),
                    ListenableBuilder(
                      listenable: viewModel,
                      builder: (context, _) {
                        return Keypad(
                          letters: viewModel.code.length < viewModel.codeLetter,
                          onKey: viewModel.type,
                          onBackspace: viewModel.backspace,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    ListenableBuilder(
                      listenable: Listenable.merge([
                        viewModel,
                        viewModel.register,
                      ]),
                      builder: (context, _) {
                        final match = viewModel.match;

                        return _RegisterAction(
                          onPressed: match == null || viewModel.register.running
                              ? null
                              : () => viewModel.register.execute(match),
                        );
                      },
                    ),
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
