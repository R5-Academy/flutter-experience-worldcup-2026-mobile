import 'package:equatable/equatable.dart';
import 'package:wc_2026_mobile/domain/models/album/sticker_status.dart';

class const AlbumPosition({
  required final String code,
  required final int number,
  required final StickerStatus status,
  required final int repeated,
}) extends Equatable {
  @override
  List<Object?> get props => [code, number, status, repeated];
}
