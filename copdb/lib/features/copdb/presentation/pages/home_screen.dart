import 'package:copdb/features/copdb/presentation/bloc/root_bloc.dart';
import 'package:copdb/features/copdb/presentation/pages/search_screen.dart';
import 'package:copdb/features/copdb/presentation/pages/browse_page.dart';
import 'package:copdb/features/copdb/presentation/pages/IncidentScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/NotificationScreen.dart';
import 'package:copdb/features/copdb/presentation/pages/ProfileScreen.dart';
import 'package:copdb/features/copdb/presentation/widgets/NavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItem = 0;

  RootBloc rootBloc;
  HomePageBloc bloc;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<HomePageBloc>(context);
    rootBloc = BlocProvider.of<RootBloc>(context);
  }

  final List<Widget> pages = [
    BlocProvider(
      create: (context) => LandingPageBloc(
        getFeed: BlocProvider.of<RootBloc>(context).getFeed,
        user: BlocProvider.of<RootBloc>(context).user,
      ),
      child: BrowsePage(
        key: PageStorageKey('BrowsePage'),
      ),
    ),
    BlocProvider(
      create: (context) => SearchPageBloc(
        BlocProvider.of<RootBloc>(context).getCops,
        BlocProvider.of<RootBloc>(context).user,
      ),
      child: SearchScreen(
        key: PageStorageKey('SearchScreen'),
      ),
    ),
    IncidentScreen(key: PageStorageKey('IncidentScreen')),
    NotificationScreen(key: PageStorageKey('NotificationScreen')),
    BlocProvider(
      create: (context) => ProfilePageBloc(
        user: BlocProvider.of<RootBloc>(context).user,
        uploadContacts: BlocProvider.of<RootBloc>(context).uploadContacts,
        uploadPermission: BlocProvider.of<RootBloc>(context).uploadPermission,
      ),
      child: ProfileScreen(key: PageStorageKey('ProfileScreen')),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (context, state) {},
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color.fromRGBO(8, 11, 17, 1),
          bottomNavigationBar: NavBar(
            onChange: (val) {
              setState(() {
                _selectedItem = val;
              });
            },
          ),
          body: PageStorage(
            bucket: bucket,
            child: pages[_selectedItem],
          ),
        ),
      ),
    );
  }
}
