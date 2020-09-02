import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget 
{
  const NotificationScreen({Key key}) : super(key: key);
  @override
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Center(
        child: Text(
          "ns",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

