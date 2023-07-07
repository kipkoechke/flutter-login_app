import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class AllocatedUsersController extends GetxController {
  final _userRepo = Get.put(UserRepository());

  Stream<List<ApplicationFormModel>> getAllocatedUsers() {
    return _userRepo.allocatedApplications().asStream();
  }

  Stream<int> getAllocatedUsersCount() {
    return _userRepo.allocatedApplicationsCount().asStream();
  }
}
