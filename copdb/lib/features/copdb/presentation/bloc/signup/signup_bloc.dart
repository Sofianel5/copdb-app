part of '../root_bloc.dart';

class SignupBlocRouter {
  Signup signup;
  InputConverter inputConverter = InputConverter();
  CheckUsername checkUsername;
  User user;
  SignupBlocRouter(this.signup);
  String email;
  DateTime dob;
  String username;
  String firstName;
  String lastName;
  String password;
  Stream<RootState> route(SignupEvent event) async* {
    if (event is RequestSignup) {
      ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpUsername);
      yield SignupEmail();
    } else if (event is UsernamePageSubmitted) {
      yield*  (inputConverter.validateUsername(event.username)).fold((failure) async* {
        yield SignupUsernameFailure(message: failure.message, username: event.username);
      }, (username) async* {
        yield* (await checkUsername(CheckUsernameParams(username: username))).fold((failure) async* {
          yield SignupUsernameFailure(message: failure.message, username: event.username);
        }, (res) async* {
          if (res){
            ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpName);
          } else {
            yield SignupUsernameFailure(message: Messages.UNAVAILABLE_USERNAME, username: event.username);
          }
        });
      });
    } else if (event is NamePageSubmitted) {
      yield* inputConverter.parseName(event.firstName).fold((failure) async* {
        yield SignupNameFailure(firstName: event.firstName, lastName: event.lastName, message: failure.message);
      } , (str) async* {
        firstName = str;
        yield* inputConverter.parseName(event.lastName).fold((failure) async* {
          yield SignupNameFailure(firstName: event.firstName, lastName: event.lastName, message: failure.message);
        }, (str) async* {
          lastName = str;
          ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpEmail);
          yield SignupEmail();
        });
      });
    } else if (event is EmailPageSubmitted) {
      yield* inputConverter.parseEmail(event.email).fold((failure) async* {
        yield SignupEmailFailure(email: event.email,message: failure.message);
      } , (str) async* {
        email = str;
        ExtendedNavigator.rootNavigator.pushNamed(Routes.signUpPasswordScreen);
      });
    } else if (event is PasswordPageSubmitted) {
      yield SignupLoading();
      final result = await signup(
        SignupParams(
          email: email,
          username: username,
          firstName: firstName,
          lastName: lastName,
          dob: dob,
          password: event.password,
        ),
      );
      print(result);
      yield* result.fold(
        (failure) async* {
          yield SignupPasswordFailure(message: failure.message);
        },
        (success) async* {
          user = success;
          yield AuthenticatedState(user);
          //ExtendedNavigator.rootNavigator.popUntil((route) => route.isFirst);
        },
      );
    } 
  }
}