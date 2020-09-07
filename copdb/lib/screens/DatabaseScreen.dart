import 'package:copdb/utils/NavBar.dart';
import 'package:copdb/utils/SearchBar.dart';
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
          Container(height: 15, ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(8, 11, 17, 1),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF54C6EB).withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: 7,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              border: Border(
                left: BorderSide.none, 
                right: BorderSide.none, 
                top: BorderSide(color: Color(0xFF54C6EB).withOpacity(0.6), width: .5),
                /*  bottom: BorderSide(color: Colors.white) */
              ),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: SearchBar(),
          ),
        ]
      ),
    );
  }
}

