import 'package:flutter/material.dart';
import 'package:true_coach_apiplay/screens/welcome.dart';
import '../state/recorder_state.dart';
import 'package:provider/provider.dart';

///This is a stateful widget ONLY to initialize the recorder state
class Initializer extends StatefulWidget {
  Initializer({Key key}) : super(key: key);

  _InitializerState createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  @override
  void initState() {
    Provider.of<RecorderState>(context, listen: false).init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WelcomePage();
  }

}

///We're using stateless for everything else. OMG. Is there a better way?
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<RecorderState>(builder: (context, record, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your file is saved at:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(//TODO I want this text to show the file name
                    // '${record.current?.path}',
                    record.current?.path != null
                        ? '${record.current.path}'
                        : "(Please record your voice)"),
                GestureDetector(
                  onTap: (){
                    record.delete(context);
                    record.current.path = null;
                  },
                  child: Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.symmetric(vertical: 25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue,
                    ),
                    child: Text('Delete Recording',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //TODO I want this to start and stop recording
          onPressed: () {
            record.pressRecord(context);
          },
          tooltip: 'Recording Control',
          child: record.recordingStatusIcon,
        ),
      );
    });
  }
}
