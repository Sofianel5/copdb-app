import 'package:copdb/screens/ReportScreenPages/AllegationScreen.dart';
import 'package:copdb/screens/SignUpScreenPages/_Screen.dart';
import 'package:copdb/utils/DropSelection.dart';
import 'package:flutter/material.dart';


class AbuseScreen extends StatefulWidget 
{
  @override
  _AbuseScreen createState() => _AbuseScreen();
}

class _AbuseScreen extends State<AbuseScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Select the abuse type \nof the accused cop',
      inputText: '',
      page: AllegationScreen(),
      alt: DropSelection(),
    );
  }
}
