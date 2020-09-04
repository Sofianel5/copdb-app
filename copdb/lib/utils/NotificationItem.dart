import 'package:copdb/models/Notification.dart' as nf;
import 'package:flutter/material.dart';

class NotificationItem extends StatefulWidget
{
  nf.Notification notification;
  NotificationItem({this.notification});
  @override 
  _NotificationItem createState() => _NotificationItem();
}

class _NotificationItem extends State<NotificationItem>
{
  nf.Notification _notification;

  @override
  void initState() 
  {
    super.initState();
    _notification = widget.notification;
  }

  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Text(
              _notification.date + "  •  " + _notification.location,
              style: TextStyle(
                fontSize: 13, 
                color: Colors.white70
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 2),
            child: Text(
              _notification.title, 
              style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold
              ),
            ),
          ),
          Text(_notification.description),
        ],
      ),
    );
  }
}