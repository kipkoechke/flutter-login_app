import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserdata() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login in to continue");
    }
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUsers();
  }
}
