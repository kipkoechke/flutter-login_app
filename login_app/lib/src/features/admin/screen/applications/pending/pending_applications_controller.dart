import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class PendingApplicationsController extends GetxController {
  static PendingApplicationsController get instance => Get.find();

  final String title = 'Pending Applications';
  final userRepo = Get.put(UserRepository());

  Future<List<ApplicationFormModel>> getPendingApplications() async {
    return await userRepo.pendingApplications();
  }
}
