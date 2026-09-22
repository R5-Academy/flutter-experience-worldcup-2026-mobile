import 'package:equatable/equatable.dart';
import 'package:wc_2026_mobile/domain/models/album/album_position.dart';
import 'package:wc_2026_mobile/domain/models/album/team_album_group.dart';

class const Album({
  required final List<TeamAlbumGroup> teams,
  required final List<AlbumPosition> loose,
}) extends Equatable {
  @override
  List<Object?> get props => [teams, loose];
}
