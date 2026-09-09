import 'package:equatable/equatable.dart';

class const AlbumSummary({
  required final int total,
  required final int missing,
  required final int repeated,
}) extends Equatable {
  @override
  List<Object?> get props => [total, missing, repeated];
}
