import 'package:material_ui/material_ui.dart';

abstract interface class ViewModelInitializable {
  void init();
}

extension ViewModelInitializableExtension<T extends ChangeNotifier> on T {
  T initialized() {
    if (this is ViewModelInitializable) {
      (this as ViewModelInitializable).init();
    }
    return this;
  }
}
