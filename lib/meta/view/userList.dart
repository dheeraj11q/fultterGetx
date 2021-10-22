import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getxf/app/pages.dart';
import 'package:getxf/core/components/image_with_placeholder.dart';
import 'package:getxf/core/controllers/users_controller.dart';
import 'package:getxf/meta/view/singleUser.dart';

class UserList extends StatelessWidget {
  final c = Get.put(UserController());

  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("appbar"),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Pages.animationScreen);

          // Get.to(() => ListAnimations());
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.size.height * 0.02,
            ),

            // InkWell(
            //   onTap: () {
            //     c.getUserData();
            //   },
            //   child: Center(
            //     child: ImageShow.network(
            //         url:
            //             'https://th.bing.com/th/id/R.6afc61b50aabe45a2e6c68eae2c217ba?rik=L2W0YWncfjZBVA&riu=http%3a%2f%2fwww.shutterstock.com%2fblog%2fwp-content%2fuploads%2fsites%2f5%2f2016%2f03%2ffall-trees-road-1.jpg&ehk=KA%2bzFrmYoWsdK4k7v%2fgfNkd1T2rdnNtpF5ICdLIxAeM%3d&risl=&pid=ImgRaw&r=0',
            //         width: Get.size.width / 2,
            //         placeHolderAssetImage: Images.postPlaceHolderImage,
            //         onErrorImagesAsset: Images.postPlaceHolderImage,
            //         loaderEnable: true,
            //         border: Border.all(color: Colors.blueAccent),
            //         borderRadius: BorderRadius.circular(10)),
            //   ),
            // ),

            // SizedBox(
            //   height: Get.size.height / 10,
            // ),

            // Center(
            //     child: MaterialButton(
            //   minWidth: 10,
            //   // animationDuration: Duration(seconds: 8),
            //   splashColor: Colors.red,
            //   highlightColor: Colors.yellow,
            //   hoverColor: Colors.pink,
            //   colorBrightness: Brightness.dark,
            //   onPressed: () {},
            //   color: Colors.blue,
            //   child: Text('+'),
            //   textColor: Colors.white,
            // )),

            // ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(Colors.purple),
            //         shadowColor:
            //             MaterialStateProperty.all<Color>(Colors.yellow)),
            //     child: Text('+')),

            // RaisedButton(
            //   child: Text('Splash Color as red'),
            //   splashColor: Colors.red,
            //   onPressed: () {},
            // ),

            GetBuilder<UserController>(
              builder: (con) => c.loading
                  ? Center(
                      child: SpinKitCircle(
                      color: Colors.white,
                    ))
                  : Expanded(
                      child: ListView.builder(
                          itemCount: c.userListM?.data?.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // c.getSingleUsers(
                                //     id: c.userListM?.data![index].id
                                //         .toString());

                                // Get.toNamed(Pages.languageChange);

                                Get.to(() => SingleUser(),
                                    arguments:
                                        "${c.userListM?.data![index].id}");
                              },
                              child: Container(
                                margin: EdgeInsets.all(16),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ImageShow.circulalAvtarNetwork(
                                        width: 50,
                                        height: 50,
                                        url:
                                            "${c.userListM?.data![index].avatar}"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${c.userListM?.data![index].firstName}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )
                                  ],
                                ),
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
