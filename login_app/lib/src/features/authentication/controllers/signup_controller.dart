import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    Get.off(() => const LoginScreen());
  }

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
