import 'package:flutter/material.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/code_field.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/header.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/keypad.dart';
import 'package:wc_2026_mobile/ui/sticker/register/widgets/preview_card.dart';

class const StickerRegisterScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: .min,
          children: [
            Header(
              onBack: () {},
              child: PreviewCard(
                match: (
                  code: 'BRA-01',
                  color: Colors.yellow,
                  flagPath: '/flags/bra.png',
                  label: 'Brasil',
                  number: '01',
                  team: 'Brasil',
                ),
              ),
            ),
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
      ),
    );
  }
}
