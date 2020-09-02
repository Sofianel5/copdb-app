import 'package:copdb/models/Event.dart';
import 'package:copdb/screens/ProfileScreen.dart';
import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  List<Event> events;
  
  ListView _getEvents() 
  {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder:(BuildContext ctxt, int index) 
      {
        return new Container();
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 90,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "State",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Icon(Icons.arrow_drop_down),
                ]
              ),
            ),
          ),
          Expanded(
            child: Container()
          ),
        ],
      ),
    );
  }
}

