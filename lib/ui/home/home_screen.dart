import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:wc_2026_mobile/core/auth/auth_session_notifier.dart';
import 'package:wc_2026_mobile/ui/home/widgets/header.dart';

class const HomeScreen({super.key, required final String name})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final session = context.read<AuthSessionNotifier>();
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: ListenableBuilder(
          listenable: session,
          builder: (context, _) {
            return ElevatedButton(
              onPressed: () {
                session.logout();
              },
              child: Text('Sair'),
            );
          },
        ),
      ),
    );
  }
}
