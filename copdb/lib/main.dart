import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'features/copdb/presentation/pages/EntryScreen.dart';
import 'features/copdb/presentation/pages/HomeScreen.dart';

void main() => runApp(App());

class App extends StatefulWidget 
{
  @override
  _App createState() => new _App();
}

class _App extends State<App>
{
  Color grey = Color.fromRGBO(8, 11, 17, 1);
  bool _seen;
  bool _splash = true;

  Future<bool> _playSplash() async 
  {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    return true;
  }
  
  Container _getSplash()
  {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(8, 11, 17, 1),
      child: Shimmer.fromColors(
        period: Duration(milliseconds: 1000),
        baseColor: Color(0xFF54C6EB),
        highlightColor: Color(0xFFffffff),
        child: Text(
          "copDB",
          style: TextStyle(
            fontSize: 90.0,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  @override
  void initState() 
  {
    _playSplash().then(
      (status) {
        setState(() {
          _splash = false;
        });
      }
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: grey,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light, 
    ));
    _checkFirstTime();
    super.initState();
  }

  _checkFirstTime() async 
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    setState( () 
    {
      _seen = (prefs.getBool('seen') ?? false);
    });
  }  

  _updateFirstTime() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();  
    bool signedUp = false;
    if (signedUp)
    {
      _seen = true;
      prefs.setBool('seen', true);
    }
  }

  Widget build(BuildContext context) 
  {
    if (_seen == null) return Container();
    if (_seen == false) {_updateFirstTime();}

    bool seen = _seen;  
    return MaterialApp(
      color: Color.fromRGBO(8, 11, 17, 1), 
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: _splash ? _getSplash() : (seen ? HomeScreen() : EntryScreen()),
    );
  } 
}
