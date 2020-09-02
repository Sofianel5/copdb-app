import 'package:copdb/screens/ProfileScreen.dart';
import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Center(
        child: Text(
          "hs",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

