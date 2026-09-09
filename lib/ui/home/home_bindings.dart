import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class const HomeBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      builder: (context, child) => screenBuilder(context),
    );
  }
}
