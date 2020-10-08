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
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: MediaQuery.of(context).size.width*0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.transparent,
          ),
          child: 
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 10,),
                Icon(Icons.search),
                Container(width: 10,),
                Expanded(child:
                  Container(
                    padding: EdgeInsets.only(bottom: 4),
                    alignment: Alignment.topCenter,
                    width: 100,
                    height: 40,
                    child: TextField(
                      controller: _controller,
                      focusNode: widget.focusNode,
                      onSubmitted: (value) => widget.onSearch(value),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        /* icon: Icon(Icons.search, color: Colors.white,), */
                        border: InputBorder.none,
                        hintText: widget.text,
                        hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Container(width: 10)
,              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.onSearch(_controller.text);
            },
            child: Container(
              alignment: Alignment.center,
              width: 70,
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
          ),
        ]);
  }
}
