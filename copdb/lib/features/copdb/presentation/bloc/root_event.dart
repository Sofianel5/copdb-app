part of 'root_bloc.dart';

abstract class RootEvent extends Equatable {
  const RootEvent();
  @override
  List<Object> get props => [];
}

class GetExistingUserEvent extends RootEvent {
  @override
  List<Object> get props => [];
}

class SignupSubmitEvent extends RootEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  SignupSubmitEvent({this.email, this.password, this.firstName, this.lastName});
  @override
  List<Object> get props => [email, password, firstName, lastName];
}

class ErrorEvent extends RootEvent {
  final String message;
  ErrorEvent({this.message});
  @override
  List<Object> get props => [message];
}

class LogoutEvent extends RootEvent {
  @override
  List<Object> get props => [];
}

class FullPopEvent extends RootEvent {}

class PopEvent extends RootEvent {}