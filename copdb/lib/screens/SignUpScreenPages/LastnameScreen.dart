import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:copdb/screens/SignUpScreenPages/DobScreen.dart';
import 'package:flutter/material.dart';


class LastnameScreen extends StatefulWidget 
{
  @override
  _LastnameScreen createState() => _LastnameScreen();
}

class _LastnameScreen extends State<LastnameScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter your last \nname',
      inputText: 'last name',
      page: DobScreen(),
    );
  }
}

