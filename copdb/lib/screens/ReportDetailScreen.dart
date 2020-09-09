import 'package:copdb/models/Report.dart';
import 'package:flutter/material.dart';

class ReportDetailScreen extends StatefulWidget 
{
  Report report;
  int index;
  ReportDetailScreen({this.report, this.index});
  @override
  _ReportDetailScreen createState() => _ReportDetailScreen();
}

class _ReportDetailScreen extends State<ReportDetailScreen>
{
  Report _report;
  int _index;

  @override
  void initState() 
  {
    super.initState();
    _report = widget.report;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          /* alignment: Alignment.topRight, */
                          padding: EdgeInsets.only(left: 30),
                          width: 150,
                          height: 120,
                          child: Container(
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
                            height: 75,
                            width: 75,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 30),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 4),
                              child: Text(
                                _report.date, 
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
                                _report.firstname, 
                                style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 30),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(bottom: 4),
                              child: Text(
                                _report.lastname, 
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
                                _report.age + " | " + _report.sex, 
                                style: TextStyle(
                                  fontSize: 18, color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 4),
                      child: Text('Big Text Text', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 16, top: 4),
                      child: Text(
                        _report.description * 40, 
                        style: TextStyle(
                          fontSize: 16, color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 4),
                      child: Text('Big Text Text', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 16, top: 4),
                      child: Text(
                        _report.description * 40, 
                        style: TextStyle(
                          fontSize: 16, color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 4),
                      child: Text('Big Text Text', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 16, top: 4),
                      child: Text(
                        _report.description * 40, 
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

