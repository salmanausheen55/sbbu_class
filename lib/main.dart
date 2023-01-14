import 'package:flutter/material.dart';
import 'package:sbbu_class/screens/first_screen.dart';
// import 'package:sbbu_class/screens/first_screen.dart';
 import 'package:sbbu_class/screens/third_screen.dart';
//import 'package:sbbu_class/screens/web_view_screen.dart';

void main() {
runApp  (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(),
    );
  }
}

