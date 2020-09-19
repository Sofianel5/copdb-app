import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/UserScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/_ScreenX.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreen createState() => _EntryScreen();
}

class _EntryScreen extends State<EntryScreen> {
  TextEditingController _username = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  FocusNode usernameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  TextEditingController _password = TextEditingController();
  String focusedNode = "email";
  RootBloc bloc;

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    usernameNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<RootBloc>(context);
    _username = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return BlocListener<RootBloc, RootState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is LoginFailedState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(Localizer.of(context).get(state.globalMessage))));
        }
      },
      child: BlocBuilder<RootBloc, RootState>(
        bloc: bloc,
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(8, 11, 17, 1),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              bloc.add(LoginAttemptEvent(
                  username: _username.text, password: _password.text));
            },
            child: SingleChildScrollView(
              child: Container(
                height: h,
                child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Top(),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          Text(
                            "Hello, \nWelcome To CopDB",
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
                        FadeAnimation(
                          1,
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.transparent,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[100],
                                      ),
                                    ),
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                          color: Colors.white),
                                    ),
                                    onSubmitted: (value) {
                                      if (value != null &&
                                          value != "") {
                                        FocusScope.of(context)
                                            .requestFocus(passwordNode);
                                      }
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey[100],
                                      ),
                                    ),
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.white),
                                    ),
                                    onSubmitted: (value) {
                                      FocusScope.of(context).unfocus();
                                      setState(() {
                                        bloc.add(LoginAttemptEvent(
                                            username: _username.text,
                                            password: _password.text));
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        FadeAnimation(
                          1,
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFF54C6EB),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  bloc.add(LoginAttemptEvent(
                                      username: _username.text,
                                      password: _password.text));
                                });
                              },
                              borderRadius: BorderRadius.circular(50),
                              highlightColor: Colors.white,
                              hoverColor: Colors.white,
                              splashColor: Colors.white,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FadeAnimation(
                          1,
                          Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Color(0xFF54C6EB),
                              ),
                              color: Colors.transparent,
                            ),
                            child: InkWell(
                              onTap: () {
                                bloc.add(RequestSignup());
                              },
                              borderRadius: BorderRadius.circular(50),
                              highlightColor: Color(0xFF54C6EB),
                              hoverColor: Color(0xFF54C6EB),
                              splashColor: Color(0xFF54C6EB),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: FadeAnimation(
                            1,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  Bottom(),
                ],
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
