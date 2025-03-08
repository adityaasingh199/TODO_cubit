import 'package:cubit_notes/helper/db_helper.dart';
import 'package:cubit_notes/list/list_state.dart';
import 'package:cubit_notes/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listCubit extends Cubit<listState>{
  dbHelper DbHelper;
  listCubit({required this.DbHelper}): super(listState(mNotes: []));

  ///Events

  void addNotes(noteModel newModel)async{
    bool check = await DbHelper.addNote(newModel: newModel);
    if(check){
      List<noteModel>allNotes = await DbHelper.fetchAllNotes();
      emit(listState(mNotes: allNotes));
    }
  }

  void getInitialNotes()async{
    List<noteModel>allNotes = await DbHelper.fetchAllNotes();
    emit(listState(mNotes: allNotes));
  }

  void updateIsComplete({required Id,required isComplete})async{
    bool check = await DbHelper.updateIsCompleted(nId: Id, isComplete: isComplete);
    if(check){
      List<noteModel>allNotes = await DbHelper.fetchAllNotes();
      emit(listState(mNotes: allNotes));
    }
  }

  void updateTodo({required id,required title,required desc})async{
    bool check = await DbHelper.updateTodo(nId: id, nTitle: title, nDesc: desc);
    if(check){
      List<noteModel>allNotes = await DbHelper.fetchAllNotes();
      emit(listState(mNotes: allNotes));
    }
  }

  void deleteTodo({required id})async{
    bool check = await DbHelper.deleteTodo(nId: id);
    if(check){
      List<noteModel>allNotes = await DbHelper.fetchAllNotes();
      emit(listState(mNotes: allNotes));
    }
  }




///List notes Events
 /* void addValue(Map<String,dynamic>value){
    List<Map<String,dynamic>> currentStateValue = state.mData;
    currentStateValue.add(value);

    emit(listState(mData: currentStateValue));
  }
  void udateValue({required int index,required String ntitle,required String ndesc}){
    List<Map<String,dynamic>> currentStateValue = state.mData;
    currentStateValue[index]={"title":ntitle,"desc":ndesc};

    emit(listState(mData: currentStateValue));
  }
  void removeValue({required index}){
    List<Map<String,dynamic>> currentStateValue = state.mData;
    currentStateValue.removeAt(index);

    emit(listState(mData: currentStateValue));
  }*/

}