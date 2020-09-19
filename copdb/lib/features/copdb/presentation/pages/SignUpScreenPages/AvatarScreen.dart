import 'dart:io';
import 'dart:ui';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/HomeScreen.dart';
import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:copdb/features/copdb/presentation/widgets/ImageSelection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarScreen extends StatefulWidget {
  @override
  _AvatarScreen createState() => _AvatarScreen();
}

class _AvatarScreen extends State<AvatarScreen> {
  RootBloc bloc;
  File selectedPicture;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<RootBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {},
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) => Scaffold(
          key: _key,
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(8, 11, 17, 1),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Top(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                        1,
                        Text(
                          'Select a profile \npicture',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ImageSelection(
                        onFileAdd: (image) {
                          selectedPicture = image;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
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
                        onTap: () {
                          bloc.add(ProfilePicturePageSubmitted(picture: selectedPicture));
                        },
                        borderRadius: BorderRadius.circular(50),
                        highlightColor: Colors.white,
                        hoverColor: Colors.white,
                        splashColor: Colors.white,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              bloc.add(ProfilePicturePageSubmitted(
                                  picture: selectedPicture));
                            },
                            child: state is SignupProfilePictureLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Finalize",
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
                ),
                SizedBox(
                  height: 10,
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
                        /* color: Color(0xFF54C6EB), */
                        border: Border.all(
                          color: Color(0xFF54C6EB),
                        ),
                        color: Colors.transparent,
                      ),
                      child: InkWell(
                        onTap: () {
                          bloc.add(SignUpComplete());
                        },
                        borderRadius: BorderRadius.circular(50),
                        highlightColor: Color(0xFF54C6EB),
                        hoverColor: Color(0xFF54C6EB),
                        splashColor: Color(0xFF54C6EB),
                        child: Center(
                          child: Text(
                            "Skip",
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
              ]),
        ),
      ),
    );
  }
}
