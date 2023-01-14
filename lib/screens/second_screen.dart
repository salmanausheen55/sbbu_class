//import 'dart:ffi';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
    this.id, 
    this.name, 
    this.fatherName, 
    this.department, 
    this.description,
    {
      super.key,
    }
  );
  final int id;
  final String name;
  final String fatherName;
  final String department;
  final String description;

  @override
  State<SecondScreen> createState() => _SecondScreenState (
    id, 
    name, 
    fatherName, 
    department, 
   description,
   );
}

class _SecondScreenState extends State<SecondScreen> {
   _SecondScreenState(
    this.id, 
    this.name, 
    this.fatherName, 
    this.department, 
    this.description,
    
  );
  final int id;
  // String? name; it is used for nullable value
  final String name;
  final String fatherName;
  final String department;
  final String description;

//it is reusable widget
  Widget textWidget(String content){
   return Text(
    content, // ?? 'The value is null',
    style: const TextStyle(
      fontSize: 30,
      color: Colors.black,
    ),
   );
  }

  @override
  void initState() {
    super.initState();

  print('id = $id');
  print('name = $name');
  print('fatherName = $fatherName');
  print('department = $department');
  print('description = $description');


  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondScreen'),
  ),
     body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Row(
           children: [
             Text (
               'Name',
                style: const TextStyle(
                fontSize: 30,
                fontFamily: 'futura',
                color: Colors.orange,
             ),
         ),    
         
                Text(
                'Father Name',
                style: const TextStyle(
                fontSize: 30,
                fontFamily: 'futura',
                color: Colors.black,

             ),
          ),    
       ],
      ),
        
        const SizedBox(height: 50),
        Text(
          'department',
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'futura',
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'description',
          style: const TextStyle(
          fontSize: 30,
          fontFamily: 'futura',
          color: Colors.green,
          ),
          ),
        ],
      ),
    );
  } 
}



