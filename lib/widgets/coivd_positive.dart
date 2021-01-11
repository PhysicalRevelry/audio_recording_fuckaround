import 'package:flutter/material.dart';

class Positive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Positive Design
          Text('Congratulations, you probably have COVID!'),
          //Text explanation
          Text('Words here to tell you what next steps to take.'),
        ],
      ),
    );
  }
}
