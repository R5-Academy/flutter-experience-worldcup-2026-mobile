import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const RepeatedStrip({
  super.key,
  required final int count,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: onTap,
        tileColor: AppColors.ink,
        shape: const RoundedRectangleBorder(
          borderRadius: AppDimens.borderRadiusMd,
        ),
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.yellow.withValues(alpha: .18),
          child: Icon(
            Icons.swap_horiz_rounded,
            size: 18,
            color: AppColors.yellow,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_rounded,
          size: 18,
          color: AppColors.yellow,
        ),
        title: Text('$count REPETIDAS'),
        titleTextStyle: AppTextStyles.subhead.copyWith(color: AppColors.white),
        subtitle: Text('toque para trocar com amigos'),
        subtitleTextStyle: AppTextStyles.footnote.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
