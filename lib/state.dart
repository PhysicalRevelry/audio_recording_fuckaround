import 'dart:async';
import 'dart:io' as io;
import 'package:file/local.dart';
import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

class RecorderState extends ChangeNotifier {
  final LocalFileSystem localFileSystem;

  RecorderState({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }

  FlutterAudioRecorder recorder;
  Recording current;
  RecordingStatus currentStatus = RecordingStatus.Unset;

  void toggleButton(currentStatus){
    switch (currentStatus) {
      case RecordingStatus.Initialized:
        {
          start(); 
          break;
        }
      case RecordingStatus.Recording:
        {
          stop(); //TODO bring in stop()
          break;
        }
      // case RecordingStatus.Paused:
      //   {
      //     resume(); //TODO remove resume as an option
      //     break;
      //   }
      case RecordingStatus.Stopped:
        {
          init(); //TODO show a difference icon/ prompt string for init
          break;
        }
      default:
        break;
    }
  }

  start() async {
    try {
      await recorder.start();
      var recording = await recorder.current(channel: 0);
      current = recording;
      notifyListeners();
      // setState(() { //TODO change to notifyListeners()
      //   current = recording;
      // });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await recorder.current(channel: 0);
        // print(current.status);
        current = current;
        currentStatus = current.status;
        notifyListeners();
        // setState(() { //TODO change to notifyListeners()
        //   // current = current;
        //   // currentStatus = current.status;
        // });
      });
    } catch (e) {
      print(e);
    }
  }

  stop() async {
    var result = await recorder.stop();
    print("Stop recording: ${result.path}");
    // print("Stop recording: ${result.duration}");
    File file = localFileSystem.file(result.path); //TODO gotta figure out why this doesnt work here
    print("File length: ${await file.length()}");
    current = result;
    currentStatus = current.status;
    notifyListeners();
    // setState(() {
    //   current = result;
    //   currentStatus = current.status;
    // });
  }

  init() async {
    try {
      if (await FlutterAudioRecorder.hasPermissions) {
        String customPath = '/flutter_audio_recorder_';
        io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = await getExternalStorageDirectory();
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        // .wav <---> AudioFormat.WAV
        // .mp4 .m4a .aac <---> AudioFormat.AAC
        // AudioFormat is optional, if given value, will overwrite path extension when there is conflicts.
        recorder =
            FlutterAudioRecorder(customPath, audioFormat: AudioFormat.WAV);

        await recorder.initialized;
        // after initialization
        var current = await recorder.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        current = current;
        currentStatus = current.status;
        print(currentStatus);
        notifyListeners();
        // setState(() {
        //   current = current;
        //   currentStatus = current.status; //TODO added a notifyListeners() here
        //   print(currentStatus);
        // });
      } else {
        //TODO change this snackbar to AlertDialog perhaps
        Scaffold.of(context).showSnackBar(
            new SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }


}
