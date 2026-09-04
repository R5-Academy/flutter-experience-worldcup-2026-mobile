import 'package:flutter/widget_previews.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

@Preview(size: Size(390, 280))
Widget logoCardPreview() => MaterialApp(home: Scaffold(body: LogoCard()));

class const LogoCard({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .all(15.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimens.borderRadiusLg,
        boxShadow: AppShadows.lg,
      ),
      child: Stack(
        fit: .expand,
        children: [
          Align(
            alignment: .topLeft,
            child: SizedBox(width: 10, height: 10, child: _CornerMark(0)),
          ),
          Align(
            alignment: .topRight,
            child: SizedBox(width: 10, height: 10, child: _CornerMark(1)),
          ),
          Align(
            alignment: .bottomLeft,
            child: SizedBox(width: 10, height: 10, child: _CornerMark(3)),
          ),
          Align(
            alignment: .bottomRight,
            child: SizedBox(width: 10, height: 10, child: _CornerMark(2)),
          ),

          Column(
            children: [
              const SizedBox(height: 20),
              Text('— FIFA WORLD CUP 26™ —', style: AppTextStyles.overline),
              const SizedBox(height: 3),
              Text(
                'PANINI STICKER ALBUM',
                style: AppTextStyles.overline.copyWith(
                  color: AppColors.grayText,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 140,

                child: Image.asset(AppAssets.images.logoFifaWc26, fit: .cover),
              ),
              const SizedBox(height: 20),
              Text('USA  ·  CANADÁ  ·  MÉXICO', style: AppTextStyles.overline),
              const SizedBox(height: 10),
              Text(
                '11 JUN — 19 JUL 2026',
                style: AppTextStyles.overline.copyWith(
                  color: AppColors.grayText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class const _CornerMark(final int quarterTurns) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.ink, width: 1.5),
            left: BorderSide(color: AppColors.ink, width: 1.5),
          ),
        ),
      ),
    );
  }
}
