import 'package:wc_2026_mobile/core/exceptions/app_exception.dart';

sealed class const Result<T>() {
  const factory Result.ok(T value) = Ok._;
  const factory Result.error(AppException error) = Error._;

  static const Result<void> done = Ok<void>._(null);
}

final class const Ok<T>._(final T value) extends Result<T>;

final class const Error<T>._(final AppException error) extends Result<T>;
