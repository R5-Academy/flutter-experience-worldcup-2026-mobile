import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 56,
      automaticallyImplyActions: false,
      title: Column(
        children: [
          Text(
            'MINHA CONTA',
            style: AppTextStyles.overline.copyWith(color: AppColors.grayText),
          ),
          Text('MAIS', style: AppTextStyles.heading),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
