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
                  child: Text("Cop Database |", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                Expanded(child: Container(),),
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 170,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            child: Text("Elongated City Name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 10, ),
        ]
      ),
    );
  }
}

