import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/code_field.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/keypad.dart';

class const StickerRegisterScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CodeField(code: '', length: 6, letters: 3),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Keypad(
              letters: true,
              onKey: (valor) {
                debugPrint(valor);
              },
              onBackspace: () {},
            ),
          ),
          Keypad(
            letters: false,
            onKey: (valor) {
              debugPrint(valor);
            },
            onBackspace: () {},
          ),
        ],
      ),
    );
  }
}
