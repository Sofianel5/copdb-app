import 'package:copdb/Errors/CouldNotFetchEvents.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/models/Report.dart';
import 'package:copdb/models/ReportPreview.dart';
import 'package:copdb/utils/NavBar.dart';
import 'package:copdb/utils/SearchBar.dart';
import 'package:flutter/material.dart';

import 'ReportDetailScreen.dart';

class DatabaseScreen extends StatefulWidget 
{
  CopDBComplaint copDBComplaint;
  DatabaseScreen({Key key, this.copDBComplaint}) : super(key: key);
  @override
  _DatabaseScreen createState() => _DatabaseScreen();
}

class _DatabaseScreen extends State<DatabaseScreen>
{

  Widget _flightShuttleBuilder(BuildContext f, Animation<double> a, HeroFlightDirection d, BuildContext h, BuildContext t) 
  {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(t).style,
      child: t.widget,
    );
  }

  List<ReportPreview> reportList = [
    ReportPreview('first fullname', 'lastname', Icons.smoking_rooms, 'date/00', 'lorem iptsum ido mina foli isa noream '),
    ReportPreview('first fullname', 'lastname', Icons.record_voice_over, 'date/00', 'lorem iptsum ido mina foli isa noream '),
    ReportPreview('first fullname', 'lastname', Icons.record_voice_over, 'date/00', 'lorem iptsum ido mina foli isa noream '),
    ReportPreview('first fullname', 'lastname', Icons.wc, 'date/00', 'lorem iptsum ido mina foli isa noream '),
  ];
  
  ListView _getReports()
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
              MaterialPageRoute(builder: (context) => ReportDetailScreen(
                report: Report('first name', 'last name', 'age', 'sex', 'allegation', 'date/00', 'location', 'text', null), 
                index: index,)
              ),
            );
          },
          child: Hero(
            flightShuttleBuilder: _flightShuttleBuilder,
            tag: '$index',
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
                    alignment: Alignment.centerLeft,
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
                          reportList[index].firstname,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ),
                      Container(
                        /* alignment: Alignment.centerLeft, */
                        height: 20,
                        child: Text(
                          reportList[index].date,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        )
                      ),
                      Container(
                        /* width: 130, */
                        child: Text(
                          reportList[index].abuse,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        )
                      ),
                    ],
                  ),
                ],
              ),
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
            child: SearchBar(text: "Enter cop name or id #",),
          ),
          Expanded(child: false ? CouldNotFetch(text: 'Could not find cop') :_getReports()),
        ]
      ),
    );
  }
}

