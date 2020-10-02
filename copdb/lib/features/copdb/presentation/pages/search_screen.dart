import 'package:cached_network_image/cached_network_image.dart';
import 'package:copdb/core/localizations/localizations.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/widgets/SearchBar.dart';
import 'package:copdb/features/copdb/presentation/widgets/cop_preview.dart';
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
    //DefaultCacheManager manager = new DefaultCacheManager();
    //manager.emptyCache();
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

  ListView _getReports(SearchFinishedState state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 0),
      physics: BouncingScrollPhysics(),
      itemCount: state.cops.length,
      itemBuilder: (BuildContext context, int index) {
        return CopPreview(
          state.cops[index],
          index: index,
          flightShuttleBuilder: _flightShuttleBuilder,
        );
      },
    );
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
                      text: "Search name or badge number.",
                    ),
                  ),
                  (state is InitialSearchState || state is SearchFailedState)
                      ? Expanded(
                          child: Container(
                            width: 350,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    child: Icon(
                                  Icons.search,
                                  size: 100,
                                )),
                                Container(
                                  width: 10,
                                ),
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
                      : Expanded(
                          child: state is NoResultsState
                              ? CouldNotFetch(text: 'Could not find cop')
                              // CouldNotFetch(text: 'FailedSearch')
                              : state is SearchLoadingState
                                  ? Center(child: Container(child: CircularProgressIndicator(), width: 50, height: 50))
                                  : _getReports(state)),
                ]),
          ),
        ),
      ),
    );
  }
}
