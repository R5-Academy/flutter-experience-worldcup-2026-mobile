import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/domain/models/album/sticker_status.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const FilterTabs({
  super.key,
  required final int _total,
  required final int _missing,
  required final int _repeated,
  required final StickerStatus? selected,
  required final ValueChanged<StickerStatus?> onSelected,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final segments = <({String label, int count, StickerStatus? status})>[
      (label: 'TODAS', count: _total, status: null),
      (label: 'FALTANDO', count: _missing, status: .missing),
      (label: 'REPETIDAS', count: _repeated, status: .repeated),
    ];

    return Container(
      height: 44,
      padding: .all(3),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimens.borderRadiusLg,
        border: .all(color: AppColors.border),
      ),
      child: Row(
        children: [
          for (final segment in segments)
            Expanded(
              child: _Segment(
                label: segment.label,
                count: segment.count,
                selected: segment.status == selected,
                onTap: () => onSelected(segment.status),
              ),
            ),
        ],
      ),
    );
  }
}

class const _Segment({
  required final String label,
  required final int count,
  required final bool selected,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: AppDimens.borderRadiusMd),
      clipBehavior: .antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          color: selected ? AppColors.ink : null,
          borderRadius: AppDimens.borderRadiusMd,
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: .center,
            spacing: 4,
            children: [
              Text(
                label,
                style: AppTextStyles.overline.copyWith(
                  color: selected ? AppColors.white : AppColors.ink,
                ),
              ),
              Text(
                '$count',
                style: AppTextStyles.caption.copyWith(
                  color: selected ? AppColors.yellow : AppColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
