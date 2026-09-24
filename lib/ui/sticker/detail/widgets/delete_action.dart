import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const DeleteAction({super.key, required final VoidCallback onPressed})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: AppTheme.dangerGhostButton,
      child: Row(
        mainAxisSize: .min,
        spacing: 8,
        children: [
          Text('EXCLUIR FIGURINHA'),
          Icon(Icons.delete_outline_rounded),
        ],
      ),
    );
  }
}
