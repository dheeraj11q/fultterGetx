import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getxf/core/services/api/dio_apis/dioGetApi.dart';
import 'package:getxf/core/services/models/userListModel.dart';
import 'package:getxf/core/utils/data.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  int count = 10;
  List<UserListModel>? userList;
  bool loading = false;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectionSubscription;
  String _connectionStatus = "";

  @override
  void onInit() {
    getHttp();
    super.onInit();

    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      print(result.toString());
      _connectionStatus = result.toString();

      if (_connectionStatus == "ConnectivityResult.none") {
        UserData.internet = false;
        Get.defaultDialog(
          // barrierDismissible: false,
          title: "Internet",
          radius: 10,
          // onWillPop: () async {
          //   return false;
          // }
        );
        // toastshow(text: "Internet connected");
      } else {
        UserData.internet = true;
        Get.back();
      }
    });
  }

  void getHttp() async {
    print("run....");

    String url = 'https://jsonplaceholder.typicode.com';
    BaseOptions opts = BaseOptions(
      baseUrl: url,
      responseType: ResponseType.json,
      connectTimeout: 100000,
      receiveTimeout: 30000,
    );

    Dio dio = Dio(opts);

    try {
      dio.get("/photos").then((value) {
        print(value.data);

        var data = json.encode(value.data);
        print(data);
      });
    } catch (e) {
      print(e);
    }
    // try {
    //   loading = true;

    //   var response = await http.get(Uri.parse(
    //       'https://jsonplaceholder.typicode.com/photos')); //Dio().get('https://jsonplaceholder.typicode.com/photos');
    //   // print(response);

    //   userList = userListModelFromJson(response.body);
    //   loading = false;

    //   update();
    // } catch (e) {
    //   print("erro to loading $e");
    // }
  }
}
