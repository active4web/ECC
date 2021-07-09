import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen_util.dart';
import '../globals.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: Center(
        child: Text('Attendance Screen'),
      ),
    );
  }
}
