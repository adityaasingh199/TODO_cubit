import 'package:cubit_notes/counter/cubit_handler.dart';
import 'package:cubit_notes/counter/state_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: BlocBuilder<cubitHandler, stateCubit>(builder: (ctx,state){
  return Center(child: Text("${state.count}",style: TextStyle(fontSize: 40),));
},),

      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 50,
            child: FloatingActionButton(onPressed: (){
              context.read<cubitHandler>().decrement();
            },child: Icon(Icons.horizontal_rule_outlined),),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(onPressed: (){
              context.read<cubitHandler>().increment();
            },child: Icon(Icons.add),),
          ),
        ],
      ),
    );
  }
}