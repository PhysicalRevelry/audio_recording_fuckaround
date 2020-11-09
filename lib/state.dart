import 'package:flutter/widgets.dart';

class Counter extends ChangeNotifier {

  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}
