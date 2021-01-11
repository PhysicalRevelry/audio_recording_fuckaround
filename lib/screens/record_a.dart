import 'package:flutter/material.dart';
import 'package:true_coach_apiplay/widgets/letter_tween.dart';
import 'package:true_coach_apiplay/state/animations.dart';

class RecordA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Recording'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Welcome image and logo
              // Image(image: null),
              //General Description of what's going on
              Text('This is how you record the A sound',
              textAlign: TextAlign.center,),
              Text('A stack of tweens here',
              textAlign: TextAlign.center,),
              //This might go above with stack on Image, need Navigation
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Button to Start Recording',
                    textAlign: TextAlign.center,),
                  ),
                ),
                onTap: (){
                  Navigator.pushNamed(context, '/record_i');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
