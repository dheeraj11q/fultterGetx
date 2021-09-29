import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxf/core/controllers/Home_controller.dart';

class Home extends StatelessWidget {
  final c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print("State Update ..........");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GetBuilder<HomeController>(
          //     builder: (con) => Text(
          //           'clicks: ${c.count}',
          //         )),
          GetBuilder<HomeController>(
            builder: (con) => InkWell(
              onTap: c.colorChange,
              child: Center(
                child: Container(
                  color: c.boxColor,
                  width: Get.size.width,
                  height: Get.size.height,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
