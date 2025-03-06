import 'package:cubit_notes/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listCubit extends Cubit<listState>{
  listCubit(): super(listState(mData: []));

  ///Events

  void addValue(Map<String,dynamic>value){
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
  }

}