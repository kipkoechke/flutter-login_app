import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/features/student/application/screens/application_done_screen.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class StudentDetailsController extends GetxController {
  static StudentDetailsController get instance => Get.find();
  final userRepo = Get.put(UserRepository());

  Future<List<ApplicationFormModel>> getAllApplications() async {
    return await userRepo.allApplications();
  }

  //-- Location Details
  final subCounty = TextEditingController();
  final ward = TextEditingController();
  final location = TextEditingController();
  final subLocation = TextEditingController();
  final village = TextEditingController();

  //-- Personal Details
  final fullName = TextEditingController();
  final admNumber = TextEditingController();
  final phoneNo = TextEditingController();
  final dateOfBirth = Rx<DateTime?>(null);
  final gender = Rx<String?>(null);

  //-- School Details
  final institutionName = TextEditingController();
  final institutionAddress = TextEditingController();
  final institutionBankAccountNo = TextEditingController();
  final bankName = TextEditingController();
  final bankBranch = TextEditingController();
  final bankCode = TextEditingController();

  // -- Family Details
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

  void saveForm(ApplicationFormModel application) async {
    await userRepo.createApplication(application);
    Get.to(() => const ApplicationDoneScreen());
  }

  @override
  void dispose() {
    subCounty.dispose();
    ward.dispose();
    location.dispose();
    subLocation.dispose();
    village.dispose();
    fullName.dispose();
    admNumber.dispose();
    phoneNo.dispose();
    dateOfBirth.close();
    gender.close();
    institutionName.dispose();
    institutionAddress.dispose();
    institutionBankAccountNo.dispose();
    bankName.dispose();
    bankBranch.dispose();
    bankCode.dispose();
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

    super.dispose();
  }
}
