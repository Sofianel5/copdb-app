import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/PasswordScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/_Screen.dart';
import 'package:copdb/features/copdb/presentation/widgets/DatePicker.dart';
import 'package:flutter/material.dart';
import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DobScreen extends StatefulWidget {
  @override
  _DobScreen createState() => _DobScreen();
}

class _DobScreen extends State<DobScreen> {
  DateTime selectedDate;
  RootBloc bloc;
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
      listener: (context, state) {
        print(state);
        if (state is SignupDOBFailure) {
          _key.currentState.showSnackBar(SnackBar(
                  content: Text(Localizer.of(context).get(state.message))));
        }
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
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
                            'Enter your date \nof birth',
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
                        DatePicker(
                          onDateChanged: (date) {
                            selectedDate = date;
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
                            bloc.add(DOBPageSubmitted(selectedDate));
                          },
                          borderRadius: BorderRadius.circular(50),
                          highlightColor: Colors.white,
                          hoverColor: Colors.white,
                          splashColor: Colors.white,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
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
