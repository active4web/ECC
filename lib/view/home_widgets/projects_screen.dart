import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen_util.dart';
import '../globals.dart';

/// Projects Screen
class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: Center(
        child: Text('Projects Screen'),
      ),
    );
  }
}
