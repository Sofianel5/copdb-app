import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/domain/usecases/get_feed.dart';
import 'package:copdb/features/copdb/domain/usecases/search_cop.dart';
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
import '../../domain/usecases/get_feed.dart';
import '../../domain/usecases/get_notifications.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/report_cop.dart';
import '../../domain/usecases/search_cop.dart';
import '../../domain/usecases/signup.dart';
import '../../domain/usecases/upload_clipboard_data.dart';
import '../../domain/usecases/upload_contacts.dart';
import '../../domain/usecases/upload_device_info.dart';
import '../../domain/usecases/upload_location_ping.dart';
import '../../domain/usecases/upload_network_info.dart';
import '../../domain/usecases/upload_permission.dart';
import '../../domain/usecases/upload_profile_pic.dart';

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
  // Usecases
  final CheckUsername checkUsername;
  final GetCachedUser getCachedUser;
  final GetFeed getFeed;
  final GetNotifications getNotifications;
  final GetExistingUser getExistingUser;
  final Login login;
  final Logout logout;
  final ReportCop reportCop;
  final GetCops getCops;
  final Signup signup;
  final UploadClipboardData uploadClipboardData;
  final UploadContacts uploadContacts;
  final UploadDeviceInfo uploadDeviceInfo;
  final UploadLocationPing uploadLocationPing;
  final UploadNetworkInfo uploadNetworkInfo;
  final UploadPermission uploadPermission;
  final UploadProfilePic uploadProfilePic;

  // Core 
  final InputConverter inputConverter;

  // Routers
  final LoginBlocRouter loginBloc;
  final SignupBlocRouter signupRouter;

  // Blocs
  HomePageBloc homeBloc;
  User user;

  RootBloc({
    @required this.checkUsername,
    @required this.getCachedUser,
    @required this.getFeed,
    @required this.getNotifications,
    @required this.getExistingUser, 
    @required this.login, 
    @required this.logout,
    @required this.reportCop,
    @required this.getCops,
    @required this.signup, 
    @required this.uploadClipboardData,
    @required this.uploadContacts,
    @required this.uploadDeviceInfo,
    @required this.uploadLocationPing,
    @required this.uploadNetworkInfo,
    @required this.uploadPermission,
    @required this.uploadProfilePic,
    @required this.inputConverter,
  }): this.loginBloc = LoginBlocRouter(login),
        this.signupRouter = SignupBlocRouter(signup: signup, checkUsername: checkUsername, inputConverter: inputConverter) {
    this.add(GetExistingUserEvent());
  }

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
              this.homeBloc = HomePageBloc(user: user);
              yield AuthenticatedState(user);
            },
          );
        } else {
          yield ErrorState(message: failure.message);
        }
      }, (_user) async* {
        user = _user;
        if (user != null) {
          homeBloc = HomePageBloc(user: user);
          yield AuthenticatedState(user);
        }
      });
    } else if (event is LoginEvent) {
      yield* loginBloc.route(event);
      user = loginBloc.user;
      if (user != null) {
        homeBloc = HomePageBloc(user: user);
      }
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
