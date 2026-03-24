import 'package:flutter/material.dart';

class Changepage extends StatefulWidget{
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
} final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("список покупок"),
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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  controller: _controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: '$_controller',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                SizedBox(height: 300,),
                     
                ElevatedButton(
                  onPressed: _savetsks,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 140, 255),
                    minimumSize: const Size(double.infinity, 60),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  child: const Text(
                    "Сохранить все изменения",
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
    );
  }

}

