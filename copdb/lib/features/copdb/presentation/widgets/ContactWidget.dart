import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/features/copdb/domain/entities/contact.dart';
import 'package:copdb/features/copdb/presentation/animations/SlideAnimation.dart';
import 'package:copdb/features/copdb/presentation/pages/FriendProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatefulWidget {
  final Contact contact;
  ContactWidget(this.contact);

  @override
  _ContactWidgetState createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.contact.referencedUser != null)
          Navigator.push(
            context,
            SlideFromBottomPageRoute(
              widget: FriendProfileScreen(
                user: widget.contact.referencedUser,
              ),
            ),
          );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                child: widget.contact.referencedUser != null
                    ? CachedNetworkImage(
                        width: 42,
                        height: 42,
                        imageUrl: widget.contact.referencedUser.profilePic,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 42.0,
                          height: 42.0,
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
                            borderRadius: BorderRadius.circular(21),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      )
                    : widget.contact.avatarBase64 == null
                        ? widget.contact.avatar == null
                            ? Icon(Icons.face)
                            : CachedNetworkImage(
                                width: 42,
                                height: 42,
                                imageUrl: widget.contact.avatar,
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 42.0,
                                  height: 42.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xFF54C6EB).withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(21),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              )
                        : Image.memory(
                            base64.decode(widget.contact.avatarBase64),
                            fit: BoxFit.cover,
                            width: 42,
                            height: 42,
                            frameBuilder: (context, child, n, b) => Container(
                              width: 42.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF54C6EB).withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(21),
                                image: DecorationImage(
                                    image: MemoryImage(base64
                                        .decode(widget.contact.avatarBase64)),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                decoration: BoxDecoration(
                  /* image: DecorationImage(
                            image: CachedNetworkImage('assets/cat.jpg'),
                            fit: BoxFit.cover,
                        ), */
                  boxShadow: [
                    /* BoxShadow(
                          color: Color(0xFF54C6EB).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ), */
                  ],
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Color(0xFF54C6EB), width: 1.5),
                ),
                alignment: Alignment.center,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 25,
                        child: Text(
                          widget.contact.displayName ?? "Unknown",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )),
                    if (widget.contact.getPrimaryContactInfo() != null)
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 15,
                        child: Text(
                          widget.contact.getPrimaryContactInfo(),
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.contact.referencedUser == null) {
                    if (widget.contact.primaryContactType() == "phone") {
                      String phone = widget.contact
                          .getPrimaryContactInfo()
                          .replaceAll("(", "")
                          .replaceAll(")", "")
                          .replaceAll(" ", "")
                          .replaceAll("-", "");
                      String uri;
                      if (Platform.isAndroid) {
                        uri = 'sms:$phone?body=Download%20CopDB!';
                      } else {
                        uri = 'sms:$phone&body=Download%20CopDB!';
                      }
                      launch(uri);
                    } else if (widget.contact.primaryContactType() == "email") {
                      String email = widget.contact.getPrimaryContactInfo();
                      final Uri _emailLaunchUri =
                          Uri(scheme: 'mailto', path: email, queryParameters: {
                        'subject': 'Download CopDB!',
                        'body': 'Download CopDB!',
                      });
                      launch(_emailLaunchUri.toString());
                    }
                  } else {
                    Navigator.push(
                      context,
                      SlideFromBottomPageRoute(
                        widget: FriendProfileScreen(
                          user: widget.contact.referencedUser,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF54C6EB),
                  ),
                  width: 60,
                  height: 30,
                  child: Text(
                      widget.contact.referencedUser != null ? "Add" : "Invite"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
