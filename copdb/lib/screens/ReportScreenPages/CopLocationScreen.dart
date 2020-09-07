import 'package:copdb/screens/ReportScreenPages/AbuseScreen.dart';
import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:flutter/material.dart';



class CopLocationScreen extends StatefulWidget 
{
  @override
  _CopLocationScreen createState() => _CopLocationScreen();
}

class _CopLocationScreen extends State<CopLocationScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter the incidents \nzip code',
      inputText: 'zip code',
      page: AbuseScreen(),
    );
  }
}
