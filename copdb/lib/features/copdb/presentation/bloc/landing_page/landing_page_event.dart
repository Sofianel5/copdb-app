part of '../root_bloc.dart';

class LandingPageEvent extends HomeEvent {}

class LandingPageCreationEvent extends LandingPageEvent {
  final User user; 
  LandingPageCreationEvent({@required this.user});
}

class LandingPageRefreshEvent extends LandingPageEvent {}
