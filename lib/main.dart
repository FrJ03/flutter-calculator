import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScaffoldApp',
      home: MyHomePage(title: 'ScaffoldApp Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}
