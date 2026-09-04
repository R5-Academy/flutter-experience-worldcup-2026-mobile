sealed class const AppException({
  final Object? cause,
  final StackTrace? stackTrace,
}) implements Exception {
  @override
  String toString() =>
      cause == null ? '$runtimeType' : '$runtimeType(cause: $cause)';
}

final class const InvalidCredentialsException({super.cause, super.stackTrace})
    extends AppException;

final class const NetworkException({super.cause, super.stackTrace})
    extends AppException;

final class const UnknownException({super.cause, super.stackTrace})
    extends AppException;
