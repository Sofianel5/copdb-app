import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/copdb/presentation/bloc/root_bloc.dart';
import 'injection_container.dart' as ic;
import 'routes/routes.gr.dart' as routes;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  runApp(CopDB());
} 

class CopDB extends StatefulWidget 
{
  @override
  _CopDBState createState() => new _CopDBState();
}

class _CopDBState extends State<CopDB>
{
  Color grey = Color.fromRGBO(8, 11, 17, 1);

  @override
  void initState() 
  {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: grey,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light, 
    ));
    super.initState();
  }


  Widget build(BuildContext context) 
  { 
    return BlocProvider(
      create: (context) => ic.sl<RootBloc>(),
        child: MaterialApp(
          title: 'CopDB',
        color: grey, 
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator<routes.Router>(router: routes.Router()),
      ),
    );
  } 
}
