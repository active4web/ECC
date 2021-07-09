import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    yield HomePageInitial();

    if (event is NavigateToMainScreen) {
      yield MainScreenState();
    } else if (event is NavigateToWorkflowScreen) {
      yield WorkflowScreenState();
    } else if (event is NavigateToAttendanceScreen) {
      yield AttendanceScreenState();
    } else if (event is NavigateToProjectsScreen) {
      yield ProjectsScreenState();
    }
  }
}
