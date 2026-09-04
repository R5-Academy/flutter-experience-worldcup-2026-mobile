import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_ui/material_ui.dart';

class const AppLoading({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Theme.of(context).colorScheme.primary,
        size: 30,
      ),
    );
  }
}
