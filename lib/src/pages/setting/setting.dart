import 'package:flutter/material.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101F3D),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 3.0,
            style: BorderStyle.solid,
          ),
        ),
        child: Text('ตัวอย่าง'),
      ),
    );
  }
}
