import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/features/copdb/data/models/complaint_model.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportDetailScreen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ComplaintItem extends StatefulWidget
{
  ComplaintModel complaint;
  int index;
  ComplaintItem({this.complaint, this.index});
  @override 
  _ComplaintItem createState() => _ComplaintItem();
}

class _ComplaintItem extends State<ComplaintItem>
{
  ComplaintModel _complaint;
  DateFormat format = DateFormat.yMMMd();
  int _index;
  bool showImage = true;

  @override
  void initState() 
  {
    super.initState();

    _complaint = widget.complaint;
    _index = widget.index;
    if (_complaint.cop.image == null)
    {
      print('null');
      showImage = false;
    }
      print('-');
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

    String _noImage()
    {
      setState(() {
        showImage = false;
      });
      print('noImage'+ ' $showImage');
      return '';
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => ReportDetailScreen(
            report: _complaint,
            )
          ),
        );
      },
      child: Hero(
        flightShuttleBuilder: _flightShuttleBuilder,
        tag: '$_index',
        child: Container(
          alignment: Alignment.center,
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
                  format.format(_complaint.dateRecieved) ?? "", 
                  style: TextStyle(
                    fontSize: 13, 
                    color: Colors.white70
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: Text(
                  "Cop: " + _complaint.cop.firstName + " " + _complaint.cop.lastName, 
                  style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 14),
                child: Text(
                  _complaint.cop?.precinct?.address?.address_1 ?? "Unknown" /* +", " + _complaint.address.state */,
                  style: TextStyle(
                    fontSize: 13, 
                    color: Colors.white70
                  ),
                ),
              ),
              Row(
                children: [
                  showImage ? Container(
                    margin: EdgeInsets.only(bottom: 14, right: 16),
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      /* image: DecorationImage(
                        image: AssetImage('assets/cat.jpg'),
                        fit: BoxFit.cover,
                      ), */
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF54C6EB).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xFF54C6EB), width: 1.5),
                    ),
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: _complaint.cop.image ?? _noImage(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ) 
                  ) : Container(height: 0, width: 0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          _complaint.abuseType, 
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 2),
                        child: Text(
                          _complaint.allegation, 
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              /* Text(_complaint.description ?? ""), */
            ],
          ),
        ),
      ),
    );
  }
}