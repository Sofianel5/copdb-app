import 'package:copdb/Errors/CouldNotFetchEvents.dart';
import 'package:copdb/features/copdb/domain/entities/address.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/domain/entities/copdbevent.dart';
import 'package:copdb/models/Event.dart';
import 'package:copdb/screens/ProfileScreen.dart';
import 'package:copdb/utils/EventItem.dart';
import 'package:copdb/utils/NavBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  List<CopDBEvent> eventList = [
    CopDBEvent(
      complaint: CopDBComplaint(
        image: 'assets/stock-1.jpg',
        allegation: 'allegation title',
        dateRecieved: DateTime(2020, 10, 31),
        description: 'lorem iptsum' * 10,
        address: Address(city: 'city', state: 'state')
      ),
      numPromotions: 0,
      numSharers: 0,
      title: 'Fake Title',
    ),
    CopDBEvent(
      complaint: CopDBComplaint(
        image: null,
        allegation: 'allegation title',
        dateRecieved: DateTime(2020, 10, 31),
        description: 'lorem iptsum' * 10,
        address: Address(city: 'city', state: 'state')
      ),
      numPromotions: 0,
      numSharers: 0,
      title: 'Fake Title',
    ),
    CopDBEvent(
      complaint: CopDBComplaint(
        image: 'assets/stock-3.jpg',
        allegation: 'allegation title',
        dateRecieved: DateTime(2020, 10, 31),
        description: 'lorem iptsum' * 10,
        address: Address(city: 'city', state: 'state')
      ),
      numPromotions: 0,
      numSharers: 0,
      title: 'Fake Title',
    ),
  ];
  
  ListView _getEvents() 
  {
    return ListView.builder(
      padding: EdgeInsets.only(top: 5),
      physics: BouncingScrollPhysics(),
      itemCount: eventList.length,
      itemBuilder:(BuildContext context, int index) 
      {
        return EventItem(copDBEvent: eventList[index], index: index);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 11, 17, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 45,),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  child: Text("Nearby Events |", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
                Expanded(child: Container(),),
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 170,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 45,
                            child: Text("Elongated City Name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 10, ),
          Expanded(
            child: false ? CouldNotFetch(text: 'Could not fetch events') : _getEvents(),
          ),
        ],
      ),
    );
  }
}

