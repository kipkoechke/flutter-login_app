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

bool isFatherSelected = false;
bool isMotherSelected = false;
bool isGuardianSelected = false;
bool isParentStatusSelected = false;

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
        stepIconBuilder: (stepIndex, stepState) {
          bool isStepComplete = stepState == StepState.complete;
          switch (stepIndex) {
            case 0:
              return isStepComplete
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.location_on, color: Colors.blue);
            case 1:
              return isStepComplete
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.person, color: Colors.green);
            case 2:
              return isStepComplete
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.family_restroom, color: Colors.orange);
            case 3:
              return isStepComplete
                  ? const Icon(Icons.check, color: Colors.green)
                  : const Icon(Icons.school, color: Colors.purple);
            default:
              return null; // Use default step icons
          }
        },
        // onStepTapped: (step) {
        //   setState(() {
        //     _currentStep = step;
        //   });
        // },
        onStepCancel: () {
          _currentStep == 0
              ? null
              : setState(() {
                  _currentStep -= 1;
                });
        },
        onStepContinue: () {
          if (isLastStep && _formKeys[_currentStep].currentState!.validate()) {
            if (isParentStatusSelected) {
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
                guardianPhoneNumber:
                    _controller.guardianPhoneNumber.text.trim(),
                guardianDisability: _controller.guardianDisability.text.trim(),
                ifGuardianDisable: _controller.ifGuardianDisable.text.trim(),
              );
              StudentDetailsController.instance.saveForm(applicationForm);
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text('Please select a parent status.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
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
                const Text(
                  'Kindly fill your location details below:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.subCounty,
                  decoration: const InputDecoration(
                    labelText: bSubCounty,
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your sub-county';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.ward,
                  decoration: const InputDecoration(
                    labelText: bWard,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your ward';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.location,
                  decoration: const InputDecoration(
                    labelText: bLocation,
                    prefixIcon: Icon(Icons.location_pin),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                  ],
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.subLocation,
                  decoration: const InputDecoration(
                    labelText: bSubLocation,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                  ],
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your sub-location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.village,
                  decoration: const InputDecoration(
                    labelText: bVillage,
                    prefixIcon: Icon(Icons.location_city),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                  ],
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your village';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1,
          title: const Text(''),
          content: Obx(
            () => Form(
              key: _formKeys[1],
              child: Column(
                children: [
                  const Text(
                    'Kindly fill your personal details below',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _controller.fullName,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z\s]")),
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _controller.admNumber,
                    decoration: const InputDecoration(
                      labelText: 'Admission Number',
                      prefixIcon: Icon(Icons.school),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your admission number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  _controller.buildGenderRadioButtons(),
                  const SizedBox(height: 10),
                  _controller.buildDateOfBirthDatePicker(),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _controller.phoneNo,
                    decoration: const InputDecoration(
                      prefixText: '+254 ',
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ],
              ),
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
              children: [
                const Text(
                  'Kindly fill your institution details below:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionName,
                  decoration: const InputDecoration(
                    labelText: binstitutionName,
                    prefixIcon: Icon(Icons.school),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the institution name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionAddress,
                  decoration: const InputDecoration(
                    labelText: binstitutionAddress,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the institution address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.institutionBankAccountNo,
                  decoration: const InputDecoration(
                    labelText: binstitutionBankAccountNo,
                    prefixIcon: Icon(Icons.account_balance),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the institution bank account number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankName,
                  decoration: const InputDecoration(
                    labelText: bbankName,
                    prefixIcon: Icon(Icons.money),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the bank name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankBranch,
                  decoration: const InputDecoration(
                    labelText: bbankBranch,
                    prefixIcon: Icon(Icons.location_on),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the bank branch';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller.bankCode,
                  decoration: const InputDecoration(
                    labelText: bbankCode,
                    prefixIcon: Icon(Icons.account_balance),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the bank code';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 3,
          title: const Text(''),
          content: Form(
            key: _formKeys[3],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Parent Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Form(
                  child: Card(
                    child: Wrap(
                      spacing: 20,
                      children: ParentStatus.values.map((status) {
                        return ChoiceChip(
                          label: Text(status.toString().split('.').last),
                          selected: selectedParentStatus == status,
                          onSelected: (isSelected) {
                            setState(() {
                              if (isSelected) {
                                selectedParentStatus = status;
                                // Update the selection status for each parent/guardian field accordingly
                                isFatherSelected =
                                    status == ParentStatus.fatherAlive ||
                                        status == ParentStatus.bothAlive ||
                                        status == ParentStatus.motherDeceased;
                                isMotherSelected =
                                    status == ParentStatus.motherAlive ||
                                        status == ParentStatus.bothAlive ||
                                        status == ParentStatus.singleMother ||
                                        status == ParentStatus.fatherDeceased;
                                isGuardianSelected =
                                    status == ParentStatus.bothDeceased;
                                isParentStatusSelected = true;
                              } else {
                                selectedParentStatus = null;
                                // Reset the selection status for each parent/guardian field when unselected
                                isFatherSelected = false;
                                isMotherSelected = false;
                                isGuardianSelected = false;
                                isParentStatusSelected = false;
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
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
    return Obx(
      () => Column(
        children: [
          const Text(
            'Kindly fill your father details below:',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            controller: _controller.fatherName,
            decoration: const InputDecoration(
              labelText: bFatherName,
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter father\'s name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.fatherNationalId,
            decoration: const InputDecoration(
              labelText: bFatherNationalid,
              prefixIcon: Icon(Icons.credit_card),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter father\'s national ID';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.fatherOccupation,
            decoration: const InputDecoration(
              labelText: bFatherOccupation,
              prefixIcon: Icon(Icons.work),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter father\'s occupation';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.fatherPhoneNumber,
            decoration: const InputDecoration(
              labelText: bFatherPhoneNo,
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter father\'s phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          _controller.buildFatherDisabilityRadioButtons(),
          const SizedBox(height: 10),
          if (_controller.fatherdisabilityChoice.value == 'Yes')
            TextFormField(
              controller: _controller.ncpwd,
              decoration: const InputDecoration(label: Text('Enter NCPD')),
              keyboardType: TextInputType.text,
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget motherDetails() {
    return Obx(
      () => Column(
        children: [
          const Text(
            'Kindly fill your mother details below:',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.motherName,
            decoration: const InputDecoration(
              labelText: bMotherName,
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your mother\'s name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.motherNationalId,
            decoration: const InputDecoration(
              labelText: bMotherNationalid,
              prefixIcon: Icon(Icons.credit_card),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your mother\'s national ID';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.motherOccupation,
            decoration: const InputDecoration(
              labelText: bMotherOccupation,
              prefixIcon: Icon(Icons.work),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your mother\'s occupation';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.motherPhoneNumber,
            decoration: const InputDecoration(
              labelText: bMotherPhoneNo,
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your mother\'s phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          _controller.buildMotherDisabilityRadioButtons(),
          const SizedBox(height: 10),
          if (_controller.motherdisabilityChoice.value == 'Yes')
            TextFormField(
              controller: _controller.ncpwd,
              decoration: const InputDecoration(label: Text('Enter NCPD')),
              keyboardType: TextInputType.text,
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget guardianDetails() {
    return Obx(
      () => Column(
        children: [
          const Text(
            'Kindly fill your guardian details below:',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.guardianName,
            decoration: const InputDecoration(
              labelText: 'Guardian Name',
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter guardian name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.guardianNationalId,
            decoration: const InputDecoration(
              labelText: 'Guardian National ID',
              prefixIcon: Icon(Icons.credit_card),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter guardian national ID';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.guardianOccupation,
            decoration: const InputDecoration(
              labelText: 'Guardian Occupation',
              prefixIcon: Icon(Icons.work),
            ),
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter guardian occupation';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _controller.guardianPhoneNumber,
            decoration: const InputDecoration(
              labelText: 'Guardian Phone Number',
              prefixIcon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter guardian phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          _controller.buildGuardianDisabilityRadioButtons(),
          const SizedBox(height: 10),
          if (_controller.guardiandisabilityChoice.value == 'Yes')
            TextFormField(
              controller: _controller.ncpwd,
              decoration: const InputDecoration(label: Text('Enter NCPD')),
              keyboardType: TextInputType.text,
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
