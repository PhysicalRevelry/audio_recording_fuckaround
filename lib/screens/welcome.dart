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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Welcome image and logo
              // Image(image: null),
              //General Description of what's going on
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.yellow,
                    width: 10,
                    style: BorderStyle.solid,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
                  child: Text('Instructions',
                  textAlign: TextAlign.center,),
                ),
              ),
              //This might go above with stack on Image, need Navigation
              GestureDetector(
                child: Text('Get Started',
                textAlign: TextAlign.center,),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/record_a');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
