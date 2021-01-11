import 'package:flutter/material.dart';
import 'package:true_coach_apiplay/state/animations.dart';
import 'package:provider/provider.dart';

class LetterTween extends StatelessWidget {
  final String letter;
  LetterTween(this.letter);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 120,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 5),
            style: TextStyle(
              fontSize: 30,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            child: Text(letter),
          ),
        ),
        FlatButton(
          onPressed: () {
            Provider.of<Animations>(context, listen: false).animateLetter();
          },
          child: Text(
            "CLICK ME!",
          ),
        )
      ],
    );
  }
}

