import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_viewmodel.dart';

class const LoginBindings({
  super.key,
  required final WidgetBuilder screenBuilder,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(authRepository: context.read()),
        ),
      ],
      builder: (context, child) => screenBuilder(context),
    );
  }
}
