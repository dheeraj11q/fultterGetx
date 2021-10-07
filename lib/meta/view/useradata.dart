// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:getxf/core/services/api/dio_apis/dio_http.dart';

// class SingleUserScreen extends StatefulWidget {
//   @override
//   _SingleUserScreenState createState() => _SingleUserScreenState();
// }

// class _SingleUserScreenState extends State<SingleUserScreen> {
//   HttpService? http;

//   bool isLoading = false;

//   Future getUser() async {
//     var response;
//     try {
//       isLoading = true;

//       response = await http?.getRequest("/api/users/2");

//       isLoading = false;

//       // print("here is data ${response}");

//       if (response.statusCode == 200) {
//       } else {
//         print("There is some problem status code not 200");
//       }
//     } on Exception catch (e) {
//       isLoading = false;
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     http = HttpService();

//     getUser();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Get Single user"),
//       ),
//     );
//   }
// }
