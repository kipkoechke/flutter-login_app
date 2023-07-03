import 'package:get/get.dart';

class StudentDashboardController extends GetxController {
  static StudentDashboardController get instance => Get.find();
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
}
