import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

class DropSelection extends StatefulWidget
{
  @override
  _DropSelection createState() => _DropSelection();
}

class _DropSelection extends State<DropSelection>
{
  Widget build(BuildContext context)
  {
    String _value;
    return FadeAnimation(
      1,
      Container(
        width: 400,
        padding: EdgeInsets.only(left: 30, right: 30),
        child:  DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            elevation: 00,
            underline: Container(
              color: Colors.white, 
              height: 1, 
              width: 100,
            ),
            dropdownColor: Colors.transparent,
            focusColor: Colors.white,
            iconEnabledColor: Colors.white,
            iconDisabledColor: Colors.white,
            items: [
              DropdownMenuItem<String>(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('')
                ),
                value: '0',
              ),
              DropdownMenuItem<String>(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('Selection Type Item 1')
                ),
                value: '1',
              ),
              DropdownMenuItem<String>(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('Selection Type Item 2')
                ),
                value: '2',
              ),
              DropdownMenuItem<String>(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('Selection Type Item 3')
                ),
                value: '3',
              ),
              DropdownMenuItem<String>(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('Selection Type Item 4')
                ),
                value: '4',
              ),
              DropdownMenuItem<String>(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('Selection Type Item 5')
                ),
                value: '5',
              ),
            ],
            onChanged: (String value) 
            {

            },
            hint: Text('Select Item', style: TextStyle(color: Colors.white)),
            value: _value,
          ),
        ),
      ),
    );
  }
}