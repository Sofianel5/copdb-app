import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/EmailScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:flutter/material.dart';


class UserScreen extends StatefulWidget 
{
  @override
  _UserScreen createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Create a unique \nusername',
      inputText: 'username',
      page: EmailScreen(),
      onSubmit: (email) {
        // you get the email here on submit
      },
    );
  }
}

