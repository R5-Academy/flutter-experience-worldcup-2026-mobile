import 'package:dio/dio.dart';
import 'package:wc_2026_mobile/core/exceptions/app_exception.dart';

extension DioExceptionMapper on DioException {
  AppException toAppException(StackTrace st) {
    return switch (type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError => NetworkException(
        cause: this,
        stackTrace: st,
      ),
      DioExceptionType.badResponse => _fromStatus(response?.statusCode, st),

      _ => UnknownException(cause: this, stackTrace: st),
    };
  }

  AppException _fromStatus(int? status, StackTrace st) => switch (status) {
    400 || 422 => ValidationException(
      'Dados Inválidos, Revise e tente novamente',
      cause: this,
      stackTrace: st,
    ),
    401 => UnauthorizedException(cause: this, stackTrace: st),
    403 => ForbiddenException(cause: this, stackTrace: st),
    404 => NotFoundException(cause: this, stackTrace: st),
    final code? when code >= 500 => ServerException(
      cause: this,
      stackTrace: st,
    ),
    _ => UnknownException(cause: this, stackTrace: st),
  };
}
