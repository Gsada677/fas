

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:gus/Todos.dart';
import 'package:gus/app_database.dart';
import 'package:gus/main.dart';

/*class Changepage extends StatefulWidget{
  final Todo todo;
  const Changepage ({super.key,required this.todo});
    @override
  State<Changepage> createState()=>_ChangePage();
    // TODO: implement createState
  
  
}

class _ChangePage extends State<Changepage>{
 
void _savetsks(){
  if(_controller.text==_controller){
    const Text('Сохранить все изменения',style: TextStyle(color: Colors.grey),);
  }
   Navigator.pop(context, _controller.text.trim());
   final _Color=Color; 
}
void initSate(){
  super.initState();
  
}
 final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String _massege = '';
  Color _messageColor = Colors.red; 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("новая заметка"),
        bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.black12, height: 1.0),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  controller: _controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Название задачи",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Tasks cant be empty';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (_massege.isNotEmpty) {
                      setState(() => _massege = '');
                    }
                  },
                ),
               
                const SizedBox(height: 12),
                if (_massege.isNotEmpty)
                  Text(
                    _massege,
                    style: TextStyle(
                      color: _messageColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                const SizedBox(height: 303), 
                ElevatedButton(
                  onPressed: _savetsks,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                  
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    "Сохранить",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: )
    );
  }


}
*/