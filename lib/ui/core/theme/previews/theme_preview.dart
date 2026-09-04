import 'package:flutter/widget_previews.dart';
import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/app_theme.dart';

Widget previewSurface(Widget child) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(body: Center(child: child)),
  );
}

Widget previewFieldSurface(Widget child) {
  return previewSurface(SizedBox(width: 280, child: child));
}

Widget _dsBox(Widget child) => SizedBox(width: 220, height: 52, child: child);

@Preview(
  group: 'Botões',
  name: 'Primary - CTA',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewPrimaryButton() {
  return _dsBox(FilledButton(onPressed: () {}, child: Text('CTA PRINCIPAL')));
}

/// Ação destrutiva com peso de cor — a resposta que a tela espera.
@Preview(
  group: 'Botões',
  name: 'Danger',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewDangerButton() => _dsBox(
  FilledButton(
    style: AppTheme.dangerButton,
    onPressed: () {},
    child: const Text('NÃO TENHO'),
  ),
);

/// Branco com contorno, sem peso de cor.
@Preview(
  group: 'Botões',
  name: 'Secondary',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewSecondaryButton() => _dsBox(
  FilledButton(
    style: AppTheme.secondaryButton,
    onPressed: () {},
    child: const Text('SECUNDÁRIO'),
  ),
);

/// A destrutiva **sem** o peso: vermelho no contorno e no rótulo, corpo
/// branco. É o "SAIR DA CONTA" (`319:47`), ação que a tela oferece e não pede.
@Preview(
  group: 'Botões',
  name: 'Danger outline',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewDangerOutlineButton() => _dsBox(
  FilledButton(
    style: AppTheme.dangerOutlineButton,
    onPressed: () {},
    child: const Text('SAIR DA CONTA'),
  ),
);

/// Desabilitado não é uma variante: é o que qualquer um dos de cima vira com
/// `onPressed: null`. As cores saem do `disabledBackgroundColor` do tema.
@Preview(
  group: 'Botões',
  name: 'Disabled',
  size: Size(280, 120),
  wrapper: previewSurface,
)
Widget previewDisabledButton() =>
    _dsBox(const FilledButton(onPressed: null, child: Text('DESABILITADO')));

@Preview(
  group: 'Campos',
  name: 'Todos os estados',
  size: Size(340, 460),
  wrapper: previewFieldSurface,
)
Widget previewAllFields() => Column(
  mainAxisSize: .min,
  spacing: 16,
  children: [
    TextFormField(initialValue: 'Rodrigo Rahman'),
    TextFormField(
      decoration: const InputDecoration(hintText: 'voce@exemplo.com'),
    ),
    TextFormField(
      initialValue: '',
      autovalidateMode: .always,
      validator: (_) => 'Erro de campo obrigatorio',
    ),
    TextFormField(decoration: AppTheme.searchInput),
  ],
);
