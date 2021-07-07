import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen_util.dart';

/// Login screen
class Login extends StatelessWidget {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // login screen background
          Image.asset(
            'assets/login_background.png',
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
