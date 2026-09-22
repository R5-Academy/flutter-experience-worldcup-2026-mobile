import 'package:wc_2026_mobile/data/services/api/mappers/album_position_api_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/mappers/team_api_model_mapper.dart';
import 'package:wc_2026_mobile/data/services/api/model/album/team_album_group_api_model.dart';
import 'package:wc_2026_mobile/domain/models/album/team_album_group.dart';

extension TeamAlbumGroupApiModelMapper on TeamAlbumGroupApiModel {
  TeamAlbumGroup toDomain() => TeamAlbumGroup(
    team: team.toDomain(),
    stickers: stickers.map((s) => s.toDomain()).toList(),
  );
}
