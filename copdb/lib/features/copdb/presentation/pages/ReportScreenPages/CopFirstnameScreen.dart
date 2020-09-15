import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/CopLastnameScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:flutter/material.dart';


class CopFirstnameScreen extends StatefulWidget 
{
  @override
  _CopFirstnameScreen createState() => _CopFirstnameScreen();
}

class _CopFirstnameScreen extends State<CopFirstnameScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter the first name \nof the accused cop',
      inputText: 'Cop\'s first name',
      page: CopLastnameScreen(),
    );
  }
}
