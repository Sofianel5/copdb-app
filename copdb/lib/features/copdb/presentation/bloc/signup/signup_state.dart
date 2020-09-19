part of '../root_bloc.dart';

class SignupState extends UnauthenticatedState {

}

class SignupEmail extends SignupState {
  String email;
  SignupEmail({this.email});
}

class SignupEmailFailure extends SignupEmail {
  String email;
  String message;
  SignupEmailFailure({this.email, this.message}) : super(email: email);

  @override
  List<Object> get props => [email, message];
  
}

class SignupUsername extends SignupState {
  String username;
  SignupUsername({this.username});
}

class SignupUsernameLoading extends SignupState {}

class SignupUsernameFailure extends SignupUsername {
  String message;
  SignupUsernameFailure({String username, this.message}) : super(username: username);

  @override
  List<Object> get props => [username, message];
}

class SignupName extends SignupState {
  String firstName;
  String lastName;
  SignupName({this.firstName, this.lastName});
  @override
  List<Object> get props => [firstName, lastName];
}

class SignupNameFailure extends SignupName { 
  String message;
  String firstName;
  String lastName;
  SignupNameFailure({this.firstName, this.lastName, this.message});
  @override
  List<Object> get props => [firstName, lastName, message];
} 

class SignupPassword extends SignupState {
  String password;
  SignupPassword({this.password});
  @override
  List<Object> get props => [password];
}

class SignupPasswordFailure extends SignupPassword {
  String message;
  String password;
  SignupPasswordFailure({this.password, this.message});
  @override
  List<Object> get props => [password, message];
}

class SignupProfilePicture extends SignupState {
  File picture;
  SignupProfilePicture({this.picture});
  @override
  List<Object> get props => [picture];
}

class SignupProfilePictureFailure extends SignupProfilePicture {
  String message;
  SignupProfilePictureFailure({this.message, File picture}) : super(picture: picture);
  @override
  List<Object> get props => [picture, message];
}

class SignupLoading extends SignupState {}