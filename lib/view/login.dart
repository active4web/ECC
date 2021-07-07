import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen_util.dart';

import 'login_widgets/staff_login.dart';
import 'home.dart';

/// Login screen
class Login extends StatelessWidget {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // login screen background
            Container(
              height: _screenUtil.setHeight(700),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/login_background.png',
                width: _screenUtil.setWidth(700),
                height: _screenUtil.setHeight(700),
                fit: BoxFit.cover,
              ),
            ),

            // ECC Staff Login
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              top: _screenUtil.setHeight(500),
              child: StaffLogin(
                onLogin: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
