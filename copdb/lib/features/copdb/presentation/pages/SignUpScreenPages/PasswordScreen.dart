import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/AvatarScreen.dart';
import 'package:flutter/material.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreen createState() => _PasswordScreen();
}

class _PasswordScreen extends State<PasswordScreen> {
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _textController;
  RootBloc bloc;
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: "");
    bloc = BlocProvider.of<RootBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocListener(
        bloc: bloc,
        listener: (context, state) {
          print(state);
          if (state is SignupPasswordFailure) {
            _key.currentState.showSnackBar(SnackBar(
                  content: Text(Localizer.of(context).get(state.message))));
          }
        },
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
                            'Create a strong \npassword',
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
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ),
                              child: TextField(
                                obscureText: true,
                                autocorrect: false,
                                controller: _textController,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'password',
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                onSubmitted: (str) {
                                  FocusScope.of(context).unfocus();
                                  bloc.add(PasswordPageSubmitted(str));
                                },
                              ),
                            ),
                          ),
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
                            FocusScope.of(context).unfocus();
                                  bloc.add(PasswordPageSubmitted(_textController.text));
                          },
                          borderRadius: BorderRadius.circular(50),
                          highlightColor: Colors.white,
                          hoverColor: Colors.white,
                          splashColor: Colors.white,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: state is SignupPasswordLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                "Next",
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
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(50),
                          highlightColor: Color(0xFF54C6EB),
                          hoverColor: Color(0xFF54C6EB),
                          splashColor: Color(0xFF54C6EB),
                          child: Center(
                            child: Text(
                              "Back",
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
      ),
    );
  }
}
