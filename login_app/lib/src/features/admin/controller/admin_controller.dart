import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class AdminController extends GetxController {
  static AdminController get instance => Get.find();

  final _userRepo = Get.put(UserRepository());

  //-- Retrieves user application data
  Stream<ApplicationFormModel> userApplicationData() {
    final uid = FirebaseFirestore.instance.collection("Applications").id;
    return _userRepo.adminGetUserApplicationDetails(uid).asStream();
  }
}
