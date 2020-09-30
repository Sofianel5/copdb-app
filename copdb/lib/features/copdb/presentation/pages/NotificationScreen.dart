import 'package:copdb/features/copdb/presentation/widgets/NotificationItem.dart';
import 'package:copdb/features/copdb/presentation/widgets/errors/CouldNotFetchEvents.dart';
import 'package:copdb/features/copdb/domain/entities/notification.dart' as n;
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget 
{
  const NotificationScreen({Key key}) : super(key: key);
  @override
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen>
{
  List<n.Notification> notificationList = [
    n.Notification(title: 'notification title', sentAt: DateTime(2020, 0, 0), body: 'notification location'),
    n.Notification(title: 'notification title', sentAt: DateTime(2020, 0, 0), body: 'notification location'),
    n.Notification(title: 'notification title', sentAt: DateTime(2020, 0, 0), body: 'notification location'),
    n.Notification(title: 'notification title', sentAt: DateTime(2020, 0, 0), body: 'notification location'),
    n.Notification(title: 'notification title', sentAt: DateTime(2020, 0, 0), body: 'notification location'),
    n.Notification(title: 'notification title', sentAt: DateTime(2020, 0, 0), body: 'notification location'),
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
                child: Text("Notifications", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
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

