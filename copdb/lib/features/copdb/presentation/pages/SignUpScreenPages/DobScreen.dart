import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/PasswordScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:copdb/features/copdb/presentation/widgets/DatePicker.dart';
import 'package:flutter/material.dart';


class DobScreen extends StatefulWidget 
{
  @override
  _DobScreen createState() => _DobScreen();
}

class _DobScreen extends State<DobScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter your date \nof birth',
      inputText: 'date of birth',
      page: PasswordScreen(),
      alt: DatePicker(
        onDateChanged: (date) {
          print(date);
          //everytime someone changes the date u get it here 
        },
      ),
      onSubmit: (s) {
        //on press next from the _screen
      },
    );
  }
}

