import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/AvatarScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:copdb/features/copdb/presentation/pages/_ScreenX.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget 
{
  @override
  _PasswordScreen createState() => _PasswordScreen();
}

class _PasswordScreen extends State<PasswordScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Create a unique \npassword',
      inputText: 'password',
      page: AvatarScreen(),
      onSubmit: (password) {
        //you get the password here onsubmit
      },
    );
  }
}

