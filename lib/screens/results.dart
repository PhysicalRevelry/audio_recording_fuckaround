import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Results'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Is this where the wait shit animation happens?
            //Text explanation of the results
            Text('Congratulations, you don\'t have COVID!'),
            //Widget import of positive vs negative
            //QR code here or button to retrieve? 
          ],
        ),
      ),
    );
  }
}
