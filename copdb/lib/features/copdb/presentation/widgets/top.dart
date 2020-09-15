import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

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