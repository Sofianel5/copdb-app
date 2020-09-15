
import 'package:auto_route/auto_route_annotations.dart';
import 'package:copdb/features/copdb/presentation/pages/DatabaseScreen.dart';

import 'package:copdb/features/copdb/presentation/pages/EntryScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/EventScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/FriendProfileScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/FriendScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/HomeScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/IncidentScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/NotificationScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ProfileScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportDetailScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/AbuseScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/AllegationScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/BadgeScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/CopFirstnameScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/CopLastnameScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/CopLocationScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/SubmitScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/DobScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/EmailScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/FirstnameScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/LastnameScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/PasswordScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/UserScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/_ScreenX.dart';

import '../features/assistant/presentation/pages/root.dart';
import '../features/assistant/presentation/pages/signup_email.dart';
import '../features/assistant/presentation/pages/signup_name.dart';
import '../features/assistant/presentation/pages/signup_password.dart';


@MaterialAutoRouter()
class $Router {
  @initial
  RootPage rootPage;
  SignUpEmailScreen signUpEmail;
  SignUpNameScreen signUpName;
  SignUpPasswordScreen signUpPasswordScreen;
  RegisterScreen register;
  UnauthenticatedVenueScreen unauthenticatedVenue;
  EntryScreen entryScreen;
  DobScreen dobScreen;
  EmailScreen emailScreen;
  FirstnameScreen firstnameScreen;
  LastnameScreen lastnameScreen;
  PasswordScreen passwordScreen;
  UserScreen userScreen;
  ScreenX screenX;
  ReportDetailScreen reportDetailScreen;
  EventScreen eventScreen;
  ProfileScreen profileScreen;
  HomeScreen homeScreen;
  NotificationScreen notificationScreen;
  DatabaseScreen databaseScreen;
  IncidentScreen incidentScreen;
  FriendProfileScreen friendProfileScreen;
  FriendScreen friendScreen;
  AbuseScreen abuseScreen;
  AllegationScreen allegationScreen;
  BadgeScreen badgeScreen;
  CopFirstnameScreen copFirstnameScreen;
  CopLastnameScreen copLastnameScreen;
  CopLocationScreen copLocationScreen;
  SubmitScreen submitScreen;
  
}
