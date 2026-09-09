import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const MenuRow({
  super.key,
  required final IconData icon,
  required final Color bubbleColor,
  required final Color iconColor,
  required final String title,
  required final String subTitle,
  final Color? bubbleRing,
  final VoidCallback? onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: _Bubble(
        icon: icon,
        color: bubbleColor,
        iconColor: iconColor,
        ring: bubbleRing,
        size: 36,
      ),
      title: Text(title, style: AppTextStyles.subhead),
      subtitle: Text(
        subTitle,
        style: AppTextStyles.footnote.copyWith(color: AppColors.grayText),
      ),
      trailing: Icon(Icons.arrow_forward_rounded),
    );
  }
}

class const _Bubble({
  required final IconData icon,
  required final Color color,
  required final Color iconColor,
  required final Color? ring,
  required final double size,
}) extends StatelessWidget {
  final double _ringWidth = 1;

  @override
  Widget build(BuildContext context) {
    final disc = CircleAvatar(
      radius: ring == null ? size / 2 : size / 2 - _ringWidth,
      backgroundColor: color,
      child: Icon(icon, size: 18, color: iconColor),
    );

    if (ring case final ring?) {
      return CircleAvatar(radius: size / 2, backgroundColor: ring, child: disc);
    }

    return disc;
  }
}
