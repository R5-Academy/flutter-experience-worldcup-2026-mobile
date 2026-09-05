import 'package:equatable/equatable.dart';

class const Team({
  required final String code,
  required final String name,
  required final String flagUrl,
  required final int primaryColor,
}) extends Equatable {
  @override
  List<Object?> get props => [code, name, flagUrl, primaryColor];
}
