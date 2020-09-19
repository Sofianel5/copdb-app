part of '../root_bloc.dart';

class SignupEvent extends RootEvent {
  @override
  List<Object> get props => [];
}

class RequestSignup extends SignupEvent {}

class UsernamePageSubmitted extends SignupEvent {
  final String username;
  UsernamePageSubmitted(this.username);
}

class EmailPageSubmitted extends SignupEvent {
  String email;
  EmailPageSubmitted(this.email);
}

class NamePageSubmitted extends SignupEvent {
  String firstName;
  String lastName;
  NamePageSubmitted(this.firstName, this.lastName);
}

class DOBPageSubmitted extends SignupEvent {
  DateTime dob;
  DOBPageSubmitted(this.dob);
}

class PasswordPageSubmitted extends SignupEvent {
  String password;
  PasswordPageSubmitted(this.password);

  @override
  List<Object> get props => [];
}

class ProfilePicturePageSubmitted extends SignupEvent {
  File picture;
  ProfilePicturePageSubmitted({this.picture});
}

class SignUpComplete extends RootEvent {

}