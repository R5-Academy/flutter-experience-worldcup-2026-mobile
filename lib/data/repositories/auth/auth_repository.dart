import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/domain/models/auth_session.dart';

abstract interface class AuthRepository {
  Future<Result<AuthSession>> login({
    required String email,
    required String password,
  });

  Future<Result<void>> register({
    required String name,
    required String email,
    required String password,
    required List<String> favoriteTeams,
    required bool acceptedTerms,
  });
}
