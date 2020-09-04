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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 45,),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  child: Text("Report An Incident |", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                Expanded(child: Container(),),
              ],
            ),
          ),
          Container(height: 10, ),
        ]
      ),
    );
  }
}

