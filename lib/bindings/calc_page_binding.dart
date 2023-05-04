import 'package:calculator/controllers/calc_page_controller.dart';
import 'package:get/get.dart';

class CalcPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalcPageController());
  }
}
