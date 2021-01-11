import 'package:flutter/material.dart';

class Negative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Negative Design
          Text('Congratulations, you\'re COVID Negative!'),
          //Text explanation
          Text('Words here that describe just how negative you are!'),
        ],
      ),
    );
  }
}
