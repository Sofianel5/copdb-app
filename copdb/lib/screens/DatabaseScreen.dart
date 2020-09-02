import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

class DatabaseScreen extends StatefulWidget 
{
  const DatabaseScreen({Key key}) : super(key: key);
  @override
  _DatabaseScreen createState() => _DatabaseScreen();
}

class _DatabaseScreen extends State<DatabaseScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Center(
        child: Text(
          "db",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

