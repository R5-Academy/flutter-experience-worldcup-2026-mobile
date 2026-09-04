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

      _ => UnknownException(cause: this, stackTrace: st),
    };
  }
}
