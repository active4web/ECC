part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
}

class NavigateToMainScreen extends HomePageEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToWorkflowScreen extends HomePageEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToAttendanceScreen extends HomePageEvent {
  @override
  List<Object?> get props => [];
}

class NavigateToProjectsScreen extends HomePageEvent {
  @override
  List<Object?> get props => [];
}
