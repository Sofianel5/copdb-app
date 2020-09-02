import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

class IncidentScreen extends StatefulWidget 
{
  const IncidentScreen({Key key}) : super(key: key);
  @override
  _IncidentScreen createState() => _IncidentScreen();
}

class _IncidentScreen extends State<IncidentScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Center(
        child: Text(
          "is",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

