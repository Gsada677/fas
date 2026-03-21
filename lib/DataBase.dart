import 'Toodo.dart';

class AppDatabase {
  List<Toodo>tasks=[
    Toodo(tittle: 'Homework',Date: '01.01.2026',isDone: true),
    Toodo(tittle: 'Homework',Date: '02.01.2026',isDone: true),
    Toodo(tittle: 'Homework',Date: DateTime.now().toString(),isDone: true),
    Toodo(tittle: 'Homework',Date: '11.01.2026',isDone: true),
  ];
  Future<List<Toodo>> getList()async{
    return List.unmodifiable(tasks);
  }
}