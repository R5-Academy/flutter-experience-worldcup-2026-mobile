import 'package:equatable/equatable.dart';
import 'package:wc_2026_mobile/domain/models/album/album_position.dart';
import 'package:wc_2026_mobile/domain/models/team/team.dart';

class const TeamAlbumGroup({
  required final Team team,
  required final List<AlbumPosition> stickers,
}) extends Equatable {
  @override
  List<Object?> get props => [team, stickers];
}
