import 'package:copdb/models/Friend.dart';
import 'package:copdb/models/Report.dart';
import 'package:copdb/models/ReportPreview.dart';
import 'package:copdb/screens/FriendProfileScreen.dart';
import 'package:copdb/utils/NavBar.dart';
import 'package:copdb/utils/SearchBar.dart';
import 'package:flutter/material.dart';

import 'ReportDetailScreen.dart';

class FriendScreen extends StatefulWidget 
{
  const FriendScreen({Key key}) : super(key: key);
  @override
  _FriendScreen createState() => _FriendScreen();
}

class _FriendScreen extends State<FriendScreen>
{

  List<Friend> reportList = [
    Friend('first fullname', 'lastname', 'date/00', Icons.account_circle),
    Friend('first fullname', 'lastname', 'date/00', Icons.account_circle),
    Friend('first fullname', 'lastname', 'date/00', Icons.account_circle),
    Friend('first fullname', 'lastname', 'date/00', Icons.account_circle),
    Friend('first fullname', 'lastname', 'date/00', Icons.account_circle),
  ];
  ListView _getFriends()
  {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 0),
      physics: BouncingScrollPhysics(),
      itemCount: reportList.length,
      itemBuilder:(BuildContext context, int index) 
      {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => FriendProfileScreen())
            );
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 30, right: 30),
            /* width: 90, */
            height: 100,
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
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  alignment: Alignment.center,
                  /* alignment: Alignment.centerLeft, */
                  child: Icon(reportList[index].icon, size: 38),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /* Container(
                      child: Icon(reportList[index].icon, size: 38),
                    ), */
                    Container(
                      height: 25,
                      child: Text(
                        reportList[index].fname + " " + reportList[index].lname,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ),
                    Container(
                      /* width: 130, */
                      child: Text(
                        "joined " + reportList[index].date,
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      )
                    ),
                  ],
                ),
                Expanded(child: Container(),),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF54C6EB),
                  ),
                  width: 60,
                  height: 30,
                  child: Text('add'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

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
                  child: Text("Add Friends |", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                Expanded(child: Container(),),
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
            child: SearchBar(text: 'Enter friend name'),
          ),
          Expanded(child: _getFriends()),
          GestureDetector(
                onTap: () {Navigator.pop(context);},
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF54C6EB),
                  ),
                  width: 100,
                  height: 40,
                  child: Text('back', style: TextStyle(fontSize: 18),),
                ),
              ),
              Container(height: 60,),
        ]
      ),
    );
  }
}

