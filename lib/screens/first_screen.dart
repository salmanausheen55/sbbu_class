import 'dart:convert';
// import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sbbu_class/screens/second_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

 
class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

   // INIALIZATION OF DIO LIBRARY
        Dio dio = Dio();
   // VARIABLES AND FUNCTIONS AREA
     int id = 1;
    List studentsInfo = [];
    List products = [];
    

    //FUNCTION RESPONSIBLE FOR  GETTING DATA FROM LOCAL JSON FILE

  Future<void> readJson() async{ //readJson() async{
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    setState(() {
    
      studentsInfo = data ["studentsInfo"];
    }
    );
  }
   // API CALL FOR GETTING DATA FROM API SERVER

  Future<void>getAPIcall() async{
    var url = Uri.parse('https://dummyjson.com/products'); //Access the link
    var response = await http.get(url);                    //make the call
    var data = await json.decode(response.body);           //decode the Response
    setState(                  
      () {
      products = data ['products'];                        //Save decoded response
     }
     );
  }
  //SAME GET API CALL USING DIO LIBRARY

 Future<void>getAPIcallDio() async{
    var url = 'https://dummyjson.com/products'; //Access the link
    try{
    var response = await dio.get(url);                   //make the call
    // var data = await json.decode(response.data);           //decode the Response
    setState(                  
      () {
      products = response.data ['products'];                        //Save decoded response
     }
     );
  } 
  catch(e){
       print(e);
  }
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // readJson();
    // getAPIcall();
    getAPIcallDio();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // leading: ,  
        title: const Text( 
          'Text',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),       
          ), 
        centerTitle: true,
        // actions: [],
      ),

    //IF THE LIST IS EMPTY
      body: products.isEmpty
      ?const Center(
         child: CircularProgressIndicator(),
      ) 
    //IF THE LIST IS NOT EMPTY
    //body: products.isNotEmpty ? list 
    //: const Center  (child: CircularProgressIndicator(),),
      : ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context,int index){
        return Column(
          children: [
            GestureDetector(              
              // onTap: () {

                // Navigation From One Screen to Another

                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SecondScreen(
                //       studentsInfo [index] ['id'],
                //       studentsInfo [index] ['name'],
                //       studentsInfo [index] ['fatherName'],
                //       studentsInfo [index] ['department'],
                //       studentsInfo [index] ['description'],
      //     ),
      //  ),
  //  );
//  },        
             child: ListTile(
              
              leading: CircleAvatar(                           
                backgroundColor: Colors.yellow,
                radius: 15,
                child: 
                CachedNetworkImage(
                  imageUrl:'${products[index]['thumbnail']}',
                  placeholder: (context, url) => const CircularProgressIndicator(),
                ),
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //      decoration: BoxDecoration(
	          //        shape: BoxShape.circle,
	                  
            //      image: DecorationImage(  
	          //            image:  NetworkImage(products[index]['thumbnail']),
	          //            fit: BoxFit.fill,
	          //       ),
            //     ),
            //  ),
          ),
                // child: Image.network(products[index]['thumbnail']),
                //       child: ClipRRect(                                                                        
                //         child: Image.network(products[index]['thumbnail']),                       
                //         borderRadius: BorderRadius.circular(15.0), 
                                                                    
                // ),
       
              // leading: Text ('${products [index]['id']}'),
              title: Text (
                '${products[index]['title']}',
                style: const TextStyle( 
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
               ),

              subtitle: Text (
                '${products[index]['description']}',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: const Icon(
                Icons.chevron_right,
              // color: Colors.white,
              ),
              
             ),
              
             ),
             const Divider(),            
           ],
          );
        },  
      ),
    );
  }
}


