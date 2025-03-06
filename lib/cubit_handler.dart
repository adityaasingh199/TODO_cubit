import 'package:cubit_notes/state_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cubitHandler extends Cubit<stateCubit>{
  cubitHandler() : super(stateCubit(count: 0));

  ///Event
  void increment(){
    emit(stateCubit(count: state.count+1));
  }
  void decrement(){
    if(state.count>0){
      emit(stateCubit(count: state.count-1));
    }
  }
}