import 'package:flutter/material.dart';
import 'addpage.dart';
import 'AddRepository.dart';
import 'DataBase.dart';
import 'HomeState.dart';
import 'homeModal.dart';
import 'Toodo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Theme.dart';
class MyHomePage extends StatefulWidget {

const MyHomePage ({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  late PreferredSize preferredSize;
  late final String contr;
  late final homeCubit cubit;
  ThemeMode themeMode = ThemeMode.light;
List<Toodo> tasks=[];
bool isVisible=true;
 late TextEditingController _controller;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('home page initState');
    final dp=AppDatabase();
    final repo=AppRepositoryImpl(dp);
    final vm=HomeViewModal(repo: repo);
cubit=homeCubit(vm: vm);
cubit.fetchList();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('don');
  }
  
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider.value(value: cubit,child: 
    Scaffold(
      appBar: AppBar(title: Text('tasks'),
      ),
      body: BlocBuilder<homeCubit,HomeState>(
        builder: (context, state) {
          if(state.isError){
            return Center(
              child: Text('Error'),
            );
          }else if(state.items.isEmpty){
            return Center(child: Text('List is Empty'),);
          }
          

          

          
          return Scaffold(
        

  

        
        
    
  
      appBar: AppBar(
        title: Text('gren'),
        
      ),
      drawer: Themee(),
           body: Center(
        child: Column(
          
          mainAxisAlignment: .center,
          
          children: [

            /*Text(text),
            Visibility(child: Text('to show and hide'),
            visible: isVisible,),
            Container(
              width: 300,
              height: 200,
              color: currentColor,
            ),

           
         TextButton(onPressed: _changeText, child: Text('скрыть'),),*/
  Expanded(child:ListView.builder(itemCount: tasks.length,itemBuilder: (context,index){
  return GestureDetector(
                child: Container(
                  height: 85,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 40, 137, 221),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        tasks[index].isDone
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          tasks[index].tittle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
  );
  },
  ),
  ),
      
          ],
        ),

      ),

        
        
          );
          
          
        },
      
      ),
      
    
  
      
    
          
                          
                        
                      
             
                  
                
              
            
          
        
      
    floatingActionButton: SizedBox(
      width: 550,
      child: FloatingActionButton(onPressed: _naviagateToAddPage,child: const Text('в избранное',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
    ),
 
  

floatingActionButtonLocation:  FloatingActionButtonLocation.centerFloat,

       )
    );
  }

 void toggleTheme(){
    setState(() {
      themeMode =themeMode== ThemeMode.light?ThemeMode.dark:ThemeMode.light;
    });
  }
 
void _naviagateToAddPage()async{
final result=await Navigator.push<String>(context,MaterialPageRoute(builder: (_)=> AddPage()));

  
  if (result != null && result.isNotEmpty) {
    setState(() {
      tasks.add(Toodo(tittle: result,isDone: false,Date: DateTime.now().toString()));
    });


 
  floatingActionButton: FloatingActionButton.extended(
      onPressed: _naviagateToAddPage,
    label: const Icon(Icons.settings),
      
    
    
  
  
  );
  }
}
}