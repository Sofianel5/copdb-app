import 'package:flutter/material.dart';

class CouldNotFetch extends StatefulWidget
{
  String text;
  CouldNotFetch({this.text});
  @override 
  _CouldNotFetch createState() => _CouldNotFetch();
}

class _CouldNotFetch extends State<CouldNotFetch>
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning),
            Container(width: 10),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}