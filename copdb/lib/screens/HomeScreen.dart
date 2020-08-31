import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget 
{
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context)
  {
    Color grey = Color.fromRGBO(8, 11, 17, 1);
    
    return Scaffold(
      backgroundColor: grey,
      body: Image.asset('assets/copDB-icon-white.png'),
    );
  }
}