import 'DataBase.dart';
import 'Toodo.dart';

abstract class AppRepository {
  Future<List<Toodo>>getList();
}
class AppRepositoryImpl extends AppRepository{
  final AppDatabase dp;
  AppRepositoryImpl(this.dp);
  @override
  Future<List<Toodo>> getList() =>dp.getList();
 
  
}