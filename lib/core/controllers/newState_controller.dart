import 'package:get/get.dart';

class NewStateController extends GetxController {
  bool toggle = false;

  Future<bool> onChanged(v) {
    toggle = v;
    update();
    return v;
  }
}
