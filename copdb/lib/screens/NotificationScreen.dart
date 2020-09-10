import 'package:copdb/Errors/CouldNotFetchEvents.dart';
import 'package:copdb/utils/NavBar.dart';
import 'package:copdb/utils/NotificationItem.dart';
import 'package:copdb/models/Notification.dart' as nf;
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget 
{
  const NotificationScreen({Key key}) : super(key: key);
  @override
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen>
{
  List<nf.Notification> notificationList = [
    nf.Notification('notification title', 'notification date', 'notification location', 'notification description'),
    nf.Notification('notification title', 'notification date', 'notification location', 'notification description'),
    nf.Notification('notification title', 'notification date', 'notification location', 'notification description'),
    nf.Notification('notification title', 'notification date', 'notification location', 'notification description'),
    nf.Notification('notification title', 'notification date', 'notification location', 'notification description'),
    nf.Notification('notification title', 'notification date', 'notification location', 'notification description'),
  ];

  ListView _getNotifications()
  {
    return ListView.builder(
      padding: EdgeInsets.only(top: 5),
      physics: BouncingScrollPhysics(),
      itemCount: notificationList.length,
      itemBuilder:(BuildContext context, int index) 
      {
        return NotificationItem(notification: notificationList[index]);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Text("Notifications |", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ),
              Expanded(child: Container(),),
            ],
          ),
        ),
        Container(height: 10, ),
        Expanded(
            child: false ? CouldNotFetch(text: 'No notifcations found') : _getNotifications(),
          ),
      ],
    );
  }
}

