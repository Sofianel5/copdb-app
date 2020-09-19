import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

typedef void StringCallback(String s);

class DoubleInput extends StatefulWidget {
  String firstInputText;
  String secondInputText;
  StringCallback first;
  StringCallback second;
  TextEditingController firstController;
  TextEditingController secondController;
  FocusNode firstFocus;
  FocusNode secondFocus;

  DoubleInput({
    @required this.firstInputText,
    @required this.secondInputText,
    @required this.first,
    @required this.second,
    @required this.firstController,
    @required this.secondController,
    @required this.firstFocus,
    @required this.secondFocus
  });
  _DoubleInput createState() => _DoubleInput();
}

class _DoubleInput extends State<DoubleInput> {
  @override
  void dispose() {
    widget.firstController.dispose();
    widget.secondController.dispose();
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
                      focusNode: widget.firstFocus,
                      controller: widget.firstController,
                      onSubmitted: (value) {
                        widget.first(widget.firstController.text);
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
                      focusNode: widget.secondFocus,
                      controller: widget.secondController,
                      onSubmitted: (value) {
                        widget.second(widget.secondController.text);
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
