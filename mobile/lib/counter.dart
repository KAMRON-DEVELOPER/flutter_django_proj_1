import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int count = 0;

  int get getCount => count;

  decrement() {
    count--;
    notifyListeners();
  }

  increment() {
    count++;
    notifyListeners();
  }
}
