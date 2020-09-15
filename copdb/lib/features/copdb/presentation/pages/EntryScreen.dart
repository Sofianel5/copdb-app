import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/UserScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/_ScreenX.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget 
{
  @override
  _EntryScreen createState() => _EntryScreen();
}

class _EntryScreen extends State<EntryScreen>
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
              children: <Widget>[
                FadeAnimation(
                  1,
                  Text(
                    "Hello there, \nwelcome back",
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
                FadeAnimation(
                  1,
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
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
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
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
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                FadeAnimation(
                  1,
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF54C6EB),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => ScreenX()),
                        );
                      },
                      borderRadius: BorderRadius.circular(50),
                      highlightColor: Colors.white,
                      hoverColor: Colors.white,
                      splashColor: Colors.white,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16,),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FadeAnimation(
                  1,
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Color(0xFF54C6EB),),
                      color: Colors.transparent,
                    ),
                    child: InkWell(
                      onTap: () 
                      {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => UserScreen()),
                        );
                      },
                      borderRadius: BorderRadius.circular(50),
                      highlightColor: Color(0xFF54C6EB),
                      hoverColor: Color(0xFF54C6EB),
                      splashColor: Color(0xFF54C6EB),
                        child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 16,),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: FadeAnimation(
                    1,
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Bottom(),
        ],
      ),
    );
  }
}

