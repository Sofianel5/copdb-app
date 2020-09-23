part of '../root_bloc.dart';

class ProfileState extends AuthenticatedState {
  ProfileState(User user) : super(user);
  List<Object> get props => [user];
}

// Either no contacts in phone or no permission
class NoContactsState extends ProfileState {
  bool hasPermission;
  NoContactsState(User user, this.hasPermission) : super(user);
}

// Can access contacts but no connection to server
class FailedStateProfileState extends ProfileState {
  String message;
  FailedStateProfileState(User user, this.message) : super(user);
}