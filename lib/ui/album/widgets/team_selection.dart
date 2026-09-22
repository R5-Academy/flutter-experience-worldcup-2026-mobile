import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/album/album_viewmodel.dart';
import 'package:wc_2026_mobile/ui/album/widgets/sticker_tile.dart';
import 'package:wc_2026_mobile/ui/core/share/team_flag.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const TeamSelection({
  super.key,
  required final String name,
  required final String? flagPath,
  required final Color color,
  required final String progress,
  required final List<AlbumStickerView> stickers,
  required final ValueChanged<AlbumStickerView> onStickerTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: .fromLTRB(
              AppDimens.gridMargin,
              0,
              AppDimens.gridMargin,
              12,
            ),
            child: _SectionHeader(
              name: name,
              flagPath: flagPath,
              color: color,
              progress: progress,
            ),
          ),
        ),
        SliverPadding(
          padding: .fromLTRB(AppDimens.gridMargin, 0, AppDimens.gridMargin, 12),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 10,
              childAspectRatio: 80 / 104,
            ),
            itemCount: stickers.length,
            itemBuilder: (context, index) {
              final AlbumStickerView(
                :code,
                :label,
                :number,
                :player,
                :collected,
              ) = stickers[index];
              return StickerTile(
                number: number,
                label: code,
                player: player,
                teamColor: color,
                collected: collected,
              );
            },
          ),
        ),
      ],
    );
  }
}

class const _SectionHeader({
  required final String name,
  required final String? flagPath,
  required final Color color,
  required final String progress,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final innerSize = (28.0 - 2.0) * 2.0;
    return Row(
      children: [
        Material(
          color: AppColors.white,
          shape: CircleBorder(side: BorderSide(color: color, width: 2)),
          child: SizedBox.square(
            dimension: 28,
            child: Center(child: TeamFlag.url(flagPath ?? '', size: innerSize)),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            name,
            maxLines: 1,
            overflow: .ellipsis,
            style: AppTextStyles.heading,
          ),
        ),
        SizedBox(width: 12),
        Container(
          padding: .symmetric(horizontal: 12, vertical: 6),
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: color.withValues(alpha: .12),
          ),
          child: Text(
            progress,
            style: AppTextStyles.caption.copyWith(color: color),
          ),
        ),
      ],
    );
  }
}
