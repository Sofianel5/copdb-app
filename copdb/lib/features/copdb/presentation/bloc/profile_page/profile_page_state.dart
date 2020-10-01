part of '../root_bloc.dart';

class ProfileState extends AuthenticatedState {
  ProfileState(User user) : super(user);
  List<Object> get props => [user];
} 

// Can access contacts but no connection to server
class FailedProfileState extends ProfileState {
  String message;
  FailedProfileState(User user, this.message) : super(user);
  List<Object> get props => [user, message];
}

// Contacts displayed
class LoadedProfileState extends ProfileState {
  List<Contact> contacts;
  LoadedProfileState(User user, this.contacts) : super(user);

  List<Contact> friends() {
    return this.contacts.where((i) => i.areFriends).toList();
  }
  List<Contact> copDBUsers() {
    return this.contacts.where((i) => i.referencedUser != null).toList();
  }
  List<Object> get props => [user, contacts];
}