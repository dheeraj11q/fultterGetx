import 'package:flutter/material.dart';

class AnimationW extends StatefulWidget {
  const AnimationW({Key? key}) : super(key: key);

  @override
  _AnimationWState createState() => _AnimationWState();
}

class _AnimationWState extends State<AnimationW>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? colorAnimation;
  Animation? sizeAnimation;

  @override
  void initState() {
    super.initState();

    // Defining controller with animation duration of two seconds
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    // Defining both color and size animations
    colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller!);

    // colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow)
    //     .animate(CurvedAnimation(parent: controller!, curve: Curves.bounceOut));
    sizeAnimation = Tween<double>(begin: 100.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.bounceOut));

    // Rebuilding the screen when animation goes ahead
    controller?.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish

    //For single time
    //controller.forward()

    //Reverses the animation instead of starting it again and repeats
    //controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Tween<double> _tween = Tween<double>(begin: 1, end: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animation Demo"),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                ),
              ],
            ))

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Center(
        //     //   child: Container(
        //     //     height: sizeAnimation?.value,
        //     //     width: sizeAnimation?.value,
        //     //     color: colorAnimation?.value,
        //     //   ),
        //     // ),
        //     // SizedBox(
        //     //   height: 100,
        //     // ),
        //     // Row(
        //     //   mainAxisAlignment: MainAxisAlignment.center,
        //     //   children: [
        //     //     IconButton(
        //     //         onPressed: () {
        //     //           controller?.forward();
        //     //         },
        //     //         icon: Icon(Icons.play_arrow)),
        //     //     IconButton(
        //     //         onPressed: () {
        //     //           // controller?.stop();
        //     //           controller?.reset();
        //     //         },
        //     //         icon: Icon(Icons.stop)),
        //     //     IconButton(
        //     //         onPressed: () {
        //     //           controller?.repeat();
        //     //         },
        //     //         icon: Icon(Icons.animation)),
        //     //     SizedBox(
        //     //       height: 10,
        //     //     ),
        //     //   ],
        //     // ),

        //     // tween animation builder ---- //

        //     // GestureDetector(
        //     //   onTap: () {
        //     //     controller?.forward();

        //     //     Future.delayed(Duration(milliseconds: 1000), () {
        //     //       controller?.reset();
        //     //     });
        //     //   },
        //     //   child: TweenAnimationBuilder(
        //     //     tween: _tween,
        //     //     duration: Duration(milliseconds: 500),
        //     //     builder: (context, double scale, child) {
        //     //       return Transform.scale(scale: scale, child: child);
        //     //     },
        //     //     child: Container(
        //     //       width: 50,
        //     //       height: 50,
        //     //       color: Colors.black,
        //     //     ),
        //     //   ),
        //     // ),

        //     // Anomated box

        //   ],
        // ),
        );
  }
}
