import 'package:flutter/material.dart';
import 'package:gus/HomeScreen.dart';
import 'package:gus/OnBoarding.dart';
import 'package:gus/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Scaaffold extends StatefulWidget{
  final seen;
  
  const Scaaffold({super.key,required this.seen,});
  @override
  State<Scaaffold> createState() =>_Scaaffold();
   

}
class _Scaaffold extends State<Scaaffold>{
  
  final bool seenOnBrd=false;
  Future<void>completedOnbording()async{
    final prefs=await
    SharedPreferences.getInstance();
    await prefs.setBool('SeenOnbrd', true);
  }

   
  int index=0;
  Widget Buildbox(){
   return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all()
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    
  
    backgroundColor: Colors.white,
  appBar: AppBar(title: Text(''),actions: [
    TextButton(onPressed: _hnaviagateToAddPage, child: Text('пропустить'))
  ],),
 body: Center(
        child:Column (
mainAxisAlignment: MainAxisAlignment.start,
children: [

  Container(
    height: 100,
    width: 100,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: Colors.white,

  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.asset('images/tramp.jpg'),
    
  ),
    ),
  
  seenOnBrd?HomeScreen():OnboardingScreen(),
  SizedBox(height: 5,),
        Text('Todo List',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900,),),
SizedBox(height: 30,),
        Text('добро пожаловать',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        SizedBox(height: 4,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
      children: [  Text('организуйте своя жизнь,'),
     Text( ' с Todoist-my brother from'),
    Text(  ' another mother my'),
    Text(  ' sister from another mister'),
    SizedBox(height:  16),
  Image.asset('images/Epstein.webp',height: 150,width: 300,),
    
  
      ],
        ),
],
      ),
      ),
         floatingActionButton: FloatingActionButton.extended(
      onPressed: _naviagateToAddPage,
    label:const Text('далее',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),backgroundColor: Colors.blue,
    

       
         ),
    
 
  

floatingActionButtonLocation:  FloatingActionButtonLocation.endFloat,
   );
   
  }
void _naviagateToAddPage()async{
final result=await Navigator.push<String>(context,MaterialPageRoute(builder: (_)=> AddPage()));

}
void _hnaviagateToAddPage()async{
final result=await Navigator.push<String>(context,MaterialPageRoute(builder: (_)=> MyHomePage()));

}
}
class AddPage extends StatefulWidget{
  const AddPage({super.key});
  @override
  State<AddPage> createState() =>_AddPage();
   

}
class _AddPage extends State<AddPage>{
  List<Widget>pages=[
    AddPage(),
    Scaaffold(seen: '',),
  ];
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
    backgroundColor: Colors.white,
  appBar: AppBar(title: Text('Todo List'),actions: [TextButton(onPressed: _hnaviagateToAddPage, child: Text('пропустить'))],),
 body: Center(
        child:Column (
mainAxisAlignment: MainAxisAlignment.start,
children: [

SizedBox(height: 70,),

  Image.asset('images/Eps.jpeg',height: 150,width: 300,),
  SizedBox(height: 6,),
        Text('все задачи в одном месте',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        SizedBox(height: 15,),
         Text('добавляйте задачи на день,неделю,месяц',style: TextStyle(fontSize: 10,color: Colors.grey),),

],
      ),
      ),
    
         floatingActionButton: FloatingActionButton.extended(
      onPressed: _naviagateToAddPage,
    label: const Text('далее',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),backgroundColor: Colors.blue,
      
    
      
    ),
 
  

floatingActionButtonLocation:  FloatingActionButtonLocation.endFloat,
        
   );
   
  } 

  void _naviagateToAddPage()async{
final result=await Navigator.push<String>(context,MaterialPageRoute(builder: (_)=> MyHomePage()));
}
void _hnaviagateToAddPage()async{
final result=await Navigator.push<String>(context,MaterialPageRoute(builder: (_)=> MyHomePage()));

}
void _pop(){
  Navigator.pop(context);
}
}