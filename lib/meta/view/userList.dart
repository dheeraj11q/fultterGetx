import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxf/app/pages.dart';
import 'package:getxf/core/controllers/Home_controller.dart';
import 'package:getxf/core/controllers/users_controller.dart';
import 'package:getxf/meta/view/newState.dart';

class UserList extends StatelessWidget {
  final c = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.getHttp();
          // Get.to(() => NewState());
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            GetBuilder<UserController>(
              builder: (con) => c.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                          itemCount: c.userList?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${c.userList?[index].thumbnailUrl}"),
                                backgroundColor: Colors.black,
                              ),
                              title: Text(
                                "${c.userList?[index].title}",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          })),
            ),
          ],
        ),
      ),
    );
  }
}
