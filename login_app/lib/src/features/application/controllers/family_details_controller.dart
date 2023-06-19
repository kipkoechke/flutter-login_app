import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/application/models/family_model.dart';
import 'package:login_app/src/features/application/screens/school/school_form_details_screen.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class FamilyDetailsController extends GetxController {
  static FamilyDetailsController get instance => Get.find();

  final fatherName = TextEditingController();
  final fatherNationalId = TextEditingController();
  final fatherOccupation = TextEditingController();
  final fatherPhoneNumber = TextEditingController();
  final fatherDisability = TextEditingController();
  final ifFatherDisable = TextEditingController();

  final motherName = TextEditingController();
  final motherNationalId = TextEditingController();
  final motherOccupation = TextEditingController();
  final motherPhoneNumber = TextEditingController();
  final motherDisability = TextEditingController();
  final ifMotherDisable = TextEditingController();

  final guardianName = TextEditingController();
  final guardianNationalId = TextEditingController();
  final guardianOccupation = TextEditingController();
  final guardianPhoneNumber = TextEditingController();
  final guardianDisability = TextEditingController();
  final ifGuardianDisable = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createFamily(FamilyModel family) async {
    await userRepo.createFamily(family);
    Get.to(() => SchoolFormDetailsScreen());
  }

  @override
  void onClose() {
    fatherName.dispose();
    fatherNationalId.dispose();
    fatherOccupation.dispose();
    fatherPhoneNumber.dispose();
    fatherDisability.dispose();
    ifFatherDisable.dispose();

    motherName.dispose();
    motherNationalId.dispose();
    motherOccupation.dispose();
    motherPhoneNumber.dispose();
    motherDisability.dispose();
    ifMotherDisable.dispose();

    guardianName.dispose();
    guardianNationalId.dispose();
    guardianOccupation.dispose();
    guardianPhoneNumber.dispose();
    guardianDisability.dispose();
    ifGuardianDisable.dispose();

    super.onClose();
  }
}
