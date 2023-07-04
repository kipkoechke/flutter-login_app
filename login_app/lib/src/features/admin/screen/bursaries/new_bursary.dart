import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_controller.dart';

class NewBursaryScreen extends StatelessWidget {
  NewBursaryScreen({Key? key}) : super(key: key);

  final adminController = Get.put(BursaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bursaries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showCreateBursaryDialog(context);
                },
                child: const Text('New Bursary'),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Created Bursaries',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: adminController.bursaries.length,
                  itemBuilder: (context, index) {
                    final bursary = adminController.bursaries[index];
                    return Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Title: ${bursary.title}"),
                            const Divider(),
                            Text(bursary.description),
                            const Divider()
                          ],
                        ),
                        subtitle:
                            Text("Deadline: ${bursary.deadline.toString()}"),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateBursaryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';
        DateTime? selectedDate;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('New Bursary'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    const SizedBox(height: bDefaultSize - 20),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    const SizedBox(height: bDefaultSize - 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        child: const Text('Select Deadline'),
                      ),
                    ),
                    const SizedBox(height: bDefaultSize - 20),
                    if (selectedDate != null)
                      Text(
                        'Deadline: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                      ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (selectedDate != null) {
                      adminController.createBursary(
                        title,
                        description,
                        selectedDate!,
                      );
                      Get.back();
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please select a deadline',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        colorText: Colors.red,
                      );
                    }
                  },
                  child: const Text('Create'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
