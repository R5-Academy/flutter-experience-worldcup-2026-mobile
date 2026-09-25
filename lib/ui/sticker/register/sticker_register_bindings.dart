import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/core/view_model_initializable.dart';
import 'package:wc_2026_mobile/ui/sticker/register/sticker_register_viewmodel.dart';

class const StickerRegisterBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StickerRegisterViewModel(
        albumRepository: context.read(),
        teamRepository: context.read(),
      ).initialized(),
      builder: (context, child) => screenBuilder(context),
    );
  }
}
