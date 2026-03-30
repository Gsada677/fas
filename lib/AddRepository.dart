import 'app_database.dart';


abstract class AppRepository {
  Future<List<Todo>>getList();
}
class AppRepositoryImpl extends AppRepository{
  final AppDatabase dp;
  AppRepositoryImpl(this.dp);
  @override
  Future<List<Todo>> getList() =>dp.getTodoList();
 
  void main(List<String>arguments)async{
  
  
    void parseNumber(String number){number='72';
    try{
      int result=int.parse(number);
print(result);

    }catch(e){
      print(e);
    }
    }
  }
}