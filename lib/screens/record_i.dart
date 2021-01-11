import 'package:flutter/material.dart';

class RecordI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Recording'),
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
              Text('This is how you record the I sound',
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
                  Navigator.pushNamed(context, '/record_u');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
