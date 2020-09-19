import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void StringCallback(String s);
class Screen extends StatefulWidget
{
  final String text;
  final String inputText;
  final Function onNext;
  final StringCallback onSubmit;
  StatefulWidget page;
  StatefulWidget alt;

  Screen({this.text, this.page, this.inputText, this.alt, this.onNext, this.onSubmit});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

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
                    widget.text,
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
                widget.alt ?? FadeAnimation(
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
                          controller: _textController,
                          style: TextStyle(color: Colors.white,),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.inputText,
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
                      MaterialPageRoute(builder: (context) => widget.page),
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  splashColor: Colors.white,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {widget.onSubmit(_textController.text);},
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
                      "Back",
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