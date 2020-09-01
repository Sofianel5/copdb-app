import 'package:flutter/material.dart';
import 'package:copdb/animations/FadeAnimation.dart';

class Top extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: FadeAnimation(
            1,
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/top.png')
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}