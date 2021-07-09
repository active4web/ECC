import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../screen_util.dart';
import '../../globals.dart';

/// Tasks Pie Chart Widget
class TasksPieChart extends StatelessWidget {
  /// Regular tasks, completed tasks, or delayed tasks.
  final TasksType tasksType;

  /// Number of tasks.
  final double tasksNumber;

  /// Number of all tasks
  final double allTasksNumber;

  TasksPieChart({
    Key? key,
    required this.tasksType,
    required this.tasksNumber,
    required this.allTasksNumber,
  }) : super(key: key);

  final ScreenUtil _screenUtil = ScreenUtil();

  @override
  Widget build(BuildContext context) {
    _screenUtil.init(context);
    return Column(
      children: [
        // the pie chart
        Flexible(
          child: PieChart(
            PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                startDegreeOffset: -90,
                centerSpaceRadius: _screenUtil.setSp(60),
                sections: showingSections()),
          ),
        ),

        // Regular , Complete, or Delayed
        Text(
          tasksType == TasksType.Regular
              ? 'Regular'
              : tasksType == TasksType.Completed
                  ? 'Completed'
                  : tasksType == TasksType.Delayed
                      ? 'Delayed'
                      : '',
          style: TextStyle(
            fontFamily: Globals.poppins,
            fontSize: _screenUtil.setSp(40),
          ),
        ),

        // number of tasks
        Text(
          '${tasksNumber.toStringAsFixed(0)}',
          style: TextStyle(
            fontFamily: Globals.poppins,
            fontSize: _screenUtil.setSp(40),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final fontSize = _screenUtil.setSp(30);
      final radius = _screenUtil.setSp(20);
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: tasksType == TasksType.Regular
                ? Color(0xff7e9cd9)
                : tasksType == TasksType.Completed
                    ? Color(0xfff5d58b)
                    : tasksType == TasksType.Delayed
                        ? Color(0xfff18080)
                        : null,
            value: tasksNumber,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff1f1f1),
            value: 50,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}

enum TasksType {
  Regular,
  Completed,
  Delayed,
}
