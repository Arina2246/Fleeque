part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class Init extends HomeEvent {}
