import 'package:cubit_notes/input_page.dart';
import 'package:cubit_notes/list_cubit.dart';
import 'package:cubit_notes/list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<listCubit,listState>(builder: (_,state){
        return ListView.builder(
            itemCount: state.mData.length,
            itemBuilder: (_,index){
          return ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>inputPage(index: index, nTitle: state.mData[index]["title"], nDesc: state.mData[index]["desc"])));
            },
            onLongPress:(){
              context.read<listCubit>().removeValue(index: index);
            },
            title: Text(state.mData[index]["title"]),
            subtitle: Text(state.mData[index]["desc"]),
          );
        });
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>inputPage(index: -1, nTitle: "", nDesc: "")));
      },
      child: Icon(Icons.add),
      ),
    );
  }
}