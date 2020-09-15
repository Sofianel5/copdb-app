import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter/material.dart';

class ConnectionError extends StatefulWidget
{
  @override 
  _ConnectionError createState() => _ConnectionError();
}

class _ConnectionError extends State<ConnectionError>
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Top(),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeAnimation(
                  1,
                  Icon(Icons.signal_cellular_connected_no_internet_4_bar, size: 52,),
                ),
                Container(width: 10,),
                FadeAnimation(
                  1,
                  Text(
                    'No Internet\nconnection!',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FadeAnimation(
            1,
            Container(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 120,
                height: 50,
                margin: EdgeInsets.only(left: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF54C6EB),
                ),
                child: InkWell(
                  onTap: () 
                  {

                  },
                  borderRadius: BorderRadius.circular(50),
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  splashColor: Colors.white,
                  child: Center(
                    child: Text(
                      "Retry",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Bottom(),
        ]
      ),
    );
  }
}