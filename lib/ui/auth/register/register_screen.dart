import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/auth/register/widgets/header.dart';
import 'package:wc_2026_mobile/ui/auth/register/widgets/register_form.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class RegisterScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _search = TextEditingController();

  var _acceptedTerms = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _search.dispose();
    super.dispose();
  }

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
              child: Form(
                key: _formKey,
                child: RegisterForm(
                  onSubmit: () {},
                  nameController: _name,
                  emailController: _email,
                  passwordController: _password,
                  teamPicker: Text('Team Picker vai aqui!!!'),
                  acceptedTerms: _acceptedTerms,
                  onAcceptedTermChanged: (value) {
                    setState(() {
                      _acceptedTerms = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
