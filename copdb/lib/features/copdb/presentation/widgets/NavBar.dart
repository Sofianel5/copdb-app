import 'package:flutter/material.dart';


class NavBar extends StatefulWidget 
{
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.priority_high,
    Icons.notifications,
    Icons.person,
  ];
  NavBar({this.defaultSelectedIndex = 0, iconList, @required this.onChange});

  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() 
  {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) 
    {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        children: _navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 70,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(width: 4, color: Color(0xFF54C6EB),),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xFF54C6EB).withOpacity(0.015),
                  Color(0xFF54C6EB).withOpacity(0.3),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Color(0xFF54C6EB) : Colors.white,
        ),
      ),
    );
  }
}