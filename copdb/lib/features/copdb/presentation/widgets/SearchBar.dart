import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget
{
  String text;
  SearchBar({this.text});
  @override 
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar>
{
  Widget build(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white,),
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.search),
              Container(
                width: 220,
                child: TextField(
                  style: TextStyle(color: Colors.white,),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.text,
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
            width: 60,
            height: 34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFF54C6EB),
            ),
            child: Text(
              'search',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          )
      ]
    );
  }
}