import 'package:copdb/screens/ReportScreenPages/CopFirstnameScreen.dart';
import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:flutter/material.dart';


class BadgeScreen extends StatefulWidget 
{
  @override
  _BadgeScreen createState() => _BadgeScreen();
}

class _BadgeScreen extends State<BadgeScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter the badge # \nof the accused cop',
      inputText: 'badge number',
      page: CopFirstnameScreen(),
    );
  }
}

