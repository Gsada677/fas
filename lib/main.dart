import 'package:flutter/material.dart';
import 'package:gus/Caffold.dart';
import 'package:gus/app_database.dart';
late final AppDatabase appDatabase;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appDatabase=AppDatabase();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    
   home:  Scaaffold()),
  );
}