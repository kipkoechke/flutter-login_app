import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class PendingApplicationsController extends GetxController {
  static PendingApplicationsController get instance => Get.find();

  final String title = 'Pending Applications';
  final userRepo = Get.put(UserRepository());
  final List<ApplicationFormModel> applications = <ApplicationFormModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPendingApplications();
  }

  Stream<List<ApplicationFormModel>> getPendingApplications() {
    return userRepo.pendingApplications().asStream();
  }

  Stream<int> getPendingApplicationsCount() {
    return userRepo.pendingApplicationsCount().asStream();
  }

  approveApplication(String id) async {
    await userRepo.approveUserApplication(id);
    applications.removeWhere((application) => application.id == id);
  }

  declineApplication(String id, String reason) async {
    await userRepo.declineUserApplication(id, reason);
    applications.removeWhere((application) => application.id == id);
  }
}
