import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class ApprovedApplicationController extends GetxController {
  static ApprovedApplicationController get instance => Get.find();

  final String title = 'Approved Applications';
  final _userRepo = Get.put(UserRepository());
  final List<ApplicationFormModel> applications = <ApplicationFormModel>[].obs;


  approveApplication(String id) async {
    await _userRepo.approveUserApplication(id);
    applications.removeWhere((application) => application.id == id);
  }

  //-- Retrieves user application data
  Stream<List<ApplicationFormModel>> getApprovedApplication() {
    return _userRepo.approvedApplication().asStream();
  }

  Stream<int> getApprovedApplicationsCount() {
    return _userRepo.approvedApplicationsCount().asStream();
  }
}
