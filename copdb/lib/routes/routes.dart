
import 'package:auto_route/auto_route_annotations.dart';

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
}
