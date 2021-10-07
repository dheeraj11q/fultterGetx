import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/state_manager.dart';
import 'package:getxf/core/components/image_with_placeholder.dart';
import 'package:get/get.dart';
import 'package:getxf/core/controllers/users_controller.dart';

class SingleUser extends StatelessWidget {
  final UserController userController = Get.find();

  // final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(Get.isDarkMode
              ? ThemeData.light()
              : ThemeData.dark().copyWith(
                  primaryColor: Color(0xff1f655d),
                  accentColor: Color(0xff40bf7a),
                  textTheme: TextTheme(
                      headline6: TextStyle(color: Color(0xff40bf7a)),
                      subtitle2: TextStyle(color: Colors.white),
                      subtitle1: TextStyle(color: Color(0xff40bf7a))),
                  appBarTheme: AppBarTheme(color: Color(0xff1f655d))));
        },
        child: Icon(Icons.image),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<UserController>(
                // init: UserController(),
                initState: (v) {
                  Future.delayed(Duration(milliseconds: 100), () {
                    userController.getSingleUsers();
                  });
                },
                builder: (con) => con.loading
                    ? Center(child: SpinKitCircle(color: Get.theme.accentColor))
                    : Center(
                        child: userController.singleUser != null
                            ? Column(
                                children: [
                                  ImageShow.circulalAvtarNetwork(
                                      width: 50,
                                      height: 50,
                                      url:
                                          "${userController.singleUser?.data?.avatar}"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${con.singleUser?.data?.email}",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )
                            : Text("No data"),
                      ))
          ],
        ),
      ),
    );
  }
}
