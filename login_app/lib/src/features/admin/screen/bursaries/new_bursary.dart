import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_controller.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_model.dart';

class NewBursaryScreen extends StatelessWidget {
  NewBursaryScreen({Key? key}) : super(key: key);

  final bursaryController = Get.put(BursaryController());

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
                  itemCount: bursaryController.bursaries.length,
                  itemBuilder: (context, index) {
                    final bursary = bursaryController.bursaries[index];
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
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deadline: ${bursary.deadline.toString()}",
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _showEditBursaryDialog(context, bursary);
                                    },
                                    child: const Text('Edit Bursary'),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      _showDeleteConfirmationDialog(
                                          context, bursary);
                                    },
                                    child: const Text('Delete Bursary'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
        DateTime? selectedDateTime;

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
                          final pickedDateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDateTime != null) {
                            // ignore: use_build_context_synchronously
                            final pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (pickedTime != null) {
                              final dateWithTime = DateTime(
                                pickedDateTime.year,
                                pickedDateTime.month,
                                pickedDateTime.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );

                              setState(() {
                                selectedDateTime = dateWithTime;
                              });
                            }
                          }
                        },
                        child: const Text('Select Deadline'),
                      ),
                    ),
                    const SizedBox(height: bDefaultSize - 20),
                    if (selectedDateTime != null)
                      Text(
                        'Deadline: ${DateFormat('yyyy-MM-dd hh:mm a').format(selectedDateTime!).replaceAll(RegExp(r':\d+\.\d+'), '')}',
                      ),

                  ],
                ),
              ),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedDateTime != null) {
                            bursaryController.createBursary(
                              title,
                              description,
                              selectedDateTime!,
                            );
                            Get.back();
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please select a deadline',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              colorText: Colors.red,
                            );
                          }
                        },
                        child: const Text('Create'),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditBursaryDialog(BuildContext context, BursaryModel bursary) {
    String updatedTitle = bursary.title;
    String updatedDescription = bursary.description;
    DateTime? updatedDeadline = bursary.deadline;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Edit Bursary'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Name'),
                      initialValue: updatedTitle,
                      onChanged: (value) {
                        updatedTitle = value;
                      },
                    ),
                    const SizedBox(height: bDefaultSize - 20),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      initialValue: updatedDescription,
                      onChanged: (value) {
                        updatedDescription = value;
                      },
                    ),
                    const SizedBox(height: bDefaultSize - 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: updatedDeadline ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              updatedDeadline = pickedDate;
                            });
                          }
                        },
                        child: const Text('Select Deadline'),
                      ),
                    ),
                    const SizedBox(height: bDefaultSize - 20),
                    if (updatedDeadline != null)
                      Text(
                        'Deadline: ${DateFormat('yyyy-MM-dd').format(updatedDeadline!)}',
                      ),
                  ],
                ),
              ),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform the update operation using the updated values
                          bursaryController.updateBursary(
                            bursary
                                .id!, // Pass the bursary ID for identification
                            updatedTitle,
                            updatedDescription,
                            updatedDeadline!, // Use the updated deadline if available, otherwise use the original deadline
                          );
                          Get.back();
                        },
                        child: const Text('Update'),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, BursaryModel bursary) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Bursary'),
          content: const Text('Are you sure you want to delete this bursary?'),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      bursaryController.deleteBursary(bursary.id!);
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
