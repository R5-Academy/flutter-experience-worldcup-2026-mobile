import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wc_2026_mobile/ui/main/widgets/bottom_nav_bar.dart';

class const MainScreen({
  super.key,
  required final StatefulNavigationShell navigationShell,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
