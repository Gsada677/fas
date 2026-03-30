import 'package:flutter/material.dart';
import 'package:gus/Caffold.dart';
import 'package:gus/OnBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final seen = prefs.getBool('SeenOnbrd') ?? false;

  runApp(MyApp(seen: seen));
}
class MyApp extends StatelessWidget {
  final bool seen;

  const MyApp({super.key, required this.seen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: seen ? Scaaffold() :OnboardingScreen(),
    );
  }
}