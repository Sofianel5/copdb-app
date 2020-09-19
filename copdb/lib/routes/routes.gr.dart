// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/copdb/domain/entities/complaint.dart';
import '../features/copdb/domain/entities/copdbevent.dart';
import '../features/copdb/domain/entities/user.dart';
import '../features/copdb/presentation/pages/DatabaseScreen.dart';
import '../features/copdb/presentation/pages/EntryScreen.dart';
import '../features/copdb/presentation/pages/EventScreen.dart';
import '../features/copdb/presentation/pages/FriendProfileScreen.dart';
import '../features/copdb/presentation/pages/FriendScreen.dart';
import '../features/copdb/presentation/pages/HomeScreen.dart';
import '../features/copdb/presentation/pages/IncidentScreen.dart';
import '../features/copdb/presentation/pages/NotificationScreen.dart';
import '../features/copdb/presentation/pages/ProfileScreen.dart';
import '../features/copdb/presentation/pages/ReportDetailScreen.dart';
import '../features/copdb/presentation/pages/ReportScreenPages/AbuseScreen.dart';
import '../features/copdb/presentation/pages/ReportScreenPages/AllegationScreen.dart';
import '../features/copdb/presentation/pages/ReportScreenPages/BadgeScreen.dart';
import '../features/copdb/presentation/pages/ReportScreenPages/CopFirstnameScreen.dart';
import '../features/copdb/presentation/pages/ReportScreenPages/CopLastnameScreen.dart';
import '../features/copdb/presentation/pages/ReportScreenPages/CopLocationScreen.dart';
import '../features/copdb/presentation/pages/ReportScreenPages/SubmitScreen.dart';
import '../features/copdb/presentation/pages/SignUpScreenPages/DobScreen.dart';
import '../features/copdb/presentation/pages/SignUpScreenPages/EmailScreen.dart';
import '../features/copdb/presentation/pages/SignUpScreenPages/NameScreen.dart';
import '../features/copdb/presentation/pages/SignUpScreenPages/PasswordScreen.dart';
import '../features/copdb/presentation/pages/SignUpScreenPages/UserScreen.dart';
import '../features/copdb/presentation/pages/_ScreenX.dart';
import '../features/copdb/presentation/pages/root.dart';
import '../models/Event.dart';

class Routes {
  static const String rootPage = '/';
  static const String entryScreen = '/entry-screen';
  static const String dobScreen = '/dob-screen';
  static const String emailScreen = '/email-screen';
  static const String nameScreen = '/name-screen';
  static const String passwordScreen = '/password-screen';
  static const String userScreen = '/user-screen';
  static const String screenX = '/screen-x';
  static const String reportDetailScreen = '/report-detail-screen';
  static const String eventScreen = '/event-screen';
  static const String profileScreen = '/profile-screen';
  static const String homeScreen = '/home-screen';
  static const String notificationScreen = '/notification-screen';
  static const String databaseScreen = '/database-screen';
  static const String incidentScreen = '/incident-screen';
  static const String friendProfileScreen = '/friend-profile-screen';
  static const String friendScreen = '/friend-screen';
  static const String abuseScreen = '/abuse-screen';
  static const String allegationScreen = '/allegation-screen';
  static const String badgeScreen = '/badge-screen';
  static const String copFirstnameScreen = '/cop-firstname-screen';
  static const String copLastnameScreen = '/cop-lastname-screen';
  static const String copLocationScreen = '/cop-location-screen';
  static const String submitScreen = '/submit-screen';
  static const all = <String>{
    rootPage,
    entryScreen,
    dobScreen,
    emailScreen,
    nameScreen,
    passwordScreen,
    userScreen,
    screenX,
    reportDetailScreen,
    eventScreen,
    profileScreen,
    homeScreen,
    notificationScreen,
    databaseScreen,
    incidentScreen,
    friendProfileScreen,
    friendScreen,
    abuseScreen,
    allegationScreen,
    badgeScreen,
    copFirstnameScreen,
    copLastnameScreen,
    copLocationScreen,
    submitScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.rootPage, page: RootPage),
    RouteDef(Routes.entryScreen, page: EntryScreen),
    RouteDef(Routes.dobScreen, page: DobScreen),
    RouteDef(Routes.emailScreen, page: EmailScreen),
    RouteDef(Routes.nameScreen, page: NameScreen),
    RouteDef(Routes.passwordScreen, page: PasswordScreen),
    RouteDef(Routes.userScreen, page: UserScreen),
    RouteDef(Routes.screenX, page: ScreenX),
    RouteDef(Routes.reportDetailScreen, page: ReportDetailScreen),
    RouteDef(Routes.eventScreen, page: EventScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.notificationScreen, page: NotificationScreen),
    RouteDef(Routes.databaseScreen, page: DatabaseScreen),
    RouteDef(Routes.incidentScreen, page: IncidentScreen),
    RouteDef(Routes.friendProfileScreen, page: FriendProfileScreen),
    RouteDef(Routes.friendScreen, page: FriendScreen),
    RouteDef(Routes.abuseScreen, page: AbuseScreen),
    RouteDef(Routes.allegationScreen, page: AllegationScreen),
    RouteDef(Routes.badgeScreen, page: BadgeScreen),
    RouteDef(Routes.copFirstnameScreen, page: CopFirstnameScreen),
    RouteDef(Routes.copLastnameScreen, page: CopLastnameScreen),
    RouteDef(Routes.copLocationScreen, page: CopLocationScreen),
    RouteDef(Routes.submitScreen, page: SubmitScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    RootPage: (data) {
      final args = data.getArgs<RootPageArguments>(
        orElse: () => RootPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RootPage(key: args.key),
        settings: data,
      );
    },
    EntryScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EntryScreen(),
        settings: data,
      );
    },
    DobScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DobScreen(),
        settings: data,
      );
    },
    EmailScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EmailScreen(),
        settings: data,
      );
    },
    NameScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NameScreen(),
        settings: data,
      );
    },
    PasswordScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PasswordScreen(),
        settings: data,
      );
    },
    UserScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserScreen(),
        settings: data,
      );
    },
    ScreenX: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ScreenX(),
        settings: data,
      );
    },
    ReportDetailScreen: (data) {
      final args = data.getArgs<ReportDetailScreenArguments>(
        orElse: () => ReportDetailScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReportDetailScreen(
          report: args.report,
          index: args.index,
        ),
        settings: data,
      );
    },
    EventScreen: (data) {
      final args = data.getArgs<EventScreenArguments>(
        orElse: () => EventScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventScreen(
          event: args.event,
          copDBEvent: args.copDBEvent,
          index: args.index,
        ),
        settings: data,
      );
    },
    ProfileScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfileScreen(),
        settings: data,
      );
    },
    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeScreen(),
        settings: data,
      );
    },
    NotificationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NotificationScreen(),
        settings: data,
      );
    },
    DatabaseScreen: (data) {
      final args = data.getArgs<DatabaseScreenArguments>(
        orElse: () => DatabaseScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DatabaseScreen(key: args.key),
        settings: data,
      );
    },
    IncidentScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const IncidentScreen(),
        settings: data,
      );
    },
    FriendProfileScreen: (data) {
      final args = data.getArgs<FriendProfileScreenArguments>(
        orElse: () => FriendProfileScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => FriendProfileScreen(
          key: args.key,
          user: args.user,
        ),
        settings: data,
      );
    },
    FriendScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const FriendScreen(),
        settings: data,
      );
    },
    AbuseScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AbuseScreen(),
        settings: data,
      );
    },
    AllegationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AllegationScreen(),
        settings: data,
      );
    },
    BadgeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BadgeScreen(),
        settings: data,
      );
    },
    CopFirstnameScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CopFirstnameScreen(),
        settings: data,
      );
    },
    CopLastnameScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CopLastnameScreen(),
        settings: data,
      );
    },
    CopLocationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CopLocationScreen(),
        settings: data,
      );
    },
    SubmitScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubmitScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// RootPage arguments holder class
class RootPageArguments {
  final Key key;
  RootPageArguments({this.key});
}

/// ReportDetailScreen arguments holder class
class ReportDetailScreenArguments {
  final CopDBComplaint report;
  final int index;
  ReportDetailScreenArguments({this.report, this.index});
}

/// EventScreen arguments holder class
class EventScreenArguments {
  final Event event;
  final CopDBEvent copDBEvent;
  final int index;
  EventScreenArguments({this.event, this.copDBEvent, this.index});
}

/// DatabaseScreen arguments holder class
class DatabaseScreenArguments {
  final Key key;
  DatabaseScreenArguments({this.key});
}

/// FriendProfileScreen arguments holder class
class FriendProfileScreenArguments {
  final Key key;
  final User user;
  FriendProfileScreenArguments({this.key, this.user});
}
