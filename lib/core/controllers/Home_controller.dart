import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'dart:math';

class HomeController extends GetxController {
  dynamic boxColor = Colors.blue;
  var count = 0;
  void colorChange() {
    boxColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    update();

    // Timer.periodic(Duration(seconds: 1), (v) {
    //   // print(v);
    //   boxColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    //   count++;
    //   update();
    // });
    // while (true) {
    //   Future.delayed(Duration(seconds: 1), () {
    //     count++;
    //     boxColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    //     update();
    //   });

    //   if (count == 20.obs) {
    //     break;
    //   }
    // }
  }
}
