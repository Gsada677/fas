import 'Toodo.dart';

class HomeState {
  final List<Toodo>items;
  final bool isError;
  const HomeState({required this.items,required this.isError});
  factory HomeState.initial()=>const HomeState(items: [], isError: false);
  HomeState copyWith({List<Toodo>?items,bool? isError}){
    return HomeState(items: items ??this.items, isError: isError??this.isError);
  }
}