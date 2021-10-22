import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxf/meta/view/Home.dart';
import 'package:getxf/meta/view/ListAnimation.dart';
import 'package:getxf/meta/view/animationScreen.dart';
import 'package:getxf/meta/view/languageChange.dart';
import 'package:getxf/meta/view/responsivePage.dart';
import 'package:getxf/meta/view/userList.dart';

class Pages {
  static String home = "/";
  static String counter = "/counter";
  static String userList = "/userList";
  static String languageChange = "/languageChange";
  static String animationScreen = "/animationScreen";
  static String animationList = "/animationList";
  static String webPage = "/reponsivePage";
}

List<GetPage<dynamic>> pagesList = [
  GetPage(name: Pages.home, page: () => Home()),
  GetPage(name: Pages.userList, page: () => UserList()),
  GetPage(name: Pages.languageChange, page: () => LanguageChange()),
  GetPage(name: Pages.animationScreen, page: () => AnimationW()),
  GetPage(name: Pages.animationList, page: () => ListAnimations()),
  GetPage(name: Pages.webPage, page: () => ReponsivePage())
];
