import 'dart:async';
import 'dart:io' as io;
import 'package:file/local.dart';
import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';

import 'accept_dialog.dart';

class RecorderState extends ChangeNotifier {
  final LocalFileSystem localFileSystem;

  RecorderState({localFileSystem})
      : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  FlutterAudioRecorder recorder;
  Recording current;
  RecordingStatus currentStatus = RecordingStatus.Unset;
  Icon recordingStatusIcon = Icon(Icons.mic_rounded);

  //TODO toggle icon based on status

  void pressRecord(context) {
    if (currentStatus == RecordingStatus.Unset){
      // init(context);
      start();
    } else {
      toggleButton(context);
    }
  }

  void toggleButton(context){
    switch (currentStatus) {
      case RecordingStatus.Unset:
        init(context);
        recordingStatusIcon = Icon(Icons.play_arrow);
        break;
      case RecordingStatus.Initialized:
        {
          start(); //TODO add a change icon
          recordingStatusIcon = Icon(Icons.stop);
          break;
        }
      case RecordingStatus.Recording:
        {
          stop(); //TODO change icon
          recordingStatusIcon = Icon(Icons.mic_rounded);
          break;
        }
      case RecordingStatus.Stopped:
        {
          start(); //TODO add a change icon
          recordingStatusIcon = Icon(Icons.stop);
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

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await recorder.current(channel: 0);
        // print(current.status);
        current = current;
        currentStatus = current.status;
        print('Current status is $currentStatus'); //TODO remove this later
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }

  stop() async {
    var result = await recorder.stop();
    print("Stop recording: ${result.path}");
    // print("Stop recording: ${result.duration}");
    File file = localFileSystem.file(result.path);
    print("File length: ${await file.length()}");
    current = result;
    currentStatus = current.status;
    print('Current status is $currentStatus'); //TODO remove this later
    notifyListeners();
  }

  init(context) async {
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
      } else {
        acceptPermission(context);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Widget> acceptPermission(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AcceptPermission();
        });
  }

  Future<File> get localFile async {
    return io.File(current.path);
  }

  Future<int> deleteRecording() async {
    try {
      final file = await localFile;
      await file.delete();
    } catch (e) {
      return 0;
    }
  }

}


