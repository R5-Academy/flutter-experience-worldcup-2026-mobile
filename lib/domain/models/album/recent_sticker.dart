import 'package:equatable/equatable.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';

class const RecentSticker({
  required final String code,
  required final int number,
  required final int repeated,
  final Team? team,
}) extends Equatable {
  @override
  List<Object?> get props => [code, number, repeated, team];
}
