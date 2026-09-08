import 'package:flutter/widgets.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
import 'package:wc_2026_mobile/core/command.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/domain/models/auth_session.dart';
import 'package:wc_2026_mobile/domain/use_cases/auth/auth_login_use_case.dart';

class LoginViewModel({
  required final AuthLoginUseCase _loginUseCase,
  required final AuthSessionNotifier _sessionNotifier,
}) extends ChangeNotifier {
  final _log = AppLogger('LoginViewModel');
  late final login = Command1<void, (String, String)>(_login);

  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) = credentials;

    final result = await _loginUseCase.login(email: email, password: password);

    switch (result) {
      case Ok<AuthSessionUser>(:final value):
        _sessionNotifier.signedIn(value);
        return Result.done;
      case Error<AuthSessionUser>(:final error):
        _log.error(
          'Falha ao entrar',
          error: error,
          stackTrace: error.stackTrace,
        );
        return Result.error(error);
    }
  }
}
