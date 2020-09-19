import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

typedef void StringCallback(String s);

class DoubleInput extends StatefulWidget {
  @override
  String firstText;
  String secondText;
  String firstInputText;
  String secondInputText;
  StringCallback fname;
  StringCallback lname;
  TextEditingController lnameController;
  TextEditingController fnameController;

  DoubleInput({
    this.firstInputText,
    this.firstText,
    this.secondInputText,
    this.secondText,
    this.fname,
    this.lname,
    this.lnameController,
    this.fnameController,
  });
  _DoubleInput createState() => _DoubleInput();
}

class _DoubleInput extends State<DoubleInput> {
  @override
  void dispose() {
    widget.lnameController.dispose();
    widget.lnameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return FadeAnimation(
      1,
      Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(
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
                      controller: widget.fnameController,
                      onSubmitted: (value) {
                        widget.lname(widget.fnameController.text);
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.firstInputText,
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              FadeAnimation(
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
                      controller: widget.lnameController,
                      onSubmitted: (value) {
                        widget.lname(widget.lnameController.text);
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.secondInputText,
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
