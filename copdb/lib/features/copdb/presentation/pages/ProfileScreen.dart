import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/features/copdb/domain/entities/user.dart';
import 'package:copdb/features/copdb/presentation/animations/SlideAnimation.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/FriendProfileScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/FriendScreen.dart';
import 'package:copdb/features/copdb/presentation/widgets/ContactWidget.dart';
import 'package:copdb/features/copdb/presentation/widgets/errors/CouldNotFetchEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  RootBloc rootBloc;
  ProfilePageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ProfilePageBloc>(context);
    rootBloc = BlocProvider.of<RootBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        print(state);
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) => SingleChildScrollView(
          child: Container(
              color: Color.fromRGBO(8, 11, 17, 1),
              child: Column(
                children: [
                  Container(
                    height: 45,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 35,
                  ),
                  Container(
                    width: 152,
                    height: 152,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: rootBloc.user.profilePic,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageBuilder: (context, imageProvider) => Container(
                        width: 152.0,
                        height: 152.0,
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
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
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
                  ),
                  Container(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      rootBloc.user.firstName + " " + rootBloc.user.lastName,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (rootBloc.user.verified)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.check_circle, color: Color(0xFF54C6EB)),
                        ),
                      Container(
                        child: Text(
                          "@" + rootBloc.user.username,
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                  ),
                  //scrollview
                  /* SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child:  */ /* Column(
                    children: [ */
                  Container(
                    width: 300,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Color(0xFF54C6EB),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF54C6EB).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                  Container(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          SlideFromBottomPageRoute(widget: FriendScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.person_add,
                            size: 32,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add Friends",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Add your friends on copDB',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share('Download CopDB!');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.share,
                            size: 32,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Invite Friends",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'invite your friends to copDB',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Color(0xFF54C6EB),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF54C6EB).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                  Container(
                    height: 30,
                  ),
                  if (state is LoadedProfileState)
                    Container(
                        child: Text(
                      'People you may know',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                  Container(
                    height: 10,
                  ),
                  if (state is LoadedProfileState)
                    for (var contact in state.contacts
                        .where((element) =>
                            element.getPrimaryContactInfo() != null)
                        .toList())
                      ContactWidget(contact)
                  else
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        /* height: 500, */
                        width: 300,
                        child: CouldNotFetch(text: 'Could not load contacts'),
                      ),
                    ),
                ],
              )
              /* ), */
              /* ],
            ), */
              ),
        ),
      ),
    );
  }
}
