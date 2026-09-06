import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/result.dart';
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
                  teamPicker: ListenableBuilder(
                    listenable: Listenable.merge([
                      widget.viewModel.loadTeams,
                      _search,
                    ]),
                    builder: (context, _) {
                      final teams = widget.viewModel.teams;
                      final loadTeams = widget.viewModel.loadTeams;
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
