import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID Detector'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Welcome image and logo
            Image(image: null),
            //General Description of what's going on
            Text('Instructions'),
            //This might go above with stack on Image, need Navigation
            GestureDetector(
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}
