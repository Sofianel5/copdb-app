import 'package:copdb/features/copdb/presentation/pages/ReportScreenPages/SubmitScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:copdb/features/copdb/presentation/widgets/DropSelection.dart';
import 'package:flutter/material.dart';


class AllegationScreen extends StatefulWidget 
{
  @override
  _AllegationScreen createState() => _AllegationScreen();
}

class _AllegationScreen extends State<AllegationScreen>
{
  @override
  Widget build(BuildContext context) {
    return Screen(
      text: 'Enter the allegation \nof the accused cop',
      inputText: '',
      page: SubmitScreen(),
      alt: DropSelection(),
    );
  }
}
