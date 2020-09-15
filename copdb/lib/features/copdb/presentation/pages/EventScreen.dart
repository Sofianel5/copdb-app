import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/features/copdb/domain/entities/copdbevent.dart';
import 'package:copdb/models/Event.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget 
{
  CopDBEvent copDBEvent;
  Event event;
  int index;
  EventScreen({this.event, this.copDBEvent, this.index});
  @override
  _EventScreen createState() => _EventScreen();
}

class _EventScreen extends State<EventScreen>
{
  CopDBEvent _copDBEvent;
  Event _event;
  int _index;
  bool showImage = true;

  @override
  void initState() 
  {
    super.initState();
    _event = widget.event;
    _copDBEvent = widget.copDBEvent;
    _index = widget.index;
    if (_copDBEvent.complaint.image == null)
    {
      print('null');
      showImage = false;
    }
      print('iit');
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
                        _copDBEvent.complaint.dateRecieved.toString(), 
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
                        _copDBEvent.complaint.allegation, 
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
                        _copDBEvent.complaint.address.state + ", " + _copDBEvent.complaint.address.city, 
                        style: TextStyle(
                          fontSize: 18, color: Colors.white70,
                        ),
                      ),
                    ),
                    showImage ? Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 20),
                        child: Container(
                        height: 220,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(8, 11, 17, 1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, )
                        ),
                        child: CachedNetworkImage(
                          imageUrl: _copDBEvent.complaint.image,
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ) : Container(),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(bottom: 16),
                      child: Text(
                        _copDBEvent.complaint.description, 
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

