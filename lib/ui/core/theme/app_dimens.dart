import 'package:material_ui/material_ui.dart';

final class AppDimens._() {
  static const designWidth = 390.0;

  static const gridMargin = 20.0;

  static const gridGutter = 8.0;

  static const gridColumns = 4;

  static const paddingHorizontal = gridMargin;
  static const paddingVertical = 16.0;

  static const edgeInsetsScreen = EdgeInsets.symmetric(
    horizontal: paddingHorizontal,
    vertical: paddingVertical,
  );

  static const radiusXs = 8.0;
  static const radiusSm = 14.0;
  static const radiusMd = 18.0;
  static const radiusLg = 22.0;
  static const radiusXl = 28.0;

  static const radiusPill = 26.0;

  static const borderRadiusXs = BorderRadius.all(Radius.circular(radiusXs));
  static const borderRadiusSm = BorderRadius.all(Radius.circular(radiusSm));
  static const borderRadiusMd = BorderRadius.all(Radius.circular(radiusMd));
  static const borderRadiusLg = BorderRadius.all(Radius.circular(radiusLg));
  static const borderRadiusXl = BorderRadius.all(Radius.circular(radiusXl));
  static const borderRadiusPill = BorderRadius.all(Radius.circular(radiusPill));

  static const buttonHeight = 52.0;
  static const inputHeight = 48.0;
  static const fabSize = 56.0;
}
