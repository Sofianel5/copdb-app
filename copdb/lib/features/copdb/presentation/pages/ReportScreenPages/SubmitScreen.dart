import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/pages/_ScreenX.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitScreen extends StatefulWidget 
{
  @override
  _SubmitScreen createState() => _SubmitScreen();
}

class _SubmitScreen extends State<SubmitScreen>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Top(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(height: 80,),
                FadeAnimation(
                  1,
                  Text(
                    'Submition Policy',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(height: 4,),
                FadeAnimation(
                  1,
                  Text(
                    "by clicking submit you agree that\nyour information is honest and true.\nInaccurate or dishonest reports\ncan be used against you.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(height: 40,),
              ],
            ),
          ),
          FadeAnimation(
            1,
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 120,
                height: 50,
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF54C6EB),
                ),
                child: InkWell(
                  onTap: () 
                  {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>
                      ScreenX()), 
                      (Route<dynamic> route) => false
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  splashColor: Colors.white,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FadeAnimation(
            1,
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 120,
                height: 50,
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  /* color: Color(0xFF54C6EB), */
                  border: Border.all(color: Color(0xFF54C6EB),),
                  color: Colors.transparent,
                ),
                child: InkWell(
                  onTap: () 
                  {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) =>
                      ScreenX()), 
                      (Route<dynamic> route) => false
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  highlightColor: Color(0xFF54C6EB),
                  hoverColor: Color(0xFF54C6EB),
                  splashColor: Color(0xFF54C6EB),
                  child: Center(
                    child: Text(
                      "exit",
                      style: TextStyle(color: Colors.white,fontSize: 16,),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Bottom(),
        ]
      ),
    );
  }
}