import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget 
{
  const ProfileScreen({Key key}) : super(key: key);
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Center(
        child: Text(
          "pf",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

