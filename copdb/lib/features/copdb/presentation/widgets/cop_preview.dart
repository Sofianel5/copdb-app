import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/presentation/pages/ReportDetailScreen.dart';
import 'package:flutter/material.dart';

class CopPreview extends StatelessWidget {
  Cop cop;
  Widget Function(BuildContext, Animation<double>, HeroFlightDirection, BuildContext, BuildContext) flightShuttleBuilder;
  int index;
  CopPreview(this.cop, {this.flightShuttleBuilder, this.index});
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReportDetailScreen(
                    report: CopDBComplaint(cop: cop),
                  ),
                ),
              );
            },
            child: Hero(
              flightShuttleBuilder: flightShuttleBuilder,
              tag: '$index',
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 30, right: 30),
                /* width: 90, */
                height: 175,
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
                    top: BorderSide(
                        color: Color(0xFF54C6EB).withOpacity(0.6), width: .5),
                    /*  bottom: BorderSide(color: Colors.white) */
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 85,
                      margin: EdgeInsets.only(right: 16),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 75,
                        height: 75,
                        child: cop.hasImage() ? CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: cop.getImage(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          imageBuilder: (context, imageProvider) => Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF54C6EB).withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: Color(0xFF54C6EB), width: 1.5),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                        ) : Icon(Icons.local_police),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF54C6EB).withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(100),
                          border:
                              Border.all(color: Color(0xFF54C6EB), width: 1.5),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 25,
                            child: Text(
                              cop.firstName +
                                  " " +
                                  cop.lastName,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        if (cop.badgeNumber != null)
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Badge Number: " + cop.badgeNumber.toString(),
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        Container(
                          width: 220,
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(                 
                            cop?.precinct?.name ??
                                'Unknown precinct',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          /* alignment: Alignment.centerLeft, */
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text('Sex: ' + cop.sex,
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Container(
                          /* alignment: Alignment.centerLeft, */
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                              'Age: ' +
                                  (cop?.age?.toString() ??
                                      "Unknown"),
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                        Container(
                          /* alignment: Alignment.centerLeft, */
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                              'Ethnicity: ' +
                                  (cop?.ethnicity ?? "Unknown"),
                              style: TextStyle(
                                fontSize: 16,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
  
}