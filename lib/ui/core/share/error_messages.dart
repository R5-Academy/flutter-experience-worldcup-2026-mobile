import 'package:wc_2026_mobile/core/exceptions/app_exception.dart';

final class ErrorMessages._() {
  static String of(AppException error) => switch (error) {
    NetworkException() =>
      'Sem conexão. Verifique sua internet e tente novamente.',
    ValidationException(:final message) => message,
    UnauthorizedException() => 'Sua sessão expirou. Entre novamente.',
    InvalidCredentialsException() => 'E-mail ou senha inválidos.',
    ForbiddenException() => 'Você não tem permissão para isso.',
    NotFoundException() => 'Não encontramos o que você procurou.',
    ServerException() =>
      'Estamos com um problema no servidor. Tente mais tarde.',

    EmailAlreadyInUseException() =>
      'Este e-mail já tem conta. Entre com ele ou use outro',
    StorageException() ||
    UnknownException() => 'Algo deu errado. Tente novamente.',
  };
}
