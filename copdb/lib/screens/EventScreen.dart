import 'package:copdb/models/Event.dart';
import 'package:copdb/utils/EventItem.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget 
{
  Event event;
  int index;
  EventScreen({this.event, this.index});
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<EventScreen>
{
  Event _event;
  int _index;

  @override
  void initState() 
  {
    super.initState();
    _event = widget.event;
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Hero(
        tag: '$_index',
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 70,),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 4),
                      child: Text(
                        _event.date, 
                        style: TextStyle(
                          fontSize: 18, color: Colors.white70,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 4),
                      child: Text(
                        _event.title, 
                        style: TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        _event.location, 
                        style: TextStyle(
                          fontSize: 18, color: Colors.white70,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 8),
                        child: Container(
                        height: 260,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: _event.imageLocation,
                            fit: BoxFit.cover,
                          ),
                          color: Color.fromRGBO(8, 11, 17, 1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: 220,
                      height: 35,
                      /* color: Colors.white, */
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_left, size: 35,),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.radio_button_checked, size: 18),
                                Icon(Icons.radio_button_unchecked, size: 18),
                                Icon(Icons.radio_button_unchecked, size: 18),
                                Icon(Icons.radio_button_unchecked, size: 18),
                                Icon(Icons.radio_button_unchecked, size: 18),
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_right, size: 35),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        _event.description * 4, 
                        style: TextStyle(
                          fontSize: 16, color: Colors.white,
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
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
        ),
      ),
    );
  }
}

