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
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/PasswordScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/UserScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/_ScreenX.dart';
import 'package:copdb/features/copdb/presentation/pages/root.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: RootPage, initial: true),
  MaterialRoute(page: EntryScreen),
  MaterialRoute(page: DobScreen),
  MaterialRoute(page: EmailScreen),
  MaterialRoute(page: FirstnameScreen),
  MaterialRoute(page: PasswordScreen),
  MaterialRoute(page: UserScreen),
  MaterialRoute(page: ScreenX),
  MaterialRoute(page: ReportDetailScreen),
  MaterialRoute(page: EventScreen),
  MaterialRoute(page: ProfileScreen),
  MaterialRoute(page: HomeScreen),
  MaterialRoute(page: NotificationScreen),
  MaterialRoute(page: DatabaseScreen),
  MaterialRoute(page: IncidentScreen),
  MaterialRoute(page: FriendProfileScreen),
  MaterialRoute(page: FriendScreen),
  MaterialRoute(page: AbuseScreen),
  MaterialRoute(page: AllegationScreen),
  MaterialRoute(page: BadgeScreen),
  MaterialRoute(page: CopFirstnameScreen),
  MaterialRoute(page: CopLastnameScreen),
  MaterialRoute(page: CopLocationScreen),
  MaterialRoute(page: SubmitScreen),
])
class $Router {}
