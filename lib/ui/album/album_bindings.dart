import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/core/view_model_initializable.dart';
import 'package:wc_2026_mobile/ui/album/album_viewmodel.dart';

class const AlbumBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AlbumViewModel(
            albumRepository: context.read(),
            teamRepository: context.read(),
          ).initialized(),
        ),
      ],
      builder: (context, child) => screenBuilder(context),
    );
  }
}
