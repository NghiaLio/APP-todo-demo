import 'package:flutter/material.dart';
import 'package:todo_list/page/HomeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
