import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxf/app/pages.dart';
import 'package:getxf/core/services/locallizations.dart';
import 'package:getxf/meta/view/ListAnimation.dart';
// import 'package:getxf/meta/view/Home.dart';
// import 'package:getxf/meta/view/languageChange.dart';
// import 'package:getxf/meta/view/userList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      getPages: pagesList,
      initialRoute: Pages.webPage,
      // home: ListAnimations()
    );
  }
}
