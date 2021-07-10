import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screen_util.dart';
import '../globals.dart';

import 'main_screen_widgets/tasks_pie_chart.dart';

/// The main screen.
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Scaffold(
      body: ListView(
        children: [
          // The header
          Stack(
            children: [
              // The part with employee info, image, and welcome
              Column(
                children: [
                  // The header
                  Container(
                    padding: EdgeInsets.all(_screenUtil.setSp(50)),
                    height: _screenUtil.setHeight(900),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(_screenUtil.setSp(50)),
                        bottomRight: Radius.circular(_screenUtil.setSp(50)),
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
                    child: Column(
                      children: [
                        // The notification part
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                // the notification icon
                                Image.asset(
                                  'assets/notification_icon.png',
                                  height: _screenUtil.setHeight(100),
                                  width: _screenUtil.setWidth(100),
                                ),

                                // the notification indication circle
                                Positioned(
                                  right: _screenUtil.setWidth(10),
                                  top: 0.0,
                                  child: Container(
                                    height: _screenUtil.setWidth(30),
                                    width: _screenUtil.setHeight(30),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffe6b600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Some Space
                        SizedBox(
                          height: _screenUtil.setHeight(50),
                        ),

                        // Employee image and info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Employee name and position
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Welcome
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                    fontFamily: Globals.poppins,
                                    fontSize: _screenUtil.setSp(50),
                                    color: Color(0xff8a959e),
                                  ),
                                ),

                                // Employee name
                                Text(
                                  'Sameh Ali',
                                  style: TextStyle(
                                    fontFamily: Globals.poppins,
                                    fontSize: _screenUtil.setSp(70),
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // Employee position
                                Text(
                                  'General Manager',
                                  style: TextStyle(
                                    fontFamily: Globals.poppins,
                                    fontSize: _screenUtil.setSp(50),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            // Employee Image
                            Container(
                              height: _screenUtil.setHeight(200),
                              width: _screenUtil.setWidth(200),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/user.png',
                                height: _screenUtil.setHeight(200),
                                width: _screenUtil.setWidth(200),
                              ),
                            ),
                          ],
                        ),

                        // Some Space
                        SizedBox(
                          height: _screenUtil.setHeight(100),
                        ),

                        // Tasks update and show
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Tasks Update
                            Text(
                              'Tasks Update'.toUpperCase(),
                              style: TextStyle(
                                fontFamily: Globals.poppins,
                                fontSize: _screenUtil.setSp(40),
                                color: Colors.white,
                              ),
                            ),

                            // Show all tasks
                            Text(
                              'Show All',
                              style: TextStyle(
                                fontFamily: Globals.poppins,
                                fontSize: _screenUtil.setSp(40),
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Some spacing
                  SizedBox(
                    height: _screenUtil.setHeight(170),
                  ),
                ],
              ),

              // The tasks pie charts part
              Positioned(
                right: 0.0,
                left: 0.0,
                bottom: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      tasks.length,
                      (index) => Material(
                            elevation: 5,
                            shadowColor: Colors.grey,
                            borderRadius:
                                BorderRadius.circular(_screenUtil.setSp(30)),
                            child: Container(
                              height: _screenUtil.setHeight(350),
                              width: _screenUtil.setWidth(300),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      _screenUtil.setSp(30))),
                              child: TasksPieChart(
                                tasksType: tasks[index]['tasksType'],
                                tasksNumber: tasks[index]['tasksNumber'],
                                allTasksNumber: 250,
                              ),
                            ),
                          )),
                ),
              ),
            ],
          ),

          // some spacing
          SizedBox(
            height: _screenUtil.setHeight(100),
          ),

          //
        ],
      ),
    );
  }

  // test data for pie charts
  List tasks = [
    {
      'tasksType': TasksType.Regular,
      'tasksNumber': 200.0,
    },
    {
      'tasksType': TasksType.Completed,
      'tasksNumber': 120.0,
    },
    {
      'tasksType': TasksType.Delayed,
      'tasksNumber': 50.0,
    },
  ];
}
