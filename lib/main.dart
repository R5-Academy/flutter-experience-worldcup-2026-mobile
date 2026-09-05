import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/config/application_bindings.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/logging/log_output.dart';
import 'package:wc_2026_mobile/routing/router.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

void main() {
  AppLogger.configure(
    level: kDebugMode ? Level.ALL : Level.INFO,
    outputs: const [ConsoleLogOutput()],
  );
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
