import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('COVID Detector'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Welcome image and logo
            // Image(image: null),
            //General Description of what's going on
            Text('Instructions',
            textAlign: TextAlign.center,),
            //This might go above with stack on Image, need Navigation
            GestureDetector(
              child: Text('Get Started',
              textAlign: TextAlign.center,),
              onTap: (){
                Navigator.pushNamed(context, '/record_a');
              },
            ),
          ],
        ),
      ),
    );
  }
}
