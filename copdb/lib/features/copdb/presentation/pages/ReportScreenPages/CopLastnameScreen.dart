import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/CopLocationScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:flutter/material.dart';


class CopLastnameScreen extends StatefulWidget 
{
  @override
  _CopLastnameScreen createState() => _CopLastnameScreen();
}

class _CopLastnameScreen extends State<CopLastnameScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter the last name \nof the accused cop',
      inputText: 'Cop\'s last name',
      page: CopLocationScreen(),
    );
  }
}
