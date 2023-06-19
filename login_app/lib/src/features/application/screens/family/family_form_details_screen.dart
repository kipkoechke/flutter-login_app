import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/application/controllers/family_details_controller.dart';
import 'package:login_app/src/features/application/models/family_model.dart';
import 'package:login_app/src/features/application/screens/family/parents_status.dart';

class FamilyDetailsForm extends StatelessWidget {
  const FamilyDetailsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FamilyDetailsController());
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your father's details",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.fatherName,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.fatherNationalId,
                  decoration: const InputDecoration(
                    labelText: "National ID",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.fatherOccupation,
                  decoration: const InputDecoration(
                    labelText: "Occupation",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.fatherPhoneNumber,
                  decoration: const InputDecoration(
                    labelText: "Father's Phone Number",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.fatherDisability,
                  decoration: const InputDecoration(
                    labelText: "Father's Disability (Yes/No)",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.ifFatherDisable,
                  decoration: const InputDecoration(
                    labelText: "NCPWD",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 10),
                const Text(
                  "Enter your mother's details",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.motherName,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.motherNationalId,
                  decoration: const InputDecoration(
                    labelText: "National ID",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.motherOccupation,
                  decoration: const InputDecoration(
                    labelText: "Occupation",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.motherPhoneNumber,
                  decoration: const InputDecoration(
                    labelText: "Mother's Phone Number",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.motherDisability,
                  decoration: const InputDecoration(
                    labelText: "Mother's Disability (Yes/No)",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.ifMotherDisable,
                  decoration: const InputDecoration(
                    labelText: "NCPWD",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 10),
                const Text(
                  "Enter your guardian's details",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.guardianName,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.guardianNationalId,
                  decoration: const InputDecoration(
                    labelText: "National ID",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.guardianOccupation,
                  decoration: const InputDecoration(
                    labelText: "Occupation",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.guardianPhoneNumber,
                  decoration: const InputDecoration(
                    labelText: "Guardian's Phone Number",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.guardianDisability,
                  decoration: const InputDecoration(
                    labelText: "Guardian's Disability (Yes/No)",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 20),
                TextFormField(
                  controller: controller.ifGuardianDisable,
                  decoration: const InputDecoration(
                    labelText: "NCPWD",
                  ),
                ),
                const SizedBox(height: bDefaultSize - 10),
                const ParentStatusDropdown(),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final family = FamilyModel(
                              //-- Family Details

                              fatherName: controller.fatherName.text.trim(),
                              fatherNationalId:
                                  controller.fatherNationalId.text.trim(),
                              fatherOccupation:
                                  controller.fatherOccupation.text.trim(),
                              fatherPhoneNumber:
                                  controller.fatherPhoneNumber.text.trim(),
                              fatherDisability:
                                  controller.fatherDisability.text.trim(),
                              ifFatherDisable:
                                  controller.ifFatherDisable.text.trim(),
                              motherName: controller.motherName.text.trim(),
                              motherNationalId:
                                  controller.motherNationalId.text.trim(),
                              motherOccupation:
                                  controller.motherOccupation.text.trim(),
                              motherPhoneNumber:
                                  controller.motherPhoneNumber.text.trim(),
                              motherDisability:
                                  controller.motherDisability.text.trim(),
                              ifMotherDisable:
                                  controller.ifMotherDisable.text.trim(),
                              guardianName: controller.guardianName.text.trim(),
                              guardianNationalId:
                                  controller.guardianNationalId.text.trim(),
                              guardianOccupation:
                                  controller.guardianOccupation.text.trim(),
                              guardianPhoneNumber:
                                  controller.guardianPhoneNumber.text.trim(),
                              guardianDisability:
                                  controller.guardianDisability.text.trim(),
                              ifGuardianDisable:
                                  controller.ifGuardianDisable.text.trim(),
                            );
                            FamilyDetailsController.instance
                                .createFamily(family);
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
