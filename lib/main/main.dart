import 'package:cubit_notes/counter/cubit_handler.dart';
import 'package:cubit_notes/helper/db_helper.dart';
import 'package:cubit_notes/screen/counter_home_page.dart';
import 'package:cubit_notes/list/list_cubit.dart';
import 'package:cubit_notes/screen/list_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(  BlocProvider(create: (context)=> listCubit(DbHelper: dbHelper.getIns()),
    child: MyApp(),));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: listHomePage()
    );
  }
}
