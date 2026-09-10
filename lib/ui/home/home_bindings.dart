import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/core/view_model_initializable.dart';
import 'package:wc_2026_mobile/ui/home/home_viewmodel.dart';

class const HomeBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              HomeViewModel(albumRepository: context.read()).initialized(),
        ),
      ],
      builder: (context, child) => screenBuilder(context),
    );
  }
}
