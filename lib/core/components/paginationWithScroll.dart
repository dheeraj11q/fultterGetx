import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class PaginationContainer extends StatefulWidget {
  // which pagination Function that return true/ false

  final paginationFunction;
  final int? postCount;

  const PaginationContainer(
      {Key? key, @required this.paginationFunction, this.postCount = 20})
      : super(key: key);
  @override
  _PaginationContainerState createState() => _PaginationContainerState();
}

class _PaginationContainerState extends State<PaginationContainer> {
  ScrollController? _scrollController;
  bool pageLoading = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController?.addListener(() {
      // print("pagination Func........");
      double maxScroll = _scrollController!.position.maxScrollExtent;
      double currentScroll = _scrollController!.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        // print("pagination Func........");

        if (_scrollController!.position.userScrollDirection ==
            ScrollDirection.reverse) {
          runPagination();
        }
      }
    });
    super.initState();
  }

  runPagination() {
    if (pageLoading) {
      return;
    }

    setState(() {
      pageLoading = true;
    });

    widget.paginationFunction().then((value) {
      print(value);

      setState(() {
        pageLoading = value;
      });
    });

    // pagination Function call
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // width: Get.width / 2,
          // height: Get.height,
          // color: Colors.black,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: widget.postCount ?? 20,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  // width: Get.size.width / 20,
                  width: 10,
                  height: 50,
                  color: Colors.grey[700],
                  child: Text(
                    "Data Here",
                    style: TextStyle(
                        color: Colors.white, fontSize: Get.size.width / 20),
                  ),
                );
              }),
        ),
        pageLoading
            ? Container(
                width: Get.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : SizedBox()
      ],
    );
  }
}

// abstract class Gfg {
//     // Creating Abstract Methods
//     void say();
//     void write();

//     fun(){

//     }
// }



