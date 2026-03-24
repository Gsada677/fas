
import 'package:gus/Todos.dart';
import 'package:gus/app_database.dart';

import 'AddRepository.dart';
import 'HomeState.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModal {
  final AppRepository repo;

  HomeViewModal({required this.repo});
  Future <List<Todo>>fetchList()=>repo.getList();
}
class homeCubit extends Cubit<HomeState>{
  final HomeViewModal vm;
  homeCubit({required this.vm}):super(HomeState.initial());
  Future<void>fetchList()async{
    try{
      final items=await vm.fetchList();
      if(items.isEmpty){
        emit(state.copyWith(items:[],isError: false));

        
      }else{
      emit(state.copyWith(items: items,isError: false));
      }
      }catch (e){
        emit(state.copyWith(items: [],isError: true));

      }
    
  }
}