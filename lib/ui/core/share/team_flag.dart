import 'package:flutter/widgets.dart';
import 'package:wc_2026_mobile/config/environment.dart';

class const TeamFlag({
  super.key,
  required final double size,
  final String? code,
  final String? path,
  final bool circle = true,
}) extends StatelessWidget {
  const TeamFlag.url(
    String path, {
    required double size,
    bool circle = true,
    Key? key,
  }) : this(path: path, size: size, circle: circle, key: key);

  @override
  Widget build(BuildContext context) {
    final image = Image.network(
      path == null ? Environment.flagUrl(code!) : Environment.url(path!),
      fit: .cover,
      errorBuilder: (_, _, _) => SizedBox.shrink(),
      loadingBuilder: (_, child, progress) =>
          progress == null ? child : SizedBox.shrink(),
    );

    return SizedBox(
      width: circle ? size : size * 3 / 2,
      height: size,
      child: circle
          ? ClipOval(child: image)
          : ClipRRect(borderRadius: .circular(2), child: image),
    );
  }
}
