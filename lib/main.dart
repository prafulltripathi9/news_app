import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'newsapp',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}