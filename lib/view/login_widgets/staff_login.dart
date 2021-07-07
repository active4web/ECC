import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen_util.dart';
import '../globals.dart';

/// The widget of the ECC staff login for the login screen.
class StaffLogin extends StatefulWidget {
  /// When the app logs the user in.
  final Function onLogin;

  StaffLogin({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  @override
  _StaffLoginState createState() => _StaffLoginState();
}

class _StaffLoginState extends State<StaffLogin> {
  final ScreenUtil _screenUtil = ScreenUtil();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late InputBorder _inputBorder;

  @override
  void initState() {
    _inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(_screenUtil.setWidth(30)),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Stack(
        children: [
          // the main title (ECC Staff Login)
          Container(
            padding: EdgeInsets.all(_screenUtil.setSp(50)),
            child: Text(
              'ECC Staff Login',
              style: TextStyle(
                fontFamily: Globals.poppins,
                fontSize: _screenUtil.setSp(50),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // The login body
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            top: _screenUtil.setHeight(150),
            child: Container(
              padding: EdgeInsets.all(_screenUtil.setSp(50)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_screenUtil.setSp(70)),
                  topRight: Radius.circular(_screenUtil.setSp(70)),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xff05080a),
                    Color(0xff152028),
                    Color(0xff263a48),
                  ],
                  stops: [0.1, 0.5, 0.9],
                ),
              ),
              child: ListView(
                children: [
                  // username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // username label
                      Text(
                        'Username',
                        style: TextStyle(
                          fontFamily: Globals.poppins,
                          fontSize: _screenUtil.setSp(40),
                          color: Colors.white,
                        ),
                      ),

                      //username field
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                            fontFamily: Globals.poppins,
                            fontSize: _screenUtil.setSp(40),
                          ),
                          hintText: 'Username',
                          border: _inputBorder,
                          enabledBorder: _inputBorder,
                          errorBorder: _inputBorder,
                          disabledBorder: _inputBorder,
                          focusedBorder: _inputBorder,
                          focusedErrorBorder: _inputBorder,
                        ),
                      ),
                    ],
                  ),

                  // Some Spacing
                  SizedBox(
                    height: _screenUtil.setHeight(50),
                  ),

                  // password
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // password label
                      Text(
                        'Password',
                        style: TextStyle(
                          fontFamily: Globals.poppins,
                          fontSize: _screenUtil.setSp(40),
                          color: Colors.white,
                        ),
                      ),

                      //password field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                            fontFamily: Globals.poppins,
                            fontSize: _screenUtil.setSp(40),
                          ),
                          hintText: 'password',
                          border: _inputBorder,
                          enabledBorder: _inputBorder,
                          errorBorder: _inputBorder,
                          disabledBorder: _inputBorder,
                          focusedBorder: _inputBorder,
                          focusedErrorBorder: _inputBorder,
                        ),
                      ),
                    ],
                  ),

                  // Some Spacing
                  SizedBox(
                    height: _screenUtil.setHeight(100),
                  ),

                  // login button
                  GestureDetector(
                    onTap: () {
                      widget.onLogin();
                    },
                    child: Container(
                      height: _screenUtil.setHeight(150),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(_screenUtil.setSp(30)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xffcf3827),
                            Color(0xffdc4130),
                            Color(0xffef4e3c),
                          ],
                          stops: [
                            0.1,
                            0.5,
                            0.8,
                          ],
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: Globals.poppins,
                          fontSize: _screenUtil.setSp(50),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
