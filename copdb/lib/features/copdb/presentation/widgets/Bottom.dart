import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

class Bottom extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Expanded(
      child: Container(
        height: 200,
        alignment: Alignment.bottomCenter,
        child: FadeAnimation(
          1,
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/bottom.png')
              ),
            ),
          ),
        ),
      ),
    );
  }
}