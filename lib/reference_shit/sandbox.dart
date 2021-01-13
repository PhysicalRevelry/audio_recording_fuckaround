import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          margin: EdgeInsets.all(_margin),
          width: _width,
          color: _color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _margin = 50;
                  });
                },
                child: Text('animate margin'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _color = Colors.purple;
                  });
                },
                child: Text('animate color'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _width = 400;
                  });
                },
                child: Text('animate width'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _margin = 20;
                  });
                },
                child: Text('animate margin'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Text('animate opacity'),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
                child: Text(
                  'Hide Me',
                  style: TextStyle(
                    color: Colors.white,
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
