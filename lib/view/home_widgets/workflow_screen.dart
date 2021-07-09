import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen_util.dart';
import '../globals.dart';

/// Workflow Screen
class WorkflowScreen extends StatefulWidget {
  @override
  _WorkflowScreenState createState() => _WorkflowScreenState();
}

class _WorkflowScreenState extends State<WorkflowScreen> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: Center(
        child: Text('Workflow Screen'),
      ),
    );
  }
}
