import 'app_database.dart';


abstract class AppRepository {
  Future<List<Todo>>getList();
}
class AppRepositoryImpl extends AppRepository{
  final AppDatabase dp;
  AppRepositoryImpl(this.dp);
  @override
  Future<List<Todo>> getList() =>dp.getTodoList();
 
  
}