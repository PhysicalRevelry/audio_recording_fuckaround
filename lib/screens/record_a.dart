import 'package:flutter/material.dart';

class RecordA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Recording'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //Welcome image and logo
            Image(image: null),
            //General Description of what's going on
            Text('This is how you record the A sound'),
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
