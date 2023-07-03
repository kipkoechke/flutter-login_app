import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_controller.dart';

class NewBursaryScreen extends StatelessWidget {
  NewBursaryScreen({super.key});

  final adminController = Get.put(BursaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _showCreateBursaryDialog();
              },
              child: const Text('Create Bursary'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Bursaries',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: adminController.bursaries.length,
                  itemBuilder: (context, index) {
                    final bursary = adminController.bursaries[index];
                    return ListTile(
                      title: Text(bursary.title),
                      subtitle: Text(bursary.deadline.toString()),
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

  void _showCreateBursaryDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        String name = '';
        DateTime? selectedDate;

        return AlertDialog(
          title: const Text('Create Bursary'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;
                  }
                },
                child: const Text('Select Deadline'),
              ),
              if (selectedDate != null)
                Text(
                    'Deadline: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}'),
            ],
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
                  adminController.createBursary(name, selectedDate!);
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
  }
}
