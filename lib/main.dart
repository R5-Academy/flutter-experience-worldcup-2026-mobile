import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/config/application_bindings.dart';
import 'package:wc_2026_mobile/routing/router.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

void main() {
  runApp(const ApplicationBindings(child: MainApp()));
}

class const MainApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      builder: (context, child) {
        return MaterialUiCompatibilityBridge(child: child!);
      },
      routerConfig: router(),
    );
  }
}
