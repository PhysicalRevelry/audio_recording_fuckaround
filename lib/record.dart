import 'package:flutter/material.dart';
import 'state.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<RecorderState>(
              builder: (context, counter, _) {
                return Text( //TODO I want this text to show the file name
                  '${counter.value}',
                  style: Theme.of(context).textTheme.headline4,
                );
                //TODO After the file name I want a button that sends the file to postbin.
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton( //TODO I want this to start and stop recording
        onPressed: () {
          final counter = Provider.of<RecorderState>(context, listen: false);
          counter.increment();
        },
        tooltip: 'Recording Control',
        child: Provider.of<RecorderState>(context, listen: false).recordingStatusIcon,
      ),
    );
  }
}
