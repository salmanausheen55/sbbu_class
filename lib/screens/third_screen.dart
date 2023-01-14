import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ThirdScreen',
          style: TextStyle(
            color: Colors.white,
            
          ),
        ),

        backgroundColor: Colors.green,
      ),

      body: Container(
        
            //   for two lists in one screen we use / or * operator
        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width ,

        decoration: const BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            image: AssetImage('assets/image.jpg'),  
            opacity: 0.9,
            fit: BoxFit.fitWidth,
          
          ),
         
          
          
            
          ),
        ), 
   );  
  }
}
