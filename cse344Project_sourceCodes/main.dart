import 'package:cse344_project/MealList.dart';
import 'package:cse344_project/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';

import 'package:cse344_project/LoginScreen.dart';
import 'package:cse344_project/SignupScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/MealList": (context) => MealList(),
        "/LoginScreen": (context) => LoginScreen(),
        "/HomeScreen": (context) => HomeScreen(),
        "/RegisterScreen": (context) => RegisterScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}


