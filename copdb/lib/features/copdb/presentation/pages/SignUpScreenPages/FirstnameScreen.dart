import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/LastnameScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:flutter/material.dart';


class FirstnameScreen extends StatefulWidget 
{
  @override
  _FirstnameScreen createState() => _FirstnameScreen();
}

class _FirstnameScreen extends State<FirstnameScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter your first \nname',
      inputText: 'first name',
      page: LastnameScreen(),
    );
  }
}

