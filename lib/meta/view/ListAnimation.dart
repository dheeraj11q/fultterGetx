import 'package:flutter/material.dart';
import 'package:getxf/core/components/bounceableWidget.dart';
import 'package:getxf/core/components/flutter_verification_code.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ListAnimations extends StatefulWidget {
  const ListAnimations({Key? key}) : super(key: key);

  @override
  _ListAnimationsState createState() => _ListAnimationsState();
}

class _ListAnimationsState extends State<ListAnimations> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signup() async {
    try {
      print("run........");
      await firebaseAuth.createUserWithEmailAndPassword(
          email: "dheeraj11@gmail.com", password: "12345678");
    } catch (e) {
      print("Error to sign in $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
            onPressed: () {
              signup();
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              primary: Colors.blue,
            ),
            child: Text("Flutter"),
          )),
          VerificationCode(
              length: 6,
              textStyle: TextStyle(fontSize: 20),
              underlineColor: Colors.blueAccent,
              keyboardType: TextInputType.number,
              onCompleted: (value) {},
              onEditing: (value) {}),
        ],
      ),
    );
    // Column fade animation

    // Scaffold(
    //     backgroundColor: Colors.black,
    //     body: SafeArea(
    //       child: Scaffold(
    //         body: SingleChildScrollView(
    //           child: AnimationLimiter(
    //             child: Column(
    //               children: AnimationConfiguration.toStaggeredList(
    //                 duration: const Duration(milliseconds: 800),
    //                 childAnimationBuilder: (widget) => SlideAnimation(
    //                   horizontalOffset: 60.0,
    //                   child: FadeInAnimation(
    //                     child: widget,
    //                   ),
    //                 ),
    //                 children: [
    //                   Container(
    //                     margin: EdgeInsets.all(4),
    //                     width: MediaQuery.of(context).size.width,
    //                     height: 60,
    //                     color: Colors.blue,
    //                   ),
    //                   Row(
    //                     children: [
    //                       Flexible(
    //                         child: Container(
    //                           margin: EdgeInsets.all(4),
    //                           height: 60,
    //                           color: Colors.yellow,
    //                         ),
    //                       ),
    //                       Flexible(
    //                         child: Container(
    //                             margin: EdgeInsets.all(4),
    //                             height: 60,
    //                             color: Colors.yellow),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ));

    // Animation list

    //   AnimationLimiter(
    //     child: ListView.builder(
    //       physics: BouncingScrollPhysics(),
    //       itemCount: 20,
    //       itemBuilder: (BuildContext context, int index) {
    //         return AnimationConfiguration.staggeredList(
    //           position: index,
    //           duration: const Duration(milliseconds: 1000),
    //           child: SlideAnimation(
    //             verticalOffset: 50.0,
    //             // horizontalOffset: 100,
    //             child: Container(
    //               margin: EdgeInsets.all(5),
    //               child: BounceContainer(),

    //               //  Material(
    //               //   borderRadius: BorderRadius.circular(20),
    //               //   elevation: 3,
    //               //   child:

    //               //   Container(
    //               //     // width: 50,
    //               //     height: 80,
    //               //     color: Colors.white,
    //               //   ),
    //               // ),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
