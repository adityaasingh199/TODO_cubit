import 'package:cubit_notes/cubit_handler.dart';
import 'package:cubit_notes/home_page.dart';
import 'package:cubit_notes/list_cubit.dart';
import 'package:cubit_notes/list_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(  BlocProvider(create: (context)=> listCubit(),
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
