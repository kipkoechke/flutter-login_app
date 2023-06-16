import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/application/controllers/school_details_controller.dart';
import 'package:login_app/src/features/application/models/school_model.dart';

class SchoolFormDetailsScreen extends StatelessWidget {
  final controller = Get.put(SchoolDetailsController());

  SchoolFormDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(bDefaultSize - 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: controller.institutionCounty,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: "Institution's County",
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
              TextFormField(
                controller: controller.institutionAddress,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: "Institution's Address",
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
              TextFormField(
                controller: controller.institutionName,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: "Institution's Name",
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
              TextFormField(
                controller: controller.institutionBankAccountNo,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: "Institution Bank Account No",
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.bankName,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.description),
                        labelText: "Bank Name",
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      controller: controller.bankBranch,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.description),
                        labelText: "Bank Branch",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: bDefaultSize - 20),
              TextFormField(
                controller: controller.bankCode,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.code),
                  labelText: "Bank Code",
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
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
                        final school = SchoolModel(
                          institutionCounty:
                              controller.institutionCounty.text.trim(),
                          institutionAddress:
                              controller.institutionAddress.text.trim(),
                          institutionName:
                              controller.institutionName.text.trim(),
                          institutionBankAccountNo:
                              controller.institutionBankAccountNo.text.trim(),
                          bankName: controller.bankName.text.trim(),
                          bankBranch: controller.bankBranch.text.trim(),
                          bankCode: controller.bankCode.text.trim(),
                        );
                        SchoolDetailsController.instance.createSchool(school);
                      },
                      child: const Text('Complete'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
