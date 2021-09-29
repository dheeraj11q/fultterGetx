import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxf/app/pages.dart';
import 'package:getxf/core/services/locallizations.dart';
import 'package:getxf/meta/view/Home.dart';
import 'package:getxf/meta/view/languageChange.dart';
import 'package:getxf/meta/view/userList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),

      getPages: [
        GetPage(name: Pages.home, page: () => Home()),
        GetPage(name: Pages.userList, page: () => UserList()),
        GetPage(name: Pages.languageChange, page: () => LanguageChange())
      ],
      initialRoute: Pages.userList,
      // home: Directionality(
      //   textDirection: TextDirection.rtl,
      //   child: LanguageChange(),
      // ),
    );
  }
}
