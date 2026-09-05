import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/auth/register/widgets/header.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class RegisterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            Header(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingHorizontal,
              ),
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
