import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/album/widgets/filter_tabs.dart';
import 'package:wc_2026_mobile/ui/album/widgets/header.dart';

class const AlbumScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(onBack: () {}),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilterTabs(
            total: 10,
            missing: 20,
            repeated: 30,
            selected: null,
            onSelected: (value) {
              debugPrint('Alterando a tab $value');
            },
          ),
        ),
      ),
    );
  }
}
