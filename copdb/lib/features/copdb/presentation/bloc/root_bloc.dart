import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:copdb/features/copdb/domain/usecases/get_feed.dart';
import 'package:copdb/features/copdb/domain/usecases/upload_profile_pic.dart';
import 'package:copdb/routes/routes.gr.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/localizations/messages.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/util/input_converter.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/check_username.dart';
import '../../domain/usecases/get_cached_user.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/signup.dart';

part 'login_page_bloc.dart';
part 'login_page_event.dart';
part 'login_page_state.dart';
part 'home_page_bloc.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';
part 'root_event.dart';
part 'root_state.dart';
part 'signup/signup_bloc.dart';
part 'signup/signup_event.dart';
part 'signup/signup_state.dart';
part 'landing_page/landing_page_bloc.dart';
part 'landing_page/landing_page_state.dart';
part 'landing_page/landing_page_event.dart';
part 'search_page/search_page_bloc.dart';
part 'search_page/search_page_state.dart';
part 'search_page/search_page_event.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  final GetExistingUser getExistingUser;
  final Login login;
  final Signup signup;
  final Logout logout;
  final UploadProfilePic uploadPfp;
  final LoginBlocRouter loginBloc;
  final GetCachedUser getCachedUser;
  final SignupBlocRouter signupRouter;
  User user;

  RootBloc({
    @required this.getExistingUser, 
    @required this.login, 
    @required this.signup, 
    @required this.logout,
    @required this.loginBloc, 
    @required this.getCachedUser, 
    @required this.signupRouter,
    @required this.uploadPfp,
  });
  @override
  RootState get initialState => InitialState();

  @override
  Stream<RootState> mapEventToState(
    RootEvent event,
  ) async* {
    if (event is GetExistingUserEvent) {
      final result = await getExistingUser(NoParams());
      yield* result.fold((failure) async* {
        if (failure is AuthenticationFailure) {
          yield UnauthenticatedState();
        } else if (failure is ConnectionFailure) {
          final getCachedUserOrFailure = await getCachedUser(NoParams());
          yield* getCachedUserOrFailure.fold(
            (failure) async* {
              yield ErrorState(message: Messages.NO_INTERNET);
            },
            (_user) async* {
              user = _user;
            },
          );
        } else {
          yield ErrorState(message: failure.message);
        }
      }, (_user) async* {
        user = _user;
        yield AuthenticatedState(user);
      });
    } else if (event is LoginEvent) {
      yield* loginBloc.route(event);
      user = loginBloc.user;
    } else if (event is LogoutEvent) {
      await logout(NoParams());
      yield UnauthenticatedState();
    } else if (event is SignupEvent) {
      yield* signupRouter.route(event);
    } else if (event is PopEvent) {
      ExtendedNavigator.root.pop();
    }
  }
}
