import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/features/copdb/domain/entities/user.dart';
import 'package:copdb/features/copdb/presentation/animations/SlideAnimation.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/FriendProfileScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/FriendScreen.dart';
import 'package:copdb/features/copdb/presentation/widgets/errors/CouldNotFetchEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  ListView _getContacts() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 5),
      physics: BouncingScrollPhysics(),
      itemCount: rootBloc.user.friends.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              SlideFromBottomPageRoute(
                  widget: FriendProfileScreen(
                  user: rootBloc.user.friends[index],
                )
              )
            );
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  child: CachedNetworkImage(
                    imageUrl: rootBloc.user.friends[index].profilePic,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
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
                          rootBloc.user.friends[index].firstName +
                              " " +
                              rootBloc.user.friends[index].lastName,
                          style:
                              TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 15,
                        child: Text(
                          rootBloc.user.friends[index].username,
                          style: TextStyle(
                              fontSize: 12, color: Colors.white70),
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF54C6EB),
                  ),
                  width: 60,
                  height: 30,
                  child: Text('add'),
                ),
              ],
            ),
          ),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {},
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) => Scaffold(
          backgroundColor: Color.fromRGBO(8, 11, 17, 1),
          body: Column(
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
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Color(0xFF54C6EB), width: 1.5),
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
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                child: Text(
                  "@"+rootBloc.user.username,
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ),
              Container(
                height: 30,
              ),
              //scrollview
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                                  'add your friends on copDB',
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
                    Row(
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
                                style:
                                    TextStyle(fontSize: 12, color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                      ],
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
                    Container(
                      child: Text(
                        'People you may know',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ),
                    Container(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      child: false
                        ? CouldNotFetch(text: 'could not load')
                        : _getContacts()
                    ),
                  ],
              )
              ),
            ],
          ),
        ),    
      ),
    );
  }
}
