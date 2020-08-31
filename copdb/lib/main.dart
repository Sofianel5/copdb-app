import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'screens/SignUpScreen.dart';
import 'screens/HomeScreen.dart';

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
  
  @override
  void initState() 
  {
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
      debugShowCheckedModeBanner: false,
      home: seen ? HomeScreen() : SignUpScreen(),
    );
  } 
}
