import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MainApp());
}

class const MainApp({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello, World!'))),
    );
  }
}
