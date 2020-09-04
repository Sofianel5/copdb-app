import 'package:copdb/screens/HomeScreen.dart';
import 'package:copdb/screens/_ScreenX.dart';
import 'package:flutter/material.dart';
import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:copdb/screens/HomeScreen.dart';

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
      page: ScreenX(),
    );
  }
}

