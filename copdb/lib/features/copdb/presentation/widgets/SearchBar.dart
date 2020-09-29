import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  String text;
  Function onSearch;
  FocusNode focusNode;
  SearchBar({this.text, this.onSearch, this.focusNode});
  @override
  _SearchBar createState() => _SearchBar();
}

class _SearchBar extends State<SearchBar> {
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width*0.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.65,
                  child: TextField(
                    focusNode: widget.focusNode,
                    onSubmitted: (value) => widget.onSearch(value),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white,),
                      border: InputBorder.none,
                      hintText: widget.text,
                      hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(width: 10),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.27,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFF54C6EB),
              ),
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ]);
  }
}
