import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:true_coach_apiplay/constants/theme.dart';
import 'package:true_coach_apiplay/screens/record_a.dart';
import 'package:true_coach_apiplay/screens/record_i.dart';
import 'package:true_coach_apiplay/screens/record_u.dart';
import 'package:true_coach_apiplay/screens/results.dart';
import 'package:true_coach_apiplay/screens/welcome.dart';
import 'state/recorder_state.dart';
import 'reference_shit/record.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              RecorderState(), //put your change Classes here, as many as you may need,
        ),
      ],
      child: MaterialApp(
        // initialRoute: '/',
        routes: {
          '/welcome': (context) => WelcomePage(),
          '/record_a': (context) => RecordA(),
          '/record_i': (context) => RecordI(),
          '/record_u': (context) => RecordU(),
          '/results': (context) => Results(),
        },
        title: 'Flutter Demo',
        theme: openTheme(),
        home: Initializer(),
      ),
    );
  }
}

