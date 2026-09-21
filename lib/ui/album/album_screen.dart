import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/album/widgets/header.dart';

class const AlbumScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(onBack: () {}),
      body: Center(child: Text('Album')),
    );
  }
}
