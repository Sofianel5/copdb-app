import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/FirstnameScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:flutter/material.dart';


class EmailScreen extends StatefulWidget 
{
  @override
  _EmailScreen createState() => _EmailScreen();
}

class _EmailScreen extends State<EmailScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter your \email',
      inputText: 'email',
      page: FirstnameScreen(),
      onSubmit: (text) {
        //whenever press next u get the string from input
      },
    );
  }
}

