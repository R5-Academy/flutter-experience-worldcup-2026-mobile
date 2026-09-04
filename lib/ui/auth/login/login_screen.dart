import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/labeled_field.dart';

class const LoginScreen({super.key}) extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            spacing: 10,
            children: [
              LabeledField(
                label: 'E-mail',
                hint: 'voce@exemplo.com',
                required: true,
              ),

              LabeledField.password(
                label: 'Senha',
                hint: 'voce@exemplo.com',
                required: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
