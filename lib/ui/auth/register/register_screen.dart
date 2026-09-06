import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/routing/routes.dart';
import 'package:wc_2026_mobile/ui/auth/register/register_viewmodel.dart';
import 'package:wc_2026_mobile/ui/auth/register/widgets/header.dart';
import 'package:wc_2026_mobile/ui/auth/register/widgets/register_form.dart';
import 'package:wc_2026_mobile/ui/auth/register/widgets/team_picker.dart';
import 'package:wc_2026_mobile/ui/core/share/error_messages.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const RegisterScreen({
  super.key,
  required final RegisterViewModel viewModel,
}) extends StatefulWidget {
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
  final _favorites = <String>{};

  @override
  void initState() {
    super.initState();
    widget.viewModel.registerUser.addListener(_onRegisterResult);
  }

  @override
  void dispose() {
    widget.viewModel.registerUser.removeListener(_onRegisterResult);
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _search.dispose();
    super.dispose();
  }

  void _onRegisterResult() {
    final command = widget.viewModel.registerUser;
    final messenger = ScaffoldMessenger.of(context);

    switch (command.result) {
      case Ok<void>():
        command.clearResult();
        messenger.showSnackBar(
          SnackBar(content: Text('Conta criada! agora é só entrar.')),
        );
        context.go(Routes.login);
      case Error<void>(:final error):
        command.clearResult();
        messenger.showSnackBar(
          SnackBar(content: Text(ErrorMessages.of(error))),
        );
      case _:
        break;
    }
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    if (_favorites.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecione pelo menos 1 seleção favorita')),
      );
      return;
    }

    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aceite os termos para continuar')),
      );
      return;
    }

    widget.viewModel.registerUser.execute((
      name: _name.text.trim(),
      email: _email.text.trim(),
      password: _password.text.trim(),
      acceptedTerms: _acceptedTerms,
      favoriteTeams: _favorites.toList(),
    ));
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
                child: ListenableBuilder(
                  listenable: Listenable.merge([
                    _name,
                    _email,
                    _password,
                    widget.viewModel.registerUser,
                  ]),
                  builder: (context, teamPicker) {
                    final preenchido =
                        _name.text.trim().isNotEmpty &&
                        _email.text.trim().isNotEmpty &&
                        _password.text.trim().isNotEmpty &&
                        _favorites.isNotEmpty &&
                        _acceptedTerms;

                    return RegisterForm(
                      onSubmit:
                          preenchido && !widget.viewModel.registerUser.running
                          ? _submit
                          : null,
                      nameController: _name,
                      emailController: _email,
                      passwordController: _password,
                      teamPicker: teamPicker!,
                      acceptedTerms: _acceptedTerms,
                      onAcceptedTermChanged: (value) {
                        setState(() {
                          _acceptedTerms = value;
                        });
                      },
                    );
                  },
                  child: ListenableBuilder(
                    listenable: Listenable.merge([
                      widget.viewModel.loadTeams,
                      _search,
                    ]),
                    builder: (context, _) {
                      final teams = widget.viewModel.teams;
                      final loadTeams = widget.viewModel.loadTeams;
                      debugPrint('Chamou o Team picker');
                      return TeamPicker(
                        teams: widget.viewModel.teamMatching(_search.text),
                        available: teams.length,
                        selected: _favorites,
                        searchController: _search,
                        loading: loadTeams.running,
                        errorMessage: switch (loadTeams.result) {
                          Error(:final error) => ErrorMessages.of(error),
                          _ => null,
                        },
                        onRetry: loadTeams.execute,
                        onToggled: (code) {
                          setState(() {
                            if (!_favorites.remove(code)) {
                              _favorites.add(code);
                            }
                          });
                        },
                        // errorMessage: 'Erro ao buscar times',
                        // loading: true,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
