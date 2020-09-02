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
      body: Column(
        children: [
          Container(height: 120,),
          Container(
            width: 152,
            height: 152,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cat.jpg'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF54C6EB).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Color(0xFF54C6EB), width: 1.5),
            ),
            alignment: Alignment.center,
          ),
          Container(height: 20,),
          Container(
            child: Text(
              "hamood habibi",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(height: 10,),
          Container(
            child: Text(
              "@hamood",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70
              ),
            ),
          ),
          Container(height: 30,),
          Container(
            width: 200,
            height: 1,
            decoration: BoxDecoration(
              color: Color(0xFF54C6EB),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF54C6EB).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
          ),
          Container(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.person_add, size: 32,),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add Friends", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text('add your friends on copDB', style: TextStyle(fontSize: 12, color: Colors.white70),)
                  ],
                ),
              ),
            ],
          ),
          Container(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.share, size: 32,),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Invite Friends", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Text('invite your friends to copDB', style: TextStyle(fontSize: 12, color: Colors.white70),)
                  ],
                ),
              ),
            ],
          ),
          Container(height: 30,),
          Container(
            width: 200,
            height: 1,
            decoration: BoxDecoration(
              color: Color(0xFF54C6EB),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF54C6EB).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
          ),
        ],
      )
    );
  }
}

