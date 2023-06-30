import 'package:get/get.dart';

class ApplicationStatusController extends GetxController {
  static ApplicationStatusController get instance => Get.find();
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
