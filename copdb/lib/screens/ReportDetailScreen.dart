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
                        _report.location, 
                        style: TextStyle(
                          fontSize: 18, color: Colors.white70,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        _report.description * 4, 
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

