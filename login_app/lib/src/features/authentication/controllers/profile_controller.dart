import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  //-- Retrieves a single user
  getUserdata() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login in to continue");
    }
  }

  //-- Retrieves all the users
  Stream<List<UserModel>> getAllUser() {
    return _userRepo.allUsers().asStream();
  }

  //-- Retrieves user application data
  Stream<ApplicationFormModel> getUserApplicationData() {
    final uid = _authRepo.firebaseUser.value?.uid;
    if (uid != null) {
      return _userRepo.getUserApplicationDetails(uid).asStream();
    } else {
      Get.snackbar("Error", "Login in to continue");
      throw Exception('User not authenticated.');
    }
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUser(user);
  }
}
