import 'package:copdb/features/copdb/presentation/pages/DatabaseScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/HomeScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/IncidentScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/NotificationScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ProfileScreen.dart';
import 'package:copdb/features/copdb/presentation/widgets/NavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenX extends StatefulWidget 
{
  const ScreenX({Key key}) : super(key: key);
  @override
  _ScreenX createState() => _ScreenX();
}

class _ScreenX extends State<ScreenX>
{
  int _selectedItem = 0;
  final List<Widget> pages = [
    HomeScreen(key: PageStorageKey('HomeScreen')),
    DatabaseScreen(key: PageStorageKey('DatabaseScreen')),
    IncidentScreen(key: PageStorageKey('IncidentScreen')),
    NotificationScreen(key: PageStorageKey('NotificationScreen')),
    ProfileScreen(key: PageStorageKey('ProfileScreen')),
  ];


  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      bottomNavigationBar: NavBar(
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
      ),
      body: PageStorage(
        bucket: bucket, 
        child: pages[_selectedItem],
      )
    );
  }
}

