import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

class AcceptPermission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Please accept Microphone Permissions'),
      content: GestureDetector(
        child: Text('Go to Settings'),
        onTap: (){
          AppSettings.openAppSettings();
        },
      ),

    );
  }
}
