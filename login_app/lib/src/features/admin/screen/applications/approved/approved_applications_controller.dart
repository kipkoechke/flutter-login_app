import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class ApprovedApplicationController extends GetxController {
  static ApprovedApplicationController get instance => Get.find();

  final String title = 'Approved Applications';
  final _userRepo = Get.put(UserRepository());

  approveApplication(String id) async {
    await _userRepo.approveUserApplication(id);
  }

  //-- Retrieves user application data
  Stream<List<ApplicationFormModel>> getApprovedApplication() {
    return _userRepo.approvedApplication().asStream();
  }

  Stream<int> getApprovedApplicationsCount() {
    return _userRepo.approvedApplicationsCount().asStream();
  }
}
