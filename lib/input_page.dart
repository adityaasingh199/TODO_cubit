import 'package:cubit_notes/cubit_handler.dart';
import 'package:cubit_notes/list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class inputPage extends StatefulWidget {
  String nTitle;
  String nDesc;
  int index;

  inputPage({required this.index, required this.nTitle, required this.nDesc});

  @override
  State<inputPage> createState() => inputPageState();
}

class inputPageState extends State<inputPage> {

  TextEditingController nTitleController = TextEditingController();
  TextEditingController nDescController = TextEditingController();


  bool checker = false;
  bool checker2 = false;
  void trigger() {
    checker = nTitleController.text.isEmpty;
    setState(() {});
  }

  void trigger2() {
    checker2 = nDescController.text.isEmpty;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    nTitleController.text = widget.nTitle;
    nDescController.text = widget.nDesc;
  }


  @override
  Widget build(BuildContext context) {
    print("rebuild");


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nTitleController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    label: Text('Title',style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize:16,color: checker ? Colors.red : Colors.grey)),
                    hintText: "Enter Title here",
                    errorText: checker ? "Please Enter the value" : null,
                    errorStyle: TextStyle(color: Colors.red),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: checker ? Colors.red : Colors.blueGrey,
                            width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: checker ? Colors.red : Colors.grey,
                            width: 1.5))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: nDescController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    label: Text('Description',style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize:16,color: checker2 ? Colors.red : Colors.grey)),
                    hintText: "Enter Description here",
                    errorText: checker2 ? "Please Enter the value" : null,
                    errorStyle: TextStyle(color: Colors.red),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: checker2 ? Colors.red : Colors.blueGrey,
                            width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: checker2 ? Colors.red : Colors.grey,
                            width: 1.5))),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {

                    if(nTitleController.text.isEmpty){
                      trigger();
                    }else{
                      trigger();
                      checker=false;
                    }
                    if(nDescController.text.isEmpty){
                      trigger2();
                      print("is empty");
                    }else{
                      trigger2();
                      checker2=false;
                    }
                    if (nTitleController.text.isNotEmpty &&
                        nDescController.text.isNotEmpty) {
                      if (widget.index == -1) {
                        context.read<listCubit>().addValue({
                          "title" : nTitleController.text,
                          "desc" : nDescController.text
                        });
                        Navigator.pop(context);
                      } else {
                        context.read<listCubit>().udateValue(index:widget.index, ntitle: nTitleController.text, ndesc: nDescController.text);
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
