import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:copdb/screens/SignUpScreenPages/DobScreen.dart';
import 'package:copdb/screens/SignUpScreenPages/passwordScreen.dart';
import 'package:flutter/material.dart';


class DobScreen extends StatefulWidget 
{
  @override
  _DobScreen createState() => _DobScreen();
}

class _DobScreen extends State<DobScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter your date \of birth',
      inputText: 'date of birth',
      page: PasswordScreen(),
    );
  }
}

