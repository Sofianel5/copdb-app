import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/DobScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
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

