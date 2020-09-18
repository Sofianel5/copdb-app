part of '../root_bloc.dart';

class LandingState extends HomeState {
  LandingState(User user) : super(user);
  bool shouldShowType(int index) => false;
}

class LoadingLandingState extends LandingState implements LoadingState {
  final String message = Messages.LOADING;
  LoadingLandingState(User user) : super(user);
}

class LoadingFailedState extends LandingState {
  final String message;
  LoadingFailedState(User user, {this.message}) : super(user);
}

class LoadedLandingState extends LandingState {
  final List events;
  LoadedLandingState(User user, {@required this.events}) : assert(events != null, user != null), super(user);
}

class LandingPoppedIn extends LoadingFailedState {
  LandingPoppedIn(User user) : super(user);
}

