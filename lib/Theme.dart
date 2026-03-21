
import 'package:flutter/material.dart';
import 'Home.dart';



class Themee extends StatefulWidget{
  const Themee ({super.key});
  
  @override
  State<Themee> createState() => _Theme();
 
  
}
class _Theme extends State<Themee>{
  ThemeMode themeMode = ThemeMode.light;
  void toggleTheme(){
    setState(() {
      themeMode=themeMode == ThemeMode.light?ThemeMode.dark:ThemeMode.light;
    });

  }
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
   
    
    title: 'Theme Mode',
    themeMode: themeMode,
    theme: ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      )
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurpleAccent,

      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.deepPurpleAccent,
      ),
      
    ),
    home: Home(onToggle: toggleTheme, themeMode: themeMode)
   );
    
   
  }
}