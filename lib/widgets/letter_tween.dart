import 'package:flutter/material.dart';

class LetterTween extends StatelessWidget {
  final String letter;
  LetterTween(this.letter);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 30),
      duration: Duration(seconds: 5),
      builder: (BuildContext context, double fontSize, Widget child){
        return Text(letter);
      },

    );
  }
}

