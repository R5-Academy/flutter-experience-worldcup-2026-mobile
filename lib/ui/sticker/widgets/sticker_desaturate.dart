import 'package:flutter/widgets.dart';

class const StickerDesaturate({
  super.key,
  required final bool active,
  required final Widget child,
}) extends StatelessWidget {
  final _grayscale = const ColorFilter.matrix([
    // Vermelho
    0.2126, 0.7152, 0.0722, 0, 0,
    // Verde
    0.2126, 0.7152, 0.0722, 0, 0,
    // Azul
    0.2126, 0.7152, 0.0722, 0, 0,
    // Transparencia
    0, 0, 0, 1, 0,
  ]);

  final _identity = const ColorFilter.matrix([
    // Vermelho
    1, 0, 0, 0, 0,
    // Verde
    0, 1, 0, 0, 0,
    // Azul
    0, 0, 1, 0, 0,
    // Transparencia
    0, 0, 0, 1, 0,
  ]);

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: active ? _grayscale : _identity,
      child: child,
    );
  }
}
