import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt approvedApplicationsCount = 0.obs;

  updateApprovedApplicationsCount(int count) {
    approvedApplicationsCount.value = count;
  }
}
