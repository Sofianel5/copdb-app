import 'package:copdb/features/copdb/domain/entities/notification.dart' as n;
import 'package:flutter/material.dart';

class NotificationItem extends StatefulWidget
{
  n.Notification notification;
  NotificationItem({this.notification});
  @override 
  _NotificationItem createState() => _NotificationItem();
}

class _NotificationItem extends State<NotificationItem>
{
  n.Notification _notification;

  @override
  void initState() 
  {
    super.initState();
    _notification = widget.notification;
  }

  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
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
              _notification.sentAt.toString(),
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
          Text(_notification.body),
        ],
      ),
    );
  }
}