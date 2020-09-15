part of '../root_bloc.dart';

class SignupState extends UnauthenticatedState {

}

class SignupEmail extends SignupState {
  String email;
  SignupEmail({this.email});
}

class SignupUsername extends SignupState {
  String username;
  SignupUsername(this.username);
}

class SignupUsernameFailure extends SignupUsername {
  String message;
  SignupUsernameFailure({String username, this.message}) : super(username);
}

class SignupEmailFailure extends SignupEmail {
  String email;
  String message;
  SignupEmailFailure({this.email, this.message});
}

class SignupName extends SignupState {
  String firstName;
  String lastName;
  SignupName({this.firstName, this.lastName});
}

class SignupNameFailure extends SignupName { 
  String message;
  String firstName;
  String lastName;
  SignupNameFailure({this.firstName, this.lastName, this.message});
} 

class SignupPassword extends SignupState {
  String password;
  SignupPassword({this.password});
}

class SignupPasswordFailure extends SignupPassword {
  String message;
  SignupPasswordFailure({this.message});
}

class SignupProfilePicture extends SignupState {
  File picture;
  SignupProfilePicture({this.picture});
}

class SignupProfilePictureFailure extends SignupProfilePicture {

  String message;
  SignupProfilePictureFailure({this.message});
}

class SignupLoading extends SignupState {}