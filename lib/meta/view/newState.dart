import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxf/core/controllers/newState_controller.dart';

// class NewState extends StatelessWidget {
//   final cont = Get.put(NewStateController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GetBuilder<NewStateController>(
//       builder: (c) => Center(
//           child: Switch(
//         value: c.toggle,
//         onChanged: (v) {
//           c.onChanged(v);
//         }, // same signature! you could use ( newValue ) => updateFn( newValue )
//       )),
//     ));
//   }
// }

class NewState extends StatefulWidget {
  const NewState({Key? key}) : super(key: key);

  @override
  _NewStateState createState() => _NewStateState();
}

class _NewStateState extends State<NewState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectionSubscription;
  String _connectionStatus = "";

  @override
  void initState() {
    // internet Connectivity ------------>

    // _connectionSubscription =
    //     _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
    //   setState(() {
    //     print(result.toString());
    //     _connectionStatus = result.toString();
    //   });

    //   if (_connectionStatus == "ConnectivityResult.wifi") {
    //     // toastshow(text: "Internet connected");
    //   } else if (_connectionStatus == "ConnectivityResult.mobile") {
    //     Get.back();
    //     // toastshow(text: "Internet connected");
    //   } else {
    //     _connectionStatus = "No Internet";
    //     print("No Internet");

    //     Get.defaultDialog(
    //         barrierDismissible: false,
    //         title: "Internet",
    //         onWillPop: () async {
    //           return false;
    //         });
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Internet $_connectionStatus"),
      ),
    );
  }
}
