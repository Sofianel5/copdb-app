import 'package:copdb/animations/SlideAnimation.dart';
import 'package:copdb/models/Report.dart';
import 'package:copdb/models/ReportPreview.dart';
import 'package:copdb/screens/ReportDetailScreen.dart';
import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

import 'ReportScreenPages/BadgeScreen.dart';

class IncidentScreen extends StatefulWidget 
{
  const IncidentScreen({Key key}) : super(key: key);
  @override
  _IncidentScreen createState() => _IncidentScreen();
}

class _IncidentScreen extends State<IncidentScreen>
{
  Widget _flightShuttleBuilder(BuildContext f, Animation<double> a, HeroFlightDirection d, BuildContext h, BuildContext t) 
    {
      return DefaultTextStyle(
        style: DefaultTextStyle.of(t).style,
        child: t.widget,
      );
    }
  //mock data ; pull from db instead
  bool hasMadeReport = true;
  List<ReportPreview> reportList = [
    ReportPreview('first fullname', 'lastname', Icons.smoking_rooms, 'date/00', 'lorem iptsum ido mina foli isa noream '),
    ReportPreview('first fullname', 'lastname', Icons.record_voice_over, 'date/00', 'lorem iptsum ido mina foli isa noream '),
/*     ReportPreview('first fullname', 'lastname', Icons.record_voice_over, 'date/00', 'lorem iptsum ido mina foli isa noream '),
    ReportPreview('first fullname', 'lastname', Icons.wc, 'date/00', 'lorem iptsum ido mina foli isa noream '), */
  ];
  ListView _getReports()
  {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(top: 5),
      physics: BouncingScrollPhysics(),
      itemCount: reportList.length,
      itemBuilder:(BuildContext context, int index) 
      {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => ReportDetailScreen(
                report: Report('', '', '', '', '', '', '', '', null), 
                index: index,)
              ),
            );
          },
          child: Hero(
            flightShuttleBuilder: _flightShuttleBuilder,
            tag: '$index',
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 16),
              /* width: 90, */
              width: 140,
              height: 50,
              decoration: BoxDecoration(
                /* border: Border(
                  left: BorderSide(color: Colors.white),
                ) */
              ),
              child: /* Row(
                children: [ */
                  /* Container(
                    margin: EdgeInsets.only(right: 8),
                    alignment: Alignment.topLeft,
                    /* alignment: Alignment.centerLeft, */
                    child: Icon(reportList[index].icon, size: 38),
                  ), */
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Icon(reportList[index].icon, size: 38),
                      ),
                      Container(
                        height: 25,
                        child: Text(
                          reportList[index].firstname,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ),
                      /* Container(
                        /* alignment: Alignment.centerLeft, */
                        height: 20,
                        child: Text(
                          reportList[index].date,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        )
                      ), */
                      Container(
                        /* width: 130, */
                        child: Text(
                          reportList[index].abuse,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        )
                      ),
                    ],
                  ),
                /* ],
              ), */
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, SlideFromBottomPageRoute(widget: BadgeScreen()));
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
      ), */
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
                hasMadeReport ? 
                Container(
                  height: 120,
                  /* height: 240, */
                  width: 500,
                  child: _getReports(),
                )
                : 
                Container(
                  child: Text('You currently have not made any reports', style: TextStyle(fontSize: 16, color: Colors.white70),),
                ),
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 20),
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text('Add to the public database', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SlideFromBottomPageRoute(widget: BadgeScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF54C6EB),
                    ),
                    child: Text(
                      'create report',
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container(),),
        ]
      ),
    );
  }
}

