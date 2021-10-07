import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:getxf/core/models/singleUserModel.dart';
import 'package:getxf/core/models/userModel.dart';
import 'package:getxf/core/services/api/dio_apis/dio_http.dart';
import 'package:getxf/core/utils/data.dart';

class UserController extends GetxController {
  dynamic argumentData = Get.arguments;
  int count = 10;
  // List<UserListModel>? userList;
  bool loading = false;
  HttpService? http;
  bool isLoading = false;
  UserModel? userListM;
  SingleUserModel? singleUser;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectionSubscription;
  String _connectionStatus = "";

  @override
  void onInit() {
    http = HttpService();
    // print("arsgs2  ");
    // getHttp();
    super.onInit();

    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      print(result.toString());
      _connectionStatus = result.toString();

      if (_connectionStatus == "ConnectivityResult.none") {
        UserData.internet = false;

        Get.defaultDialog(
            barrierDismissible: false,
            title: "Internet",
            radius: 10,
            onWillPop: () async {
              return false;
            });
      } else {
        UserData.internet = true;
        Get.back();
      }
    });

    getUsers();
  }

  // pagination func
  Future getUsers() async {
    print("Get Users..........");
    try {
      loading = true;
      update();
      await http?.getRequest(endPoint: "/api/users").then((value) {
        loading = false;

        userListM = UserModel.fromJson(value.data);
      });
    } catch (e) {
      loading = false;
      print(e);
    }

    update();
  }

  Future getSingleUsers() async {
    print("func start  ..........");
    try {
      loading = true;
      update();
      await http
          ?.getRequest(endPoint: "/api/users/${Get.arguments}")
          .then((value) {
        print(value);
        loading = false;

        singleUser = SingleUserModel.fromJson(value.data);
      });
    } catch (e) {
      loading = false;
      print(e);
    }

    update();
  }
}
