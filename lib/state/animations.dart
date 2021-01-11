import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Animations extends ChangeNotifier {
  bool first = true;

  double fontSize = 30;
  Color color = Colors.blue;

  void animateLetter(){
    {
      fontSize = first ? 100 : 30;
    }
    notifyListeners();
  }
}