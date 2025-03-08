import 'package:cubit_notes/helper/db_helper.dart';
import 'package:cubit_notes/screen/input_page.dart';
import 'package:cubit_notes/list/list_cubit.dart';
import 'package:cubit_notes/list/list_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listHomePage extends StatefulWidget {
  @override
  State<listHomePage> createState() => _listHomePageState();
}

class _listHomePageState extends State<listHomePage> {
  int flag = 1;
  @override
  void initState() {
    super.initState();
    context.read<listCubit>().getInitialNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    flag = 1;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: flag != 1 ? Colors.white : Colors.black12,
                        boxShadow: [
                          BoxShadow(spreadRadius: 0.5, color: Colors.grey)
                        ]),
                    child: Center(
                        child: Text(
                      "All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: flag != 1 ? Colors.black : Colors.white),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    flag = 2;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: flag != 2 ? Colors.white : Colors.black12,
                        boxShadow: [
                          BoxShadow(spreadRadius: 0.5, color: Colors.grey)
                        ]),
                    child: Center(
                        child: Text(
                      "Pending",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: flag != 2 ? Colors.black : Colors.white,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    flag = 3;
                    setState(() {});
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: flag != 3 ? Colors.white : Colors.black12,
                        boxShadow: [
                          BoxShadow(spreadRadius: 0.5, color: Colors.grey)
                        ]),
                    child: Center(
                        child: Text(
                      "Completed",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: flag != 3 ? Colors.black : Colors.white),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            BlocBuilder<listCubit, listState>(builder: (_, state) {
              return Container(
                height: 775,
                //color: Colors.blueGrey,
                child: ListView.builder(
                    //itemCount: state.mData.length,
                    itemCount: state.mNotes.length,
                    itemBuilder: (_, index) {
                      return flag != 1
                          ? (flag != 2
                              ? (!state.mNotes[index].isCompleted
                                  ? /*Center(
                          child: Text(
                            "No Completed Todo's yet!!!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ))*/Container()
                                  : ListTile(
                                      onTap: () {
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>inputPage(index: index, nTitle: state.mData[index]["title"], nDesc: state.mData[index]["desc"])));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => inputPage(
                                                    index: state
                                                        .mNotes[index].nID!,
                                                    nTitle: state
                                                        .mNotes[index].nTitle,
                                                    nDesc: state
                                                        .mNotes[index].nDesc)));
                                      },
                                      onLongPress: () {
                                        //context.read<listCubit>().removeValue(index: index);
                                        context.read<listCubit>().deleteTodo(
                                            id: state.mNotes[index].nID);
                                      },
                                      leading: Checkbox(
                                          value:
                                              state.mNotes[index].isCompleted,
                                          onChanged: (value) {
                                            context
                                                .read<listCubit>()
                                                .updateIsComplete(
                                                    Id: state
                                                        .mNotes[index].nID!,
                                                    isComplete: value ?? false);
                                          }),
                                      title: Text(state.mNotes[index].nTitle),
                                      subtitle: Text(state.mNotes[index].nDesc),
                                    ))
                              : state.mNotes[index].isCompleted
                                  ? Container()
                                  : ListTile(
                                      onTap: () {
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>inputPage(index: index, nTitle: state.mData[index]["title"], nDesc: state.mData[index]["desc"])));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => inputPage(
                                                    index: state
                                                        .mNotes[index].nID!,
                                                    nTitle: state
                                                        .mNotes[index].nTitle,
                                                    nDesc: state
                                                        .mNotes[index].nDesc)));
                                      },
                                      onLongPress: () {
                                        //context.read<listCubit>().removeValue(index: index);
                                        context.read<listCubit>().deleteTodo(
                                            id: state.mNotes[index].nID);
                                      },
                                      leading: Checkbox(
                                          value:
                                              state.mNotes[index].isCompleted,
                                          onChanged: (value) {
                                            context
                                                .read<listCubit>()
                                                .updateIsComplete(
                                                    Id: state
                                                        .mNotes[index].nID!,
                                                    isComplete: value ?? false);
                                          }),
                                      title: Text(state.mNotes[index].nTitle),
                                      subtitle: Text(state.mNotes[index].nDesc),
                                    ))
                          : ListTile(
                              onTap: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>inputPage(index: index, nTitle: state.mData[index]["title"], nDesc: state.mData[index]["desc"])));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => inputPage(
                                            index: state.mNotes[index].nID!,
                                            nTitle: state.mNotes[index].nTitle,
                                            nDesc: state.mNotes[index].nDesc)));
                              },
                              onLongPress: () {
                                //context.read<listCubit>().removeValue(index: index);
                                context
                                    .read<listCubit>()
                                    .deleteTodo(id: state.mNotes[index].nID);
                              },
                              leading: Checkbox(
                                  value: state.mNotes[index].isCompleted,
                                  onChanged: (value) {
                                    context.read<listCubit>().updateIsComplete(
                                        Id: state.mNotes[index].nID!,
                                        isComplete: value ?? false);
                                  }),
                              title: Text(state.mNotes[index].nTitle),
                              subtitle: Text(state.mNotes[index].nDesc),
                            );
                    }),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      inputPage(index: -1, nTitle: "", nDesc: "")));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
