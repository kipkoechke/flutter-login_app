import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/student/application/controllers/student_details_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class StudentApplicationForm extends StatefulWidget {
  const StudentApplicationForm({Key? key}) : super(key: key);

  @override
  State<StudentApplicationForm> createState() => _StudentApplicationFormState();
}

class _StudentApplicationFormState extends State<StudentApplicationForm> {
  int _currentStep = 0;

  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final StudentDetailsController _controller =
      Get.put(StudentDetailsController());

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLastStep = _currentStep == getSteps().length - 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Form'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        steps: getSteps(),
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        onStepCancel: () {
          _currentStep == 0
              ? null
              : setState(() {
                  _currentStep -= 1;
                });
        },
        onStepContinue: () {
          if (isLastStep && _formKeys[_currentStep].currentState!.validate()) {
            final applicationForm = ApplicationFormModel(
              subCounty: _controller.subCounty.text.trim(),
              ward: _controller.ward.text.trim(),
              location: _controller.location.text.trim(),
              subLocation: _controller.subLocation.text.trim(),
              village: _controller.village.text.trim(),
              fullName: _controller.fullName.text.trim(),
              nationalId: _controller.admNumber.text.trim(),
              admNumber: _controller.admNumber.text.trim(),
              phoneNo: _controller.phoneNo.text.trim(),
              institutionCounty: _controller.subCounty.text.trim(),
              institutionAddress: _controller.institutionAddress.text.trim(),
              institutionName: _controller.institutionName.text.trim(),
              institutionBankAccountNo:
                  _controller.institutionBankAccountNo.text.trim(),
              bankName: _controller.bankName.text.trim(),
              bankBranch: _controller.bankBranch.text.trim(),
              bankCode: _controller.bankCode.text.trim(),
              fatherName: _controller.fatherName.text.trim(),
              fatherNationalId: _controller.fatherNationalId.text.trim(),
              fatherOccupation: _controller.fatherOccupation.text.trim(),
              fatherPhoneNumber: _controller.fatherPhoneNumber.text.trim(),
              fatherDisability: _controller.fatherDisability.text.trim(),
              ifFatherDisable: _controller.ifFatherDisable.text.trim(),
              motherName: _controller.motherName.text.trim(),
              motherNationalId: _controller.motherNationalId.text.trim(),
              motherOccupation: _controller.motherOccupation.text.trim(),
              motherPhoneNumber: _controller.motherPhoneNumber.text.trim(),
              motherDisability: _controller.motherDisability.text.trim(),
              ifMotherDisable: _controller.ifMotherDisable.text.trim(),
              guardianName: _controller.guardianName.text.trim(),
              guardianNationalId: _controller.guardianNationalId.text.trim(),
              guardianOccupation: _controller.guardianOccupation.text.trim(),
              guardianPhoneNumber: _controller.guardianPhoneNumber.text.trim(),
              guardianDisability: _controller.guardianDisability.text.trim(),
              ifGuardianDisable: _controller.ifGuardianDisable.text.trim(),
            );
            StudentDetailsController.instance.saveForm(applicationForm);
          } else {
            setState(() {
              if (_formKeys[_currentStep].currentState!.validate()) {
                _currentStep++;
              }
            });
          }
        },
        controlsBuilder: (context, details) {
          return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(children: [
              if (_currentStep != 0)
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: details.onStepCancel,
                    child: const Text('BACK'),
                  ),
                ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
          title: const Text('Student Details'),
          content: Form(
            key: _formKeys[0],
            child: Column(
              children: [
                const Text('Kindly fill your location details below'),
                TextFormField(
                  controller: _controller.subCounty,
                  decoration: const InputDecoration(label: Text(bSubCounty)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.ward,
                  decoration: const InputDecoration(label: Text(bWard)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.location,
                  decoration: const InputDecoration(label: Text(bLocation)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.subLocation,
                  decoration: const InputDecoration(label: Text(bSubLocation)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.village,
                  decoration: const InputDecoration(label: Text(bVillage)),
                ),
                const SizedBox(height: 10),
                const Text('Kindly fill your personal details below'),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.fullName,
                  decoration: const InputDecoration(label: Text(bFullName)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.admNumber,
                  decoration: const InputDecoration(label: Text(bAdmNumber)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // controller: _controller.gender,
                  decoration: const InputDecoration(label: Text(bGender)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // controller: _controller.dateOfBirth,
                  decoration: const InputDecoration(label: Text(bDateOfBirth)),
                ),
                const Text('Kindly fill your school details below'),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionName,
                  decoration:
                      const InputDecoration(label: Text(binstitutionName)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionAddress,
                  decoration:
                      const InputDecoration(label: Text(binstitutionAddress)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionBankAccountNo,
                  decoration: const InputDecoration(
                      label: Text(binstitutionBankAccountNo)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankName,
                  decoration: const InputDecoration(label: Text(bbankName)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankBranch,
                  decoration: const InputDecoration(label: Text(bbankBranch)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankCode,
                  decoration: const InputDecoration(label: Text(bbankCode)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0,
          title: const Text('Family Details'),
          content: Form(
            key: _formKeys[1],
            child: Column(
              children: [
                const Text('Kindly fill your family details below'),
                TextFormField(
                  controller: _controller.fatherName,
                  decoration: const InputDecoration(label: Text(bFatherName)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.fatherNationalId,
                  decoration:
                      const InputDecoration(label: Text(bFatherNationalid)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.fatherPhoneNumber,
                  decoration:
                      const InputDecoration(label: Text(bFatherPhoneNo)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.fatherOccupation,
                  decoration:
                      const InputDecoration(label: Text(bFatherOccupation)),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.fatherDisability,
                  decoration:
                      const InputDecoration(label: Text(bFatherDisable)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ];
}
