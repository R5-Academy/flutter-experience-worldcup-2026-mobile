import 'dart:convert';

import 'package:wc_2026_mobile/core/exceptions/app_exception.dart';
import 'package:wc_2026_mobile/core/result.dart';
import 'package:wc_2026_mobile/data/repositories/auth_session/auth_session_repository.dart';
import 'package:wc_2026_mobile/data/services/local/mappers/auth_session_user_local_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/local/model/auth_session_user_local_model.dart';
import 'package:wc_2026_mobile/data/services/local/secure_storage_service.dart';
import 'package:wc_2026_mobile/data/services/local/storage_keys.dart';
import 'package:wc_2026_mobile/domain/models/auth_session.dart';

class AuthSessionRepositoryLocal({required final SecureStorageService _storage})
    implements AuthSessionRepository {
  @override
  Future<Result<void>> delete() async {
    try {
      await _storage.delete(StorageKeys.authToken);
      await _storage.delete(StorageKeys.authUser);
      return Result.done;
    } on StorageException catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<AuthSession?>> fetch() async {
    try {
      final token = await _storage.fetch(StorageKeys.authToken);
      final user = await _storage.fetch(StorageKeys.authUser);

      if (token == null || user == null) return Result.ok(null);

      return Result.ok(
        AuthSession(
          token: token,
          user: AuthSessionUserLocalModel.fromJson(
            jsonDecode(user) as Map<String, dynamic>,
          ).toDomain(),
        ),
      );
    } on StorageException catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> save(AuthSession session) async {
    try {
      await _storage.save(key: StorageKeys.authToken, value: session.token);

      final user = AuthSessionUserLocalModel(
        name: session.user.name,
        email: session.user.email,
      );
      await _storage.save(
        key: StorageKeys.authUser,
        value: jsonEncode(user.toJson()),
      );

      return Result.done;
    } on StorageException catch (e) {
      await delete();
      return Result.error(e);
    }
  }
}
