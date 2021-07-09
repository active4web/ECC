import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen_util.dart';
import 'globals.dart';
import 'home_widgets/main_screen.dart';
import 'home_widgets/workflow_screen.dart';
import 'home_widgets/attendance_screen.dart';
import 'home_widgets/projects_screen.dart';
import '../bloc/home_page/home_page_bloc.dart';

/// The home screen after the user logins.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return BlocProvider(
      create: (_) => HomePageBloc()..add(NavigateToMainScreen()),
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                // The home screen body
                state is MainScreenState
                    ? MainScreen()
                    : state is WorkflowScreenState
                        ? WorkflowScreen()
                        : state is AttendanceScreenState
                            ? AttendanceScreen()
                            : state is ProjectsScreenState
                                ? ProjectsScreen()
                                : Container(),

                // the bottom bar
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Stack(
                    children: [
                      // bottom bar background
                      Container(
                        height: _screenUtil.setHeight(350),
                        color: Colors.transparent,
                      ),

                      // the bottom part with icons
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child: Material(
                          elevation: 50,
                          shadowColor: Colors.black,
                          borderRadius:
                              BorderRadius.circular(_screenUtil.setSp(30)),
                          child: Container(
                            height: _screenUtil.setHeight(250),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(_screenUtil.setSp(30)),
                                topLeft: Radius.circular(_screenUtil.setSp(30)),
                              ),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // left-side icons
                                Padding(
                                  padding:
                                      EdgeInsets.all(_screenUtil.setSp(30)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Workflow
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<HomePageBloc>(context)
                                              .add(NavigateToWorkflowScreen());
                                        },
                                        child: Column(
                                          children: [
                                            // Workflow Icon
                                            Image.asset(
                                              'assets/workflow.png',
                                              height:
                                                  _screenUtil.setHeight(100),
                                              width: _screenUtil.setWidth(100),
                                              color:
                                                  state is WorkflowScreenState
                                                      ? Color(0xffd65a4c)
                                                      : Color(0xff959595),
                                            ),

                                            // Some spacing
                                            SizedBox(
                                              height: _screenUtil.setHeight(30),
                                            ),

                                            // Workflow title
                                            Text(
                                              'Workflow',
                                              style: TextStyle(
                                                fontFamily: Globals.poppins,
                                                fontSize: _screenUtil.setSp(33),
                                                color:
                                                    state is WorkflowScreenState
                                                        ? Color(0xffd65a4c)
                                                        : Color(0xff959595),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Some spacing
                                      SizedBox(
                                        width: _screenUtil.setWidth(50),
                                      ),

                                      // Attendance
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<HomePageBloc>(context)
                                              .add(
                                                  NavigateToAttendanceScreen());
                                        },
                                        child: Column(
                                          children: [
                                            // Attendance Icon
                                            Image.asset(
                                              'assets/attendance.png',
                                              height:
                                                  _screenUtil.setHeight(100),
                                              width: _screenUtil.setWidth(100),
                                              color:
                                                  state is AttendanceScreenState
                                                      ? Color(0xffd65a4c)
                                                      : Color(0xff959595),
                                            ),

                                            // Some spacing
                                            SizedBox(
                                              height: _screenUtil.setHeight(30),
                                            ),

                                            // Attendance title
                                            Text(
                                              'Attendance',
                                              style: TextStyle(
                                                fontFamily: Globals.poppins,
                                                fontSize: _screenUtil.setSp(33),
                                                color: state
                                                        is AttendanceScreenState
                                                    ? Color(0xffd65a4c)
                                                    : Color(0xff959595),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Some spacing
                                SizedBox(
                                  width: _screenUtil.setWidth(170),
                                ),

                                // right-side icons
                                Padding(
                                  padding:
                                      EdgeInsets.all(_screenUtil.setSp(30)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Projects
                                      GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<HomePageBloc>(context)
                                              .add(NavigateToProjectsScreen());
                                        },
                                        child: Column(
                                          children: [
                                            // Projects Icon
                                            Image.asset(
                                              'assets/projects.png',
                                              height:
                                                  _screenUtil.setHeight(100),
                                              width: _screenUtil.setWidth(100),
                                              color:
                                                  state is ProjectsScreenState
                                                      ? Color(0xffd65a4c)
                                                      : Color(0xff959595),
                                            ),

                                            // Some spacing
                                            SizedBox(
                                              height: _screenUtil.setHeight(30),
                                            ),

                                            // Projects title
                                            Text(
                                              'Projects',
                                              style: TextStyle(
                                                fontFamily: Globals.poppins,
                                                fontSize: _screenUtil.setSp(33),
                                                color:
                                                    state is ProjectsScreenState
                                                        ? Color(0xffd65a4c)
                                                        : Color(0xff959595),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Some spacing
                                      SizedBox(
                                        width: _screenUtil.setWidth(100),
                                      ),

                                      // More
                                      Column(
                                        children: [
                                          // More Icon
                                          Image.asset(
                                            'assets/more.png',
                                            height: _screenUtil.setHeight(100),
                                            width: _screenUtil.setWidth(100),
                                            color: Color(0xff959595),
                                          ),

                                          // Some spacing
                                          SizedBox(
                                            height: _screenUtil.setHeight(30),
                                          ),

                                          // More title
                                          Text(
                                            'More',
                                            style: TextStyle(
                                              fontFamily: Globals.poppins,
                                              fontSize: _screenUtil.setSp(33),
                                              color: Color(0xff959595),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // the big home icon
                      Positioned(
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<HomePageBloc>(context)
                                .add(NavigateToMainScreen());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 10,
                              shadowColor: Colors.black,
                              borderRadius: BorderRadius.circular(
                                  _screenUtil.setWidth(150)),
                              child: Image.asset(
                                'assets/home_icon.png',
                                height: _screenUtil.setHeight(200),
                                width: _screenUtil.setWidth(200),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
