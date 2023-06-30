import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class DeclinedApplicationsController extends GetxController {
  static DeclinedApplicationsController get instance => Get.find();

  final String title = 'Declined Applications';
  final _userRepo = Get.put(UserRepository());

  declineApplication(String id) async {
    await _userRepo.declineUserApplication(id);
  }

  //-- Retrieves user application data
  Stream<List<ApplicationFormModel>> getDeclinedApplication() {
    return _userRepo.declinedApplication().asStream();
  }
}
