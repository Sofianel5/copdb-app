import 'package:copdb/utils/Bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:copdb/utils/Top.dart';
import 'package:flutter/material.dart';
import 'package:copdb/animations/FadeAnimation.dart';

import 'DobScreen.dart';
import 'EmailScreen.dart';
import 'FirstnameScreen.dart';
import 'LastnameScreen.dart';
import 'PasswordScreen.dart';
import 'UserScreen.dart';

class Screen extends StatelessWidget
{
  final String text;
  final String inputText;
  StatefulWidget page;
  StatefulWidget alt;

  Screen({this.text, this.page, this.inputText, this.alt});

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
              children: <Widget>[
                FadeAnimation(
                  1,
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                alt ?? FadeAnimation(
                  1,
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey[100],
                            ),
                          ),
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.white,),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: inputText,
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
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
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => page),
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  splashColor: Colors.white,
                  child: Center(
                    child: Text(
                      "Next",
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
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(50),
                  highlightColor: Color(0xFF54C6EB),
                  hoverColor: Color(0xFF54C6EB),
                  splashColor: Color(0xFF54C6EB),
                  child: Center(
                    child: Text(
                      "back",
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