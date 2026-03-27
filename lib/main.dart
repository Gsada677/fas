import 'package:flutter/material.dart';
import 'package:gus/Caffold.dart';
import 'package:gus/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
late final AppDatabase appDatabase;
void main()async {
    Future<bool>Check()async{
    final prefs=await
    SharedPreferences.getInstance();
    return prefs.getBool('SeenOnbrd', )??false;
    }
    
  void mainn()async{
  WidgetsFlutterBinding.ensureInitialized();
  final seenn = await Check();
  }
  appDatabase=AppDatabase();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
   home:  Scaaffold(seen: Check,)),
  );
}