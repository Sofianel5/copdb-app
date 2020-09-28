import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/domain/entities/address.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/domain/entities/precinct.dart';
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

  List<Cop> reportList = [
    Cop(
      firstName: 'firstname',
      lastName: 'lastname',
      sex: 'sex',
      ethnicity: 'ethnicity',
      age: 0,
      badgeNumber: 'badgenumber',
      precinct: Precinct(
        name: 'precinct name',
        image: '',
        address: Address(
          address_1: 'addy 1',
          address_2: 'addy 2',
          city: 'city',
          state: 'state',
        ),
      ),
      image: '',
      description: 'lorem iptsum ido mina foli isa moream',
    ),
    Cop(
      firstName: 'firstname',
      lastName: 'lastname',
      sex: 'sex',
      ethnicity: 'ethnicity',
      age: 0,
      badgeNumber: 'badgenumber',
      precinct: Precinct(
        name: 'precinct name',
        image: '',
        address: Address(
          address_1: 'addy 1',
          address_2: 'addy 2',
          city: 'city',
          state: 'state',
        ),
      ),
      image: '',
      description: 'lorem iptsum ido mina foli isa moream',
    ),
    Cop(
      firstName: 'firstname',
      lastName: 'lastname',
      sex: 'sex',
      ethnicity: 'ethnicity',
      age: 0,
      badgeNumber: 'badgenumber',
      precinct: Precinct(
        name: 'precinct name',
        image: '',
        address: Address(
          address_1: 'addy 1',
          address_2: 'addy 2',
          city: 'city',
          state: 'state',
        ),
      ),
      image: '',
      description: 'lorem iptsum ido mina foli isa moream',
    ),
    Cop(
      firstName: 'firstname',
      lastName: 'lastname',
      sex: 'sex',
      ethnicity: 'ethnicity',
      age: 0,
      badgeNumber: 'badgenumber',
      precinct: Precinct(
        name: 'precinct name',
        image: '',
        address: Address(
          address_1: 'addy 1',
          address_2: 'addy 2',
          city: 'city',
          state: 'state',
        ),
      ),
      image: '',
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
                    report: CopDBComplaint(cop: reportList[index]),
                    index: index,
                  ),
                ),
              );
            },
            child: Hero(
              flightShuttleBuilder: _flightShuttleBuilder,
              tag: '$index',
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 30, right: 30),
                /* width: 90, */
                height: 175,
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
                      width: 85,
                      margin: EdgeInsets.only(right: 16),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 75,
                        height: 75,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: reportList[index].image,
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          imageBuilder: (context, imageProvider) => Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF54C6EB).withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
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
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 25,
                          child: Text(
                            reportList[index].firstName +
                            " " +
                            reportList[index].lastName,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            reportList[index].badgeNumber ?? 'badgenumber',
                            style: TextStyle(
                              fontSize: 19,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Container(
                          /* alignment: Alignment.centerLeft, */
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'sex: ' + reportList[index].sex,
                            style: TextStyle(
                                fontSize: 16,
                              )
                          ),
                        ),
                        Container(
                          /* alignment: Alignment.centerLeft, */
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'age: ' + reportList[index].age.toString(),
                            style: TextStyle(
                                fontSize: 16,
                              )
                          ),
                        ),
                        Container(
                          /* alignment: Alignment.centerLeft, */
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'ethnicity: ' + reportList[index].ethnicity,
                            style: TextStyle(
                                fontSize: 16,
                              )
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 2),
                          child: Text(
                            reportList[index].precinct.name ?? 'precinct',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
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
                  false ? Expanded(
                    child: Container(
                      width: 350,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(child: Icon(Icons.search, size: 100,)),
                          Container(width: 10,),
                          Text(
                            'Search for a\ncop name \nor badge #',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : 
                  Expanded(
                    child: state is NoResultsState
                      ? CouldNotFetch(text: 'Could not find cop')
                        // CouldNotFetch(text: 'FailedSearch')
                      : _getReports()
                  ),
                ]
              ),
          ),
        ),
      ),
    );
  }
}
