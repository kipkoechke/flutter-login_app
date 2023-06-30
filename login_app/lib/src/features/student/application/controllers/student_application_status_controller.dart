import 'package:get/get.dart';

class StudentApplicationStatusController extends GetxController {
  static StudentApplicationStatusController get instance => Get.find();
  var status = ''.obs;

  void updateStatus(String newStatus) {
    status.value = newStatus;
  }
}
