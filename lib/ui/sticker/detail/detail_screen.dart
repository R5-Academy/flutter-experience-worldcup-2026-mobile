import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/album/widgets/hero_card.dart';
import 'package:wc_2026_mobile/ui/core/share/error_messages.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/detail_viewmodel.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/backdrop.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/delete_action.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/delete_dialog.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/quantity_counter.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/status_banner.dart';
import 'package:wc_2026_mobile/ui/sticker/detail/widgets/top_bar.dart';
import 'package:wc_2026_mobile/ui/sticker/widgets/sticker_action_button.dart';

typedef DetailArgs = ({
  String code,
  int number,
  String team,
  String country,
  Color teamColor,
  bool rare,
  int count,
});

class const DetailScreen({
  super.key,
  required final DetailViewModel _viewModel,
  required final DetailArgs sticker,
}) extends StatefulWidget {
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void _leave({bool changed = false}) {
    return context.canPop() ? context.pop(changed) : context.go(Routes.album);
  }

  @override
  void initState() {
    super.initState();
    widget._viewModel.save.addListener(_onSaveResult);
    widget._viewModel.remove.addListener(_onRemoveResult);
  }

  @override
  void dispose() {
    widget._viewModel.save.removeListener(_onSaveResult);
    widget._viewModel.remove.removeListener(_onRemoveResult);
    super.dispose();
  }

  void _onSaveResult() => _onWriteResult(widget._viewModel.save);
  void _onRemoveResult() => _onWriteResult(widget._viewModel.remove);

  void _onWriteResult(Command0<void> command) {
    switch (command.result) {
      case null:
        break;
      case Ok<void>():
        command.clearResult();
        _leave(changed: true);
      case Error<void>(:final error):
        command.clearResult();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(ErrorMessages.of(error))));
    }
  }

  Future<void> _delete() async {
    final sticker = widget.sticker;
    final confirmed = await showDialog(
      context: context,
      builder: (context) => DeleteDialog(
        number: sticker.number,
        country: sticker.country,
        count: widget._viewModel.count,
      ),
    );

    if ((confirmed ?? false) && mounted) {
      widget._viewModel.remove.execute();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget._viewModel;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: .light,
      child: Scaffold(
        backgroundColor: AppColors.ink,
        body: Stack(
          children: [
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, _) {
                return Backdrop(collected: viewModel.collected);
              },
            ),
            SafeArea(
              child: Column(
                children: [
                  TopBar(
                    number: widget.sticker.number,
                    total: 980,
                    onBack: _leave,
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
                            child: ListenableBuilder(
                              listenable: viewModel,
                              builder: (context, _) {
                                return HeroCard(
                                  number: widget.sticker.number,
                                  team: widget.sticker.team,
                                  country: widget.sticker.country,
                                  teamColor: widget.sticker.teamColor,
                                  rare: false,
                                  collected: viewModel.collected,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 12),
                          ListenableBuilder(
                            listenable: viewModel,
                            builder: (context, _) {
                              return StatusBanner(
                                count: viewModel.count,
                                teamColor: widget.sticker.teamColor,
                              );
                            },
                          ),
                          const SizedBox(height: 12),
                          ListenableBuilder(
                            listenable: viewModel,
                            builder: (context, _) {
                              return StickerActionButton(
                                label: viewModel.inAlbum
                                    ? 'SALVAR'
                                    : viewModel.collected
                                    ? 'COLAR NO ALBUM'
                                    : 'TENHO ESTA FIGURINHA',
                                icon: viewModel.collected
                                    ? Icons.check_rounded
                                    : Icons.add_rounded,
                                onPressed: viewModel.busy
                                    ? null
                                    : viewModel.save.execute,
                              );
                            },
                          ),

                          ListenableBuilder(
                            listenable: Listenable.merge([
                              viewModel,
                              viewModel.save,
                              viewModel.remove,
                            ]),
                            builder: (context, _) {
                              if (viewModel.inAlbum) {
                                return Padding(
                                  padding: const .only(top: 8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: DeleteAction(
                                      onPressed: viewModel.busy
                                          ? () {}
                                          : _delete,
                                    ),
                                  ),
                                );
                              }

                              return SizedBox.shrink();
                            },
                          ),
                          const SizedBox(height: 12),
                          ListenableBuilder(
                            listenable: viewModel,
                            builder: (context, _) {
                              return QuantityCounter(
                                count: viewModel.count,
                                onChanged: viewModel.changeCount,
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
          ],
        ),
      ),
    );
  }
}
