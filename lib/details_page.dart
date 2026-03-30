import 'package:flutter/material.dart';
import 'package:gus/app_database.dart';
import 'package:drift/drift.dart';
import 'package:gus/extentions/extention.dart';
import 'app_database.dart';
import 'package:gus/ListToodo.dart';
import 'AddRepository.dart';
import 'Caffold.dart';
class DetailsPage extends StatefulWidget{
  final Todo todo;
  final AppDatabase appDatabase;
  const DetailsPage({super.key,required this.todo,required this.appDatabase});
  @override
  State<StatefulWidget> createState() =>_DetailsPage();
    
  
}
class _DetailsPage extends State<DetailsPage>{
  TextEditingController _controller=TextEditingController();
  late TextEditingController controller;
  @override
  void initState(){
    super.initState();
    controller=TextEditingController(text: widget.todo.tittle);
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Details'),
    ),
    body: Padding(padding: 
    EdgeInsets.all(20),
    child: Flex(direction: .vertical,
    children: [
      TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText:'task name',
          border: OutlineInputBorder() 
        ),
      ),
      TextButton(onPressed: ()=>(), child: Text('save'),),
      TextButton(onPressed: ()=>(), child: Text('delate'),),
    
    

    
     Column(
        children: [
          Text(todo.title),
          Checkbox(
            value: todo.isDone,
            onChanged: (_) {
              context.read<TodoCubit>().toggleIsDone(todo);
            },
          ),
        ],
     ),
        ],
    ),
    ),
    
   );
  }
   Future<void> _updateTodo() async {
    late final String newTitle;
    newTitle = _controller.text;
    try{
       await widget.appDatabase.updateTodo(widget.todo.id, TodosCompanion(tittle:  Value(controller.text),));
    Navigator.pop(context);
    }catch(e){
      print(e);
    }

   

}
  Future<void> _deleteTodo() async {
    await widget.appDatabase.deleteTodo(widget.todo.id);
    context.showAppSnackBar(context, text: 'deleted',color: Colors.yellow )
    Navigator.pop(context);
  }

}
class DetailsCubit extends Cubit<Todo> {
  final AppDatabase db;

  DetailsCubit(this.db, Todo todo) : super(todo);

  Future<void> toggle() async {
    await db.updateIsDone(state.id, !state.isDone);
    emit(state.copyWith(isDone: !state.isDone));
  }
}
