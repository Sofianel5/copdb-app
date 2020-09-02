import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget
{
  @override 
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar>
{
  Widget build(BuildContext context)
  {
    return Container(
      height: 40,
      width: 260,
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
            width: 200,
            child: TextField(
              style: TextStyle(color: Colors.white,),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search..",
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}