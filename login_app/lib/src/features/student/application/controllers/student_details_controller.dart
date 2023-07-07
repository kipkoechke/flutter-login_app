import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/features/student/application/screens/student_application_form/application_done.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class StudentDetailsController extends GetxController {
  static StudentDetailsController get instance => Get.find();

  final gender = ''.obs;
  final dateOfBirth = ''.obs;
  final fatherdisabilityChoice = ''.obs;
  final motherdisabilityChoice = ''.obs;
  final guardiandisabilityChoice = ''.obs;

  final ncpwd = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<List<ApplicationFormModel>> getAllApplications() async {
    return await userRepo.allApplications();
  }

  Stream<int> getAllApplicationsCount() {
    return userRepo.allApplicationsCount().asStream();
  }

  Widget buildGenderRadioButtons() {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: gender.value),
      decoration: const InputDecoration(
        labelText: 'Gender',
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      onTap: () {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select Gender'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: gender.value,
                    onChanged: (value) {
                      gender.value = value!;
                      Navigator.of(context).pop();
                    },
                  ),
                  RadioListTile(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: gender.value,
                    onChanged: (value) {
                      gender.value = value!;
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select your gender';
        }
        return null;
      },
    );
  }

  Widget buildDateOfBirthDatePicker() {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: dateOfBirth.value),
      decoration: InputDecoration(
        labelText: 'Date of Birth',
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: Get.context!,
              initialDate: DateTime.now(),
              firstDate: DateTime(1960),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              dateOfBirth.value = DateFormat('yyyy-MM-dd').format(picked);
            }
          },
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your date of birth';
        }
        return null;
      },
    );
  }

  Widget buildFatherDisabilityRadioButtons() {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: fatherdisabilityChoice.value),
      decoration: const InputDecoration(
        labelText: 'Do you have a disability?',
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      onTap: () {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select Disability'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    title: const Text('Yes'),
                    value: 'Yes',
                    groupValue: fatherdisabilityChoice.value,
                    onChanged: (value) {
                      fatherdisabilityChoice.value = value!;
                      Get.back();
                    },
                  ),
                  RadioListTile(
                    title: const Text('No'),
                    value: 'No',
                    groupValue: fatherdisabilityChoice.value,
                    onChanged: (value) {
                      fatherdisabilityChoice.value = value!;
                      Get.back();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select your gender';
        }
        return null;
      },
    );
  }

  Widget buildMotherDisabilityRadioButtons() {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: motherdisabilityChoice.value),
      decoration: const InputDecoration(
        labelText: 'Do you have a disability?',
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      onTap: () {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select Disability'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    title: const Text('Yes'),
                    value: 'Yes',
                    groupValue: motherdisabilityChoice.value,
                    onChanged: (value) {
                      motherdisabilityChoice.value = value!;
                      Get.back();
                    },
                  ),
                  RadioListTile(
                    title: const Text('No'),
                    value: 'No',
                    groupValue: motherdisabilityChoice.value,
                    onChanged: (value) {
                      motherdisabilityChoice.value = value!;
                      Get.back();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select your gender';
        }
        return null;
      },
    );
  }

  Widget buildGuardianDisabilityRadioButtons() {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: guardiandisabilityChoice.value),
      decoration: const InputDecoration(
        labelText: 'Do you have a disability?',
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
      onTap: () {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select Disability'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile(
                    title: const Text('Yes'),
                    value: 'Yes',
                    groupValue: guardiandisabilityChoice.value,
                    onChanged: (value) {
                      guardiandisabilityChoice.value = value!;
                      Get.back();
                    },
                  ),
                  RadioListTile(
                    title: const Text('No'),
                    value: 'No',
                    groupValue: guardiandisabilityChoice.value,
                    onChanged: (value) {
                      guardiandisabilityChoice.value = value!;
                      Get.back();
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please select your gender';
        }
        return null;
      },
    );
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
