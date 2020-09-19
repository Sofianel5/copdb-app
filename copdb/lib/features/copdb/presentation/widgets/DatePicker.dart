import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void StringCallback(DateTime d);
class DatePicker extends StatefulWidget
{
  final StringCallback onDateChanged;
  DatePicker({ @required this.onDateChanged});
  @override
  _DatePicker createState() => _DatePicker();
}

class _DatePicker extends State<DatePicker>
{
  final DateTime _maxDate = DateTime.now();
  final DateTime _initialDate = DateTime.now().subtract(Duration(days: 18 * 365));
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
                  maximumDate: _maxDate,
                  initialDateTime: _initialDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (dateTime) {widget.onDateChanged(dateTime);},
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