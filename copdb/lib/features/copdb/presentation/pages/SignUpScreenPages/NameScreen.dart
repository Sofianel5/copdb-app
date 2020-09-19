import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/presentation/animations/FadeAnimation.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/SignUpScreenPages/DobScreen.dart';
import 'package:copdb/features/copdb/presentation/widgets/DoubleInput.dart';
import 'package:flutter/material.dart';
import 'package:copdb/features/copdb/presentation/widgets/Bottom.dart';
import 'package:copdb/features/copdb/presentation/widgets/top.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  RootBloc bloc;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: "");
    _lastNameController = TextEditingController(text: "");
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
          if (state is SignupNameFailure) {
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
                            'Enter your first and \nlast name',
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
                        DoubleInput(
                          firstController: _firstNameController,
                          secondController: _lastNameController,    
                          firstInputText: 'First name',
                          secondInputText: 'Last name',
                          firstFocus: firstNameNode,
                          secondFocus: lastNameNode,
                          first: (fname) {
                             FocusScope.of(context).requestFocus(lastNameNode);
                          },
                          second: (lname) {
                            FocusScope.of(context).unfocus();
                            bloc.add(NamePageSubmitted(_firstNameController.text, _lastNameController.text));
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DobScreen()),
                            );
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
                              "back",
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
    /* Screen(
      text: 'Enter your first and \nlast name',
      page: DobScreen(),
      alt: DoubleInput(
        firstInputText: 'first name', 
        secondInputText: 'second name',
        fname: (fname) {
          //whenever firstname is inputed
        },
        lname: (lname) {
          //whenever lastname is inputed
        },
      ),
      onSubmit: (s) {
        //whenever submit button is pressed
      },
    ); */
  }
}
