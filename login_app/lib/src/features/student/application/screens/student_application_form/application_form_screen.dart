import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_controller.dart';
import 'package:login_app/src/features/student/application/controllers/student_details_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

enum ParentStatus {
  bothAlive,
  fatherAlive,
  motherAlive,
  bothDeceased,
  fatherDeceased,
  motherDeceased,
  singleMother,
}

class StudentApplicationForm extends StatefulWidget {
  const StudentApplicationForm({Key? key}) : super(key: key);

  @override
  State<StudentApplicationForm> createState() => _StudentApplicationFormState();
}

class _StudentApplicationFormState extends State<StudentApplicationForm> {
  int _currentStep = 0;
  ParentStatus? selectedParentStatus;

  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final _controller = Get.put(StudentDetailsController());

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
              // status: "Pending",
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
          final bursaryController = Get.put(BursaryController());
          final selectedBursary = bursaryController.getSelectedBursary();

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
                  onPressed: selectedBursary?.isClicked == true
                      ? details.onStepContinue
                      : null,
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
          title: const Text(''),
          content: Form(
            key: _formKeys[0],
            child: Column(
              children: [
                const Text('Kindly fill your location details below'),
                TextFormField(
                  controller: _controller.subCounty,
                  decoration: const InputDecoration(label: Text(bSubCounty)),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.ward,
                  decoration: const InputDecoration(label: Text(bWard)),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.location,
                  decoration: const InputDecoration(label: Text(bLocation)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.subLocation,
                  decoration: const InputDecoration(label: Text(bSubLocation)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.village,
                  decoration: const InputDecoration(label: Text(bVillage)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                const Text('Kindly fill your personal details below'),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.fullName,
                  decoration: const InputDecoration(label: Text(bFullName)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.admNumber,
                  decoration: const InputDecoration(label: Text(bAdmNumber)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // controller: _controller.gender,
                  decoration: const InputDecoration(label: Text(bGender)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // controller: _controller.dateOfBirth,
                  decoration: const InputDecoration(label: Text(bDateOfBirth)),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.phoneNo,
                  decoration: const InputDecoration(label: Text(bPhoneNo)),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1,
          title: const Text(''),
          content: Form(
            key: _formKeys[1],
            child: Column(
              children: [
                TextFormField(
                  controller: _controller.institutionName,
                  decoration:
                      const InputDecoration(label: Text(binstitutionName)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionAddress,
                  decoration:
                      const InputDecoration(label: Text(binstitutionAddress)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionBankAccountNo,
                  decoration: const InputDecoration(
                      label: Text(binstitutionBankAccountNo)),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankName,
                  decoration: const InputDecoration(label: Text(bbankName)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankBranch,
                  decoration: const InputDecoration(label: Text(bbankBranch)),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankCode,
                  decoration: const InputDecoration(label: Text(bbankCode)),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 2,
          title: const Text(''),
          content: Form(
            key: _formKeys[2],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text('Parent Status'),
                const SizedBox(height: 10),
                Card(
                  child: Wrap(
                    spacing: 10,
                    children: ParentStatus.values.map((status) {
                      return ChoiceChip(
                        label: Text(status.toString().split('.').last),
                        selected: selectedParentStatus == status,
                        onSelected: (isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedParentStatus = status;
                            } else {
                              selectedParentStatus = null;
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                if (selectedParentStatus == ParentStatus.bothAlive)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fatherDetails(),
                      motherDetails(),
                    ],
                  ),
                if (selectedParentStatus == ParentStatus.fatherAlive)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Father Details'),
                      fatherDetails(),
                    ],
                  ),
                if (selectedParentStatus == ParentStatus.motherAlive)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      motherDetails(),
                    ],
                  ),
                if (selectedParentStatus == ParentStatus.bothDeceased)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      guardianDetails(),
                    ],
                  ),
                if (selectedParentStatus == ParentStatus.fatherDeceased)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      motherDetails(),
                    ],
                  ),
                if (selectedParentStatus == ParentStatus.motherDeceased)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fatherDetails(),
                    ],
                  ),
                if (selectedParentStatus == ParentStatus.singleMother)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      motherDetails(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ];

  Widget fatherDetails() {
    return Column(
      children: [
        TextFormField(
          controller: _controller.fatherName,
          decoration: const InputDecoration(label: Text(bFatherName)),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _controller.fatherNationalId,
          decoration: const InputDecoration(label: Text(bFatherNationalid)),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _controller.fatherOccupation,
          decoration: const InputDecoration(label: Text(bFatherOccupation)),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _controller.fatherPhoneNumber,
          decoration: const InputDecoration(label: Text(bFatherPhoneNo)),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _controller.fatherDisability,
          decoration: const InputDecoration(label: Text(bFatherDisable)),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _controller.ifFatherDisable,
          decoration: const InputDecoration(label: Text(bIfFatherDisable)),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget motherDetails() {
    return Column(children: [
      const Text('Mother Details'),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.motherName,
        decoration: const InputDecoration(label: Text(bMotherName)),
        keyboardType: TextInputType.text,
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.motherNationalId,
        decoration: const InputDecoration(label: Text(bMotherNationalid)),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.motherOccupation,
        decoration: const InputDecoration(label: Text(bMotherOccupation)),
        keyboardType: TextInputType.text,
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.motherPhoneNumber,
        decoration: const InputDecoration(label: Text(bMotherPhoneNo)),
        keyboardType: TextInputType.phone,
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.ifMotherDisable,
        decoration: const InputDecoration(label: Text(bIfMotherDisable)),
        keyboardType: TextInputType.text,
      ),
      const SizedBox(height: 20),
    ]);
  }

  Widget guardianDetails() {
    return Column(children: [
      const Text('Guardian Details'),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.guardianName,
        decoration: const InputDecoration(label: Text(bGuardianName)),
        keyboardType: TextInputType.text,
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.guardianNationalId,
        decoration: const InputDecoration(label: Text(bGuardianNationalid)),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.guardianOccupation,
        decoration: const InputDecoration(label: Text(bGuardianOccupation)),
        keyboardType: TextInputType.text,
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.guardianPhoneNumber,
        decoration: const InputDecoration(label: Text(bGuardianPhoneNo)),
        keyboardType: TextInputType.phone,
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.guardianDisability,
        decoration: const InputDecoration(label: Text(bIfGuardianDisable)),
        keyboardType: TextInputType.text,
      ),
      const SizedBox(height: 10),
      TextFormField(
        controller: _controller.ifGuardianDisable,
        decoration: const InputDecoration(label: Text(bIfGuardianDisable)),
        keyboardType: TextInputType.text,
      ),
    ]);
  }
}
