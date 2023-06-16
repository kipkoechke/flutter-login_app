import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/application/models/locality_model.dart';
import 'package:login_app/src/features/application/screens/personal/personal_details_screen.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class LocalityDetailsController extends GetxController {
  static LocalityDetailsController get instance => Get.find();

  final subCounty = TextEditingController();
  final ward = TextEditingController();
  final location = TextEditingController();
  final subLocation = TextEditingController();
  final village = TextEditingController();
  final chiefName = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createLocation(LocalityModel locality) async {
    await userRepo.createLocation(locality);
    Get.to(() => PersonalDetailsFormScreen());
  }
}
