import 'package:copdb/features/copdb/presentation/pages/home_screen.dart';
import 'package:copdb/features/copdb/presentation/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localizations/messages.dart';
import '../bloc/root_bloc.dart';
import 'error.dart';
import 'splash.dart';
import "EntryScreen.dart";

class RootPage extends StatefulWidget with WidgetsBindingObserver {
  RootPage({Key key}) : super(key: key);
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RootBloc, RootState>(
        builder: (context, state) {
          print(state);
          if (state is InitialState) {
            return SplashScreen();
          } else if (state is UnauthenticatedState) {
            return EntryScreen();
          } else if (state is AuthenticatedState) {
            return BlocProvider(
              create: (context) => BlocProvider.of<RootBloc>(context).homeBloc,
              child: HomeScreen(),
            );
          } else if (state is ErrorState) {
            return ErrorScreen(message: state.message);
          } else {
            return ErrorScreen(message: Messages.UNKNOWN_ERROR);
          }
        },
      ),
    );
  }
}
