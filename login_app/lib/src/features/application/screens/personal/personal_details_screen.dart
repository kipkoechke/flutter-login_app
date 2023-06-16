import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/application/controllers/personal_details_controller.dart';
import 'package:login_app/src/features/application/models/personal_model.dart';

class PersonalDetailsFormScreen extends StatelessWidget {
  final controller = Get.put(PersonalDetailsController());

  PersonalDetailsFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(bDefaultSize),
          child: Column(
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: bDefaultSize - 20),
              TextFormField(
                controller: controller.nationalId,
                decoration: const InputDecoration(labelText: 'National ID'),
              ),
              const SizedBox(height: bDefaultSize - 20),
              TextFormField(
                controller: controller.regNumber,
                decoration:
                    const InputDecoration(labelText: 'Registration Number'),
              ),
              const SizedBox(height: bDefaultSize - 20),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: bDefaultSize - 20),
              Obx(
                () => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ListTile(
                    title: const Text('Date of Birth'),
                    subtitle: Text(
                      controller.dateOfBirth.value != null
                          ? DateFormat('dd-MM-yyyy')
                              .format(controller.dateOfBirth.value!)
                          : 'Select a date',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      const Text('Gender: '),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Male',
                              groupValue: controller.gender.value,
                              onChanged: (value) =>
                                  controller.gender.value = value,
                            ),
                            const Text('Male'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Radio<String>(
                              value: 'Female',
                              groupValue: controller.gender.value,
                              onChanged: (value) =>
                                  controller.gender.value = value,
                            ),
                            const Text('Female'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text(
                          'Are you a regular or privately sponsored student? '),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Regular'),
                              value: 'Regular',
                              groupValue: controller.regularOrPrivate.value,
                              onChanged: (value) =>
                                  controller.regularOrPrivate.value = value,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Private'),
                              value: 'Private',
                              groupValue: controller.regularOrPrivate.value,
                              onChanged: (value) =>
                                  controller.regularOrPrivate.value = value,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: bDefaultSize - 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final personal = PersonalModel(
                        fullName: controller.fullName.text.trim(),
                        nationalId: controller.nationalId.text.trim(),
                        regNumber: controller.regNumber.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                        // dateOfBirth: controller.dateOfBirth.value,
                        // gender: controller.gender.value,
                        // regularOrPrivate:
                        //     controller.regularOrPrivate.value,
                      );
                      PersonalDetailsController.instance
                          .createPersonal(personal);
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2023, 12, 31), // Adjust the last date accordingly
    );
    if (pickedDate != null) {
      controller.dateOfBirth.value = pickedDate;
    }
  }
}
