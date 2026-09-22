import 'package:material_ui/material_ui.dart';

typedef AlbumStickerView = ({
  String code,
  int number,
  String label,
  String player,
  bool collected,
  int count,
});

class AlbumViewModel extends ChangeNotifier {}
