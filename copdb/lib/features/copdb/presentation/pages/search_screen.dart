import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/widgets/SearchBar.dart';
import 'package:copdb/features/copdb/presentation/widgets/errors/CouldNotFetchEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ReportDetailScreen.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key key,
  }) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RootBloc rootBloc;
  SearchPageBloc bloc;
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController q = TextEditingController();
  FocusNode searchFocus;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<SearchPageBloc>(context);
    rootBloc = BlocProvider.of<RootBloc>(context);
    searchFocus = FocusNode();
  }

  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  DateFormat format = DateFormat.yMMMd();
  Widget _flightShuttleBuilder(BuildContext f, Animation<double> a,
      HeroFlightDirection d, BuildContext h, BuildContext t) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(t).style,
      child: t.widget,
    );
  }

  List<CopDBComplaint> reportList = [
    CopDBComplaint(
      cop: Cop(
        firstName: 'Firstname',
        lastName: 'Lastname',
      ),
      dateRecieved: DateTime(2020, 0, 0),
      description: 'lorem iptsum ido mina foli isa moream',
    ),
    CopDBComplaint(
      cop: Cop(
        firstName: 'Firstname',
        lastName: 'Lastname',
      ),
      dateRecieved: DateTime(2020, 0, 0),
      description: 'lorem iptsum ido mina foli isa moream',
    ),
    CopDBComplaint(
      cop: Cop(
        firstName: 'Firstname',
        lastName: 'Lastname',
      ),
      dateRecieved: DateTime(2020, 0, 0),
      description: 'lorem iptsum ido mina foli isa moream',
    ),
    CopDBComplaint(
      cop: Cop(
        firstName: 'Firstname',
        lastName: 'Lastname',
      ),
      dateRecieved: DateTime(2020, 0, 0),
      description: 'lorem iptsum ido mina foli isa moream',
    ),
  ];

  ListView _getReports() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(top: 0),
        physics: BouncingScrollPhysics(),
        itemCount: reportList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportDetailScreen(
                          report: reportList[index],
                          index: index,
                        )),
              );
            },
            child: Hero(
              flightShuttleBuilder: _flightShuttleBuilder,
              tag: '$index',
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 30, right: 30),
                /* width: 90, */
                height: 160,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(8, 11, 17, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF54C6EB).withOpacity(0.5),
                      spreadRadius: .5,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  border: Border(
                    left: BorderSide.none,
                    right: BorderSide.none,
                    top: BorderSide(
                        color: Color(0xFF54C6EB).withOpacity(0.6), width: .5),
                    /*  bottom: BorderSide(color: Colors.white) */
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      alignment: Alignment.centerLeft,
                      /* alignment: Alignment.centerLeft, */
                      child: Icon(Icons.record_voice_over, size: 38),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* Container(
                        child: Icon(reportList[index].icon, size: 38),
                      ), */
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          child: Text(
                            format.format(reportList[index].dateRecieved) ?? "",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                        ),
                        Container(
                            height: 25,
                            child: Text(
                              reportList[index].cop.firstName +
                                  " " +
                                  reportList[index].cop.firstName,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                            /* alignment: Alignment.centerLeft, */
                            margin: EdgeInsets.only(bottom: 6),
                            height: 20,
                            child: Text(
                              'address',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            )),
                        Container(
                          child: Text(
                            reportList[index].abuseType ?? 'abuse',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            reportList[index].allegation ?? 'allegation',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                            /* width: 130, */
                            child: Text(
                          reportList[index].description,
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {
        if (!(state is SearchTypingState)) {
          if (searchFocus.hasFocus) {
            searchFocus.unfocus();
          }
          q = TextEditingController();
        }
        if (state is SearchFailedState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(Localizer.of(context).get(state.message))));
        }
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) => GestureDetector(
          onTap: () => searchFocus.unfocus(),
          child: Container(
            color: Color.fromRGBO(8, 11, 17, 1),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 45,
                          child: Text(
                            "Search Cops",
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
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(8, 11, 17, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF54C6EB).withOpacity(0.5),
                          spreadRadius: .5,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      border: Border(
                        left: BorderSide.none,
                        right: BorderSide.none,
                        top: BorderSide(
                            color: Color(0xFF54C6EB).withOpacity(0.6),
                            width: .5),
                        /*  bottom: BorderSide(color: Colors.white) */
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 20),
                    child: SearchBar(
                      focusNode: searchFocus,
                      onSearch: (q) => bloc.add(SearchSubmitted(q)),
                      text: "Enter cop name or badge number.",
                    ),
                  ),
                  Expanded(
                      child: state is NoResultsState
                          ? CouldNotFetch(text: 'Could not find cop')
                          : _getReports()),
                ]),
          ),
        ),
      ),
    );
  }
}
