import 'package:copdb/models/Event.dart';
import 'package:copdb/screens/EventScreen.dart';
import 'package:flutter/material.dart';

class EventItem extends StatefulWidget
{
  Event event;
  int index;
  EventItem({this.event, this.index});
  @override 
  _EventItem createState() => _EventItem();
}

class _EventItem extends State<EventItem>
{
  Event _event;
  int _index;

  @override
  void initState() 
  {
    super.initState();
    _event = widget.event;
    _index = widget.index;
  }

  Widget build(BuildContext context)
  {

    Widget _flightShuttleBuilder(BuildContext f, Animation<double> a, HeroFlightDirection d, BuildContext h, BuildContext t) 
    {
      return DefaultTextStyle(
        style: DefaultTextStyle.of(t).style,
        child: t.widget,
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen(event: _event, index: _index,)),);
      },
      child: Hero(
        flightShuttleBuilder: _flightShuttleBuilder,
        tag: '$_index',
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
          decoration: BoxDecoration(
            color: Color.fromRGBO(8, 11, 17, 1),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF54C6EB).withOpacity(0.5),
                spreadRadius: .5,
                blurRadius: 7,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
            border: Border(
              left: BorderSide.none, 
              right: BorderSide.none, 
              top: BorderSide(color: Color(0xFF54C6EB).withOpacity(0.6), width: .5),
              /*  bottom: BorderSide(color: Colors.white) */
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text(
                  _event.date,
                  style: TextStyle(
                    fontSize: 13, 
                    color: Colors.white70
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: Text(
                  _event.title, 
                  style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 14),
                child: Text(
                  _event.location,
                  style: TextStyle(
                    fontSize: 13, 
                    color: Colors.white70
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 14),
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _event.imageLocation,
                    fit: BoxFit.cover,
                  ),
                  color: Color.fromRGBO(8, 11, 17, 1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, )
                ),
              ),
              Text(_event.description),
            ],
          ),
        ),
      ),
    );
  }
}