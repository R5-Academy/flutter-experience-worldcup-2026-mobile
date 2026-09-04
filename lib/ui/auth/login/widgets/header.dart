import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wc_2026_mobile/ui/core/share/app_assets.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_colors.dart';

class Header extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320,
      child: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(
            AppAssets.patterns.paniniArcHeaderLoginSvg,
            fit: .cover,
            alignment: .topCenter,
          ),
          Align(
            alignment: .bottomCenter,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    AppColors.cream.withValues(alpha: 0),
                    AppColors.cream,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
