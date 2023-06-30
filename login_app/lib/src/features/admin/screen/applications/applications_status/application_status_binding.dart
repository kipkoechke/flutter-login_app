import 'package:get/get.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_controller.dart';

class ApplicationStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationStatusController>(
        () => ApplicationStatusController());
    Get.lazyPut<PendingApplicationsController>(
        () => PendingApplicationsController());
    Get.lazyPut<ApprovedApplicationController>(
        () => ApprovedApplicationController());
    Get.lazyPut<DeclinedApplicationsController>(
        () => DeclinedApplicationsController());
  }
}
