import 'dart:ui';
import 'package:copdb/features/copdb/presentation/pages/HomeScreen.dart';
import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:copdb/features/copdb/presentation/widgets/ImageSelection.dart';
import 'package:flutter/material.dart';


class AvatarScreen extends StatefulWidget 
{
  @override
  _AvatarScreen createState() => _AvatarScreen();
}

class _AvatarScreen extends State<AvatarScreen>
{
  final _textController = TextEditingController();
  @override
  void dispose() 
  {
    _textController.dispose();
    super.dispose();
  }

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
                    'select a profile \npicture',
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
                ImageSelection(
                  onFileAdd: (image) 
                  {
                    // on image add from gallery
                    // image is a File class
                  },
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
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  splashColor: Colors.white,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {

                      },
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

