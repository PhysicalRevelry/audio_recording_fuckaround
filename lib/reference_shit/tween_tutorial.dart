import 'package:flutter/material.dart';

class TweenTutorial extends StatefulWidget {
  @override
  _TweenTutorialState createState() => _TweenTutorialState();
}

class _TweenTutorialState extends State<TweenTutorial> {
  double customOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                onEnd: (){
                  setState(() {
                    customOpacity = 1;
                  });
                },
                duration: Duration(seconds: 2),
                tween: Tween<double>(begin: 30, end: 100,),
                curve: Curves.bounceOut,
                builder: (BuildContext context, dynamic value, Widget child){
                  return Icon(
                    Icons.flash_on,
                    color: Colors.red,
                    size: value,
                  );
                },
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: customOpacity,
                child: Text(
                  'Energizer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
