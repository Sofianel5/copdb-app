import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'features/copdb/presentation/pages/EntryScreen.dart';
import 'features/copdb/presentation/pages/HomeScreen.dart';
import 'features/copdb/presentation/pages/root.dart';

void main() => runApp(App());

class App extends StatefulWidget 
{
  @override
  _App createState() => new _App();
}

class _App extends State<App>
{
  Color grey = Color.fromRGBO(8, 11, 17, 1);

  @override
  void initState() 
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: grey,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light, 
    ));
    super.initState();
  }


  Widget build(BuildContext context) 
  { 
    return MaterialApp(
      color: Color.fromRGBO(8, 11, 17, 1), 
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  } 
}
