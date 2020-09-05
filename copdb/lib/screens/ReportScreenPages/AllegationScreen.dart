import 'package:copdb/screens/HomeScreen.dart';
import 'package:copdb/screens/ReportScreenPages/SubmitScreen.dart';
import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:copdb/screens/_ScreenX.dart';
import 'package:flutter/material.dart';


class AllegationScreen extends StatefulWidget 
{
  @override
  _AllegationScreen createState() => _AllegationScreen();
}

class _AllegationScreen extends State<AllegationScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter the allegation \nof the accused cop',
      inputText: 'badge number',
      page: SubmitScreen(),
    );
  }
}
