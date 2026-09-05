import 'package:material_ui/material_ui.dart';

class const HomeScreen({super.key, required final String name})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(name)));
  }
}
