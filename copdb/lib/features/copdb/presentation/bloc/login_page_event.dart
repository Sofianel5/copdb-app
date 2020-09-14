part of 'root_bloc.dart';

class LoginEvent extends RootEvent {
  @override
  List<Object> get props => [];
}

class LoginAttemptEvent extends LoginEvent {
  final String username;
  final String password;
  LoginAttemptEvent({this.username, this.password});
  LoginParams get params => LoginParams(username: username, password: password);
  @override
  List<Object> get props => [username, password];
}
class RequestSignupEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class RequestResetPasswordEvent extends RootEvent {
  @override
  List<Object> get props => [];
}