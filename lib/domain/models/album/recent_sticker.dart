import 'package:equatable/equatable.dart';

class const RecentSticker({
  required final String code,
  required final int number,
  required final int repeated,
}) extends Equatable {
  @override
  List<Object?> get props => [code, number, repeated];
}
