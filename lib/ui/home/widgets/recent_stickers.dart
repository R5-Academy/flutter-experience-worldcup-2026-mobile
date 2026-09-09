import 'package:flutter/widgets.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';
import 'package:wc_2026_mobile/ui/home/home_viewmodel.dart';
import 'package:wc_2026_mobile/ui/home/widgets/sticker_card.dart';

class const RecentStickers({
  super.key,
  required final List<RecentStickerView> stickers,
  required final ValueChanged<RecentStickerView> onStickerTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      child: stickers.isEmpty
          ? _Empty()
          : ListView.separated(
              scrollDirection: .horizontal,
              padding: .only(left: AppDimens.gridMargin),
              itemBuilder: (BuildContext context, int index) {
                final sticker = stickers.first;
                return StickerCard(
                  number: sticker.number,
                  label: sticker.label,
                  teamColor: sticker.teamColor,
                  flagCode: sticker.flagCode,
                  rare: false,
                  onTap: () => onStickerTap(sticker),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 12);
              },
              itemCount: 10,
            ),
    );
  }
}

class const _Empty() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: AppDimens.gridMargin),
      child: Align(
        alignment: .centerLeft,
        child: Text(
          'Você ainda não colou nenhum figurinha',
          style: AppTextStyles.footnote.copyWith(color: AppColors.grayText),
        ),
      ),
    );
  }
}
