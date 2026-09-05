import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/ui/auth/login/login_viewmodel.dart';
import 'package:wc_2026_mobile/ui/auth/login/widgets/emblem.dart';
import 'package:wc_2026_mobile/ui/auth/login/widgets/header.dart';
import 'package:wc_2026_mobile/ui/auth/login/widgets/login_form.dart';
import 'package:wc_2026_mobile/ui/core/share/app_loading.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const LoginScreen({super.key, required final LoginViewModel viewModel})
    extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onLoginResult);
  }

  void _onLoginResult() {
    final command = widget.viewModel.login;

    if (command.running) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: AppLoading());
        },
      );
      return;
    }

    if (command.result != null) {
      Navigator.pop(context);
    }

    //Falha
    if (command.result case Error(:final error)) {
      command.clearResult();
      debugPrint(error.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao realizar login')));
    }

    debugPrint(command.result.toString());
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    widget.viewModel.login.removeListener(_onLoginResult);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Header(),
          SafeArea(
            child: Column(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    const SizedBox(height: 20),
                    Emblem(),
                    const SizedBox(height: 26),
                    Text(
                      'FIFA WORLD CUP 26™',
                      style: AppTextStyles.overline,
                      textAlign: .center,
                    ),
                    const SizedBox(height: 36),
                    Padding(
                      padding: .symmetric(
                        horizontal: AppDimens.paddingHorizontal,
                      ),
                      child: ListenableBuilder(
                        listenable: Listenable.merge([_email, _password]),
                        builder: (context, _) {
                          final preenchido =
                              _email.text.trim().isNotEmpty &&
                              _password.text.trim().isNotEmpty;

                          return LoginForm(
                            emailController: _email,
                            passwordController: _password,
                            onSubmit: preenchido
                                ? () {
                                    final arguments = (
                                      _email.text.trim(),
                                      _password.text.trim(),
                                    );
                                    widget.viewModel.login.execute(arguments);
                                  }
                                : null,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.ink,
                    textStyle: AppTextStyles.bodyBold,
                  ),
                  onPressed: () {},
                  child: Text('Não tem conta?  Criar conta →'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
