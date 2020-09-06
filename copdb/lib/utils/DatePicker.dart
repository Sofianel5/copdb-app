import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:copdb/animations/FadeAnimation.dart';

class DatePicker extends StatefulWidget
{
  final StringCallback onDateChanged;
  final StringCallback onTimeChanged;
  DatePicker({ @required this.onDateChanged, this.onTimeChanged});
  @override
  _DatePicker createState() => _DatePicker();
}

typedef void StringCallback(String s);
class _DatePicker extends State<DatePicker>
{
  final DateTime _dateTime = DateTime.now();
  //init callback
  
  Widget build(BuildContext context)
  {
    double h = MediaQuery.of(context).size.height;

    return FadeAnimation(
      1,
      Container(
        height: 140,
        decoration: new BoxDecoration(
          color: Colors.transparent,
          borderRadius: new BorderRadius.all(const Radius.circular(32),)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Divider(
              height: .8,
              color: Colors.white,
              thickness: 2.4,
              indent: 32,
              endIndent: 32,
            ),
            SizedBox(
              height: h * .1,
              width: 300,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                child: CupertinoDatePicker(
                  //backgroundColor: Color(0xFFFFFFF0),
                  initialDateTime: _dateTime,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (dateTime) {widget.onDateChanged(dateTime.toString().split(" ")[0]);},
                ),
              ),
            ),
            Divider(
              color: Color(0xFFFFFFFF),
              thickness: 2.4,
              indent: 32,
              endIndent: 32,
            ),
          ],
        ),
      ),
    );
  }
}