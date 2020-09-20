import 'package:copdb/features/copdb/domain/entities/address.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/domain/entities/copdbevent.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/widgets/EventItem.dart';
import 'package:copdb/features/copdb/presentation/widgets/errors/CouldNotFetchEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  RootBloc rootBloc;
  LandingPageBloc bloc;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<LandingPageBloc>(context);
    rootBloc = BlocProvider.of<RootBloc>(context);
  }

  ListView _getEvents(LoadedLandingState state) {
    return ListView.builder(
        padding: EdgeInsets.only(top: 5),
        physics: BouncingScrollPhysics(),
        itemCount: state.events.length,
        itemBuilder: (BuildContext context, int index) {
          return EventItem(copDBEvent: state.events[index], index: index);
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        "Nearby Events",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 170,
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 45,
                                child: Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
              Expanded(
                child: state is LoadingLandingState
                    ? Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(),
                      )
                    : state is LoadingFailedState
                        ? CouldNotFetch(text: 'Could not fetch events')
                        : _getEvents(state),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
