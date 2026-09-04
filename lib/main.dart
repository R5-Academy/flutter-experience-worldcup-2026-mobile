import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class const MainApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: Center(
          child: FilledButton(
            onPressed: () {},
            child: Text(AppAssets.images.envelopePanini2026),
          ),
        ),
      ),
    );
  }
}
