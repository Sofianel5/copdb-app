import 'package:copdb/animations/SlideAnimation.dart';
import 'package:copdb/screens/ReportScreen.dart';
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
            /* height: 330, */
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text('What is an incident?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Text(
                  'An incident is when a cop has mishandled their power and has not followed proper protocol. ', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Container(height: 20, ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    'What are some examples of an incident?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                ),
                Text(
                  '- using unjust force', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  '- assaulting normal civilians', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  '- sexually assaulting someone', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  '- racially profiling someone', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  '- planting fake evidence ', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  '- improper vehicle use ', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  '- etc ', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Container(height: 20, ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text('Where do reports go?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Text(
                  'reports go into our database which is accesible by anyone. The report will hopefully be used to hold the cop accountable ', 
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
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
            /* height: 330, */
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text('Your Reports', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                Container(
                  child: Text('You currently have not made any reports', style: TextStyle(fontSize: 16, color: Colors.white70),),
                ),
                Container(height: 30,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SlideFromBottomPageRoute(widget: ReportScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 140,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xFF54C6EB),
                    ),
                    child: Text(
                      'create report',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
              ]
            ),
          ),
          Expanded(child: Container(),),
        ]
      ),
    );
  }
}

