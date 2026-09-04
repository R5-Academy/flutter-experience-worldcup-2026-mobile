import 'package:equatable/equatable.dart';

class const AuthSession({
  required final String token,
  required final AuthSessionUser user,
}) extends Equatable {
  @override
  List<Object?> get props => [token, user];

  @override
  bool? get stringify => false;
}

class const AuthSessionUser({
  required final String name,
  required final String email,
}) extends Equatable {
  @override
  List<Object?> get props => [name, email];

  @override
  bool? get stringify => false;
}
