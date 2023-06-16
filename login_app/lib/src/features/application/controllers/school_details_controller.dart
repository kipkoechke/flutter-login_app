import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/application/models/school_model.dart';
import 'package:login_app/src/features/application/screens/application_done_screen.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class SchoolDetailsController extends GetxController {
  static SchoolDetailsController get instance => Get.find();
  final institutionCounty = TextEditingController();
  final institutionAddress = TextEditingController();
  final institutionName = TextEditingController();
  final institutionBankAccountNo = TextEditingController();
  final bankName = TextEditingController();
  final bankBranch = TextEditingController();
  final bankCode = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createSchool(SchoolModel school) async {
    await userRepo.createSchool(school);
    Get.to(() => const ApplicationDoneScreen());
  }

  @override
  void onClose() {
    institutionCounty.dispose();
    institutionAddress.dispose();
    institutionName.dispose();
    institutionBankAccountNo.dispose();
    bankName.dispose();
    bankBranch.dispose();
    bankCode.dispose();
    super.onClose();
  }
}
