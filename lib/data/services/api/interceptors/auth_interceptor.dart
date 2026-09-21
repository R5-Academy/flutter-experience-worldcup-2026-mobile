import 'dart:async';

import 'package:dio/dio.dart';
import 'package:wc_2026_mobile/core/logging/app_logger.dart';
import 'package:wc_2026_mobile/data/services/local/secure_storage_service.dart';
import 'package:wc_2026_mobile/data/services/local/storage_keys.dart';

class AuthInterceptor({required final SecureStorageService _storage})
    extends Interceptor {
  static const publicRoute = <String, Object>{_publicRouteKey: true};

  static const _publicRouteKey = 'publicRoute';
  static const _sessionEndedStatus = {401, 403};

  final _log = AppLogger('AuthInterceptor');

  final _unauthorized = StreamController.broadcast();

  Stream<void> get onUnauthorized => _unauthorized.stream;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.extra[_publicRouteKey] == true) {
      return handler.next(options);
    }

    final token = await _storage.fetch(StorageKeys.authToken);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_endsSession(err)) {
      _log.info('Backend recursou o token');
      _unauthorized.add(null);
    }
    handler.next(err);
  }

  bool _endsSession(DioException err) =>
      _sessionEndedStatus.contains(err.response?.statusCode) &&
      err.requestOptions.headers.containsKey('Authorization');

  void dispose() {}
}
