import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localizations/localizations.dart';
import '../bloc/root_bloc.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({this.message}) : assert(message != null);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Text(
            Localizer.of(context).get(message) ?? message,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFFdd2c00),
            ),
          ),
          FlatButton(
            child: Text(
              Localizer.of(context).get("reload"),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () => BlocProvider.of<RootBloc>(context).add(GetExistingUserEvent()),
          ),
        ],
      ),
    );
  }
}
