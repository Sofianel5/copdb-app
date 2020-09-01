import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:copdb/screens/SignUpScreenPages/EmailScreen.dart';
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
      
    );
  }
}

