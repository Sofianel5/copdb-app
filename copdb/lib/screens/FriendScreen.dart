import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/Errors/CouldNotFetchEvents.dart';
import 'package:copdb/features/copdb/domain/entities/user.dart';
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

  List<User> friendList = [
    User(
        profilePic: '',
        firstName: 'deez',
        lastName: 'nutz',
        username: '@deeznutz',
        dateJoined: DateTime(2020, 0, 0),
      ),
      User(
        profilePic: '',
        firstName: 'pog',
        lastName: 'champ',
        username: '@pogchamp',
        dateJoined: DateTime(2020, 0, 0),
      ),
      User(
        profilePic: '',
        firstName: 'nice',
        lastName: 'atball',
        username: '@boolin',
        dateJoined: DateTime(2020, 0, 0),
      ),
      User(
        profilePic: '',
        firstName: 'hi',
        lastName: 'hey',
        username: '@hello',
        dateJoined: DateTime(2020, 0, 0),
      ),
      User(
        profilePic: '',
        firstName: 'big',
        lastName: 'chungus',
        username: '@bigchungus',
        dateJoined: DateTime(2020, 0, 0),
      ),
  ];
  ListView _getFriends()
  {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 0),
      physics: BouncingScrollPhysics(),
      itemCount: friendList.length,
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
                  margin: EdgeInsets.only(right: 16),
                  width: 42,
                  height: 42,
                  child: CachedNetworkImage(
                    imageUrl: friendList[index].profilePic,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  decoration: BoxDecoration(
                    /* image: DecorationImage(
                      image: AssetImage('assets/cat.jpg'),
                      fit: BoxFit.cover,
                    ), */
                    boxShadow: [
                      /* BoxShadow(
                        color: Color(0xFF54C6EB).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 0), // changes position of shadow
                      ), */
                    ],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Color(0xFF54C6EB), width: 1.5),
                  ),
                  alignment: Alignment.center,
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
                        friendList[index].firstName + " " + friendList[index].lastName,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    ),
                    Container(
                      /* width: 130, */
                      child: Text(
                        "joined " + friendList[index].dateJoined.toString(),
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
          Expanded(child: false ? CouldNotFetch(text: 'could not find specified person'): _getFriends()),
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

