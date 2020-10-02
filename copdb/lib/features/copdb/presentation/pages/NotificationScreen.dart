import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/widgets/NotificationItem.dart';
import 'package:copdb/features/copdb/presentation/widgets/errors/CouldNotFetchEvents.dart';
import 'package:copdb/features/copdb/domain/entities/notification.dart' as n;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatefulWidget 
{
  const NotificationScreen({Key key}) : super(key: key);
  @override
  _NotificationScreen createState() => _NotificationScreen();
}

class _NotificationScreen extends State<NotificationScreen>
{
  RootBloc rootBloc;
  NotificationsPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NotificationsPageBloc>(context);
    rootBloc = BlocProvider.of<RootBloc>(context);
  }

  ListView _getNotifications(LoadedNotificationsState state)
  {
    return ListView.builder(
      padding: EdgeInsets.only(top: 5),
      physics: BouncingScrollPhysics(),
      itemCount: state.notifications.length,
      itemBuilder:(BuildContext context, int index) 
      {
        return NotificationItem(notification: state.notifications[index]);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        print(state);
        if (state is FailedNotificationsState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(Localizer.of(context).get(state.message))));
        }
      },
          child: BlocBuilder(
        bloc: bloc,
            builder: (context, state) => Column(
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
            SizedBox(height: 10, ),
            state is NotificationsLoadingState ? Center(child: Container(child: CircularProgressIndicator(), width: 50, height: 50)) :
            Expanded(
                child: (state is LoadedNotificationsState && state.notifications.length > 0) ? _getNotifications(state) :CouldNotFetch(text: 'No notifcations found') ,
              ),
          ],
        ),
      ),
    );
  }
}

