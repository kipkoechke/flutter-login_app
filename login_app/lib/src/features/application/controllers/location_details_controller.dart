import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/application/models/location_model.dart';
import 'package:login_app/src/features/application/screens/personal/personal_details_screen.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class LocationDetailsController extends GetxController {
  static LocationDetailsController get instance => Get.find();

  final subCounty = TextEditingController();
  final ward = TextEditingController();
  final location = TextEditingController();
  final subLocation = TextEditingController();
  final village = TextEditingController();
  final chiefName = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createLocation(LocationModel location) async {
    await userRepo.createLocation(location);
    Get.to(() => PersonalDetailsFormScreen());
  }
}
