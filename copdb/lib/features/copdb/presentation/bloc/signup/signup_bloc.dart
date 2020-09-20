part of '../root_bloc.dart';

class SignupBlocRouter {
  final Signup signup;
  final InputConverter inputConverter;
  final CheckUsername checkUsername;
  final UploadProfilePic uploadPfp;
  final CheckEmail checkEmail;
  User user;
  SignupBlocRouter({
    @required this.signup, 
    @required this.uploadPfp,
    @required this.inputConverter,
    @required this.checkUsername,
    @required this.checkEmail,
  });
  String email;
  DateTime dob;
  String username;
  String firstName;
  String lastName;
  String password;
  Stream<RootState> route(SignupEvent event) async* {
    if (event is RequestSignup) {
      ExtendedNavigator.root.push(Routes.userScreen);
      yield SignupUsername();
    } else if (event is UsernamePageSubmitted) {
      yield SignupUsernameLoading();
      yield*  (inputConverter.validateUsername(event.username)).fold((failure) async* {
        yield new SignupUsernameFailure(message: failure.message, username: event.username);
      }, (_username) async* {
        yield* (await checkUsername(CheckUsernameParams(username: _username))).fold((failure) async* {
          yield SignupUsernameFailure(message: failure.message, username: event.username);
        }, (res) async* {
          if (res){
            yield SignupUsername(username: _username);
            ExtendedNavigator.root.push(Routes.emailScreen);
            this.username = _username;
          } else {
            yield new SignupUsernameFailure(message: Messages.UNAVAILABLE_USERNAME, username: event.username);
          }
        });
      });
    } else if (event is EmailPageSubmitted) {
      yield SignupEmailLoading();
      yield* inputConverter.parseEmail(event.email).fold((failure) async* {
        yield new SignupEmailFailure(email: event.email,message: failure.message);
      } , (_email) async* {
         yield* (await checkEmail(CheckEmailParams(email: _email))).fold((failure) async* {
          yield SignupEmailFailure(message: failure.message, email: event.email);
        }, (res) async* {
          if (res){
            yield SignupEmail(email: _email);
            ExtendedNavigator.root.push(Routes.nameScreen);
            this.email = _email;
          } else {
            yield new SignupEmailFailure(message: Messages.UNAVAILABLE_EMAIL, email: event.email);
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
          ExtendedNavigator.root.push(Routes.dobScreen);
          yield SignupDOB();
        });
      });
    } else if (event is DOBPageSubmitted) {
      if (event.dob != null) {
        dob = event.dob;
        ExtendedNavigator.root.push(Routes.passwordScreen);
      } else {
        yield SignupDOBFailure(message: Messages.NULL_DOB, dob: event.dob);
      }
    } else if (event is PasswordPageSubmitted) {
      yield SignupPasswordLoading(password: password);
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
          ExtendedNavigator.root.push(Routes.avatarScreen);
          //ExtendedNavigator.rootNavigator.popUntil((route) => route.isFirst);
        },
      );
    }
  }
}