import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/AbuseScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
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
