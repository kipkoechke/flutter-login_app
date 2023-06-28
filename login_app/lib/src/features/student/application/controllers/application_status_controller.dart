import 'package:get/get.dart';

class ApplicationStatusController extends GetxController {
  static ApplicationStatusController get instance => Get.find();
  var status = ''.obs;

  void updateStatus(String newStatus) {
    status.value = newStatus;
  }
}
