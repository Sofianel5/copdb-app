import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/models/Report.dart';
import 'package:flutter/material.dart';

class ReportDetailScreen extends StatefulWidget 
{
  CopDBComplaint report;
  int index;
  ReportDetailScreen({this.report, this.index});
  @override
  _ReportDetailScreen createState() => _ReportDetailScreen();
}

class _ReportDetailScreen extends State<ReportDetailScreen>
{
  CopDBComplaint _report;
  int _index;
  bool showImage = true;
  int _age;
  String _sex;

  @override
  void initState() 
  {
    super.initState();
    _report = widget.report;
    _index = widget.index;
    _age =  _report.cop.age;
    _sex = _report.cop.sex;
    if (_report.cop.image == null)
    {
      print('null');
      showImage = false;
    }
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
                              /* image: DecorationImage(
                                image: AssetImage('assets/cat.jpg'),
                                fit: BoxFit.cover,
                              ), */
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
                            child: showImage ? CachedNetworkImage(
                              imageUrl: _report.cop.image,
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ) : Container(),
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
                                _report.dateRecieved.toString(), 
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
                                _report.cop.firstName, 
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
                                _report.cop.lastName, 
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
                                '$_age | $_sex', 
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
                        _report.description * 5, 
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
                        _report.description * 5, 
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
                        _report.description * 5, 
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

