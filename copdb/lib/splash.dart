import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Splash extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Container(
      alignment: Alignment.center,
      color: Color.fromRGBO(8, 11, 17, 1),
      child: Shimmer.fromColors(
        period: Duration(milliseconds: 1000),
        baseColor: Color(0xFF54C6EB),
        highlightColor: Color(0xFFffffff),
        child: Text(
          "copDB",
          style: TextStyle(
            fontSize: 90.0,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}