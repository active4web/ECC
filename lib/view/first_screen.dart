import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screen_util.dart';

import 'login.dart';

/// The First Screen
class FirstScreen extends StatelessWidget {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: Stack(
        children: [
          // the background
          Image.asset(
            'assets/FirstScreen.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),

          // the login button
          Positioned(
            left: _screenUtil.setWidth(150),
            right: _screenUtil.setWidth(150),
            bottom: _screenUtil.setHeight(100),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
              child: Container(
                height: _screenUtil.setHeight(200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_screenUtil.setSp(30)),
                  color: Color(0xffaf2725),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: _screenUtil.setSp(50),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
