import 'package:material_ui/material_ui.dart';
import 'package:wc_2026_mobile/core/result.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);

abstract class Command<T> extends ChangeNotifier {
  bool _running = false;
  Result<T>? _result;

  bool get running => _running;
  bool get error => _result is Error;
  bool get complete => _result is Ok;

  Result<T>? get result => _result;

  void clearResult() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute(CommandAction0<T> action) async {
    if (_running) return;

    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class Command0<T>(final CommandAction0<T> _action) extends Command<T> {
  Future<void> execute() => _execute(_action);
}

class Command1<T, A>(final CommandAction1<T, A> action) extends Command<T> {
  Future<void> execute(A argument) => _execute(() => action(argument));
}
