import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const BottomNavBar({
  super.key,
  required final int currentIndex,
  required final ValueChanged<int> onDestinationSelected,
}) extends StatelessWidget {
  final _destinations = const <({IconData icon, String label})>[
    (icon: Icons.diamond_outlined, label: 'HOME'),
    (icon: Icons.grid_view_rounded, label: 'ÁLBUM'),
    (icon: Icons.swap_horiz_rounded, label: 'TROCAS'),
    (icon: Icons.menu_rounded, label: 'MAIS'),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.hairline)),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: [
          for (final (:icon, :label) in _destinations)
            NavigationDestination(icon: Icon(icon), label: label),
        ],
      ),
    );
  }
}
