import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/DobScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:copdb/features/copdb/presentation/widgets/DoubleInput.dart';
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
      text: 'Enter your first and \nlast name',
      page: DobScreen(),
      alt: DoubleInput(
        firstInputText: 'first name', 
        secondInputText: 'second name',
      ),
    );
  }
}

