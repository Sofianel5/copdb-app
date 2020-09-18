import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text("CopDB Loading...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
          )
        ],
      ),
    );
  }
}
