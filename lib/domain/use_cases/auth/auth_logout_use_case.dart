import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/auth_session/auth_session_repository.dart';

class AuthLogoutUseCase({
  required final AuthSessionRepository _authSessionRepository,
}) {
  Future<Result<void>> logout() => _authSessionRepository.delete();
}
