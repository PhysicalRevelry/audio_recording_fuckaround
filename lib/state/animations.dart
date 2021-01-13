import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Animations extends ChangeNotifier {
  double fontSize = 60;

  void animateLetter() {
    fontSize = 500;
    notifyListeners();
  }
}
