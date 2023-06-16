import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/application/models/personal_model.dart';
import 'package:login_app/src/features/application/screens/family/family_form_details_screen.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class PersonalDetailsController extends GetxController {
  static PersonalDetailsController get instance => Get.find();
  final fullName = TextEditingController();
  final nationalId = TextEditingController();
  final regNumber = TextEditingController();
  final phoneNo = TextEditingController();
  final dateOfBirth = Rx<DateTime?>(null);
  final gender = Rx<String?>(null);
  final regularOrPrivate = Rx<String?>(null);

  final userRepo = Get.put(UserRepository());

  Future<void> createPersonal(PersonalModel personal) async {
    await userRepo.createPersonal(personal);
    Get.to(() => const FamilyDetailsForm());
  }

  @override
  void onClose() {
    fullName.dispose();
    nationalId.dispose();
    regNumber.dispose();
    phoneNo.dispose();
    super.onClose();
  }
}
