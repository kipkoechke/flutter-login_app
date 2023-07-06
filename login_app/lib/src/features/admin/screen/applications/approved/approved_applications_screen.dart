import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/admin/screen/applications/allocation_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class ApprovedApplicationScreen extends StatelessWidget {
  const ApprovedApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApprovedApplicationController());
    final allocate = Get.put(AllocationController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            controller.title,
            style: Theme.of(context).textTheme.copyWith().titleLarge,
          ),
        ),
        body: Card(
          //padding: const EdgeInsets.all(bDefaultSize),
          child: StreamBuilder<List<ApplicationFormModel>>(
            stream: controller.getApprovedApplication(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<ApplicationFormModel> userApplication = snapshot.data!;
                  return ListView.builder(
                    itemCount: userApplication.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              TextEditingController amountController =
                                  TextEditingController();

                              return AlertDialog(
                                title: const Text('Allocate Amount'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: amountController,
                                      decoration: const InputDecoration(
                                        labelText: 'Amount',
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      String allocatedAmount =
                                          amountController.text;
                                      // Validate the entered amount
                                      if (allocatedAmount.isNotEmpty) {
                                        // Parse the amount to a numeric value (you can customize this based on your requirements)
                                        double amount =
                                            double.tryParse(allocatedAmount) ??
                                                0.0;

                                        // Perform the allocation logic
                                        ApplicationFormModel application =
                                            userApplication[index];
                                        // Update the application with the allocated amount
                                        application.allocatedAmount = amount;
                                        allocate.allocateAmount(
                                            application.id!, amount);
                                        // Save the updated application or perform any other necessary actions

                                        // Close the dialog
                                        Get.back();
                                      } else {
                                        // Show an error message if the amount is not entered
                                        Get.snackbar('Error',
                                            'Please enter the amount to allocate');
                                      }
                                    },
                                    child: const Text('Allocate'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading: const Icon(LineAwesomeIcons.user_1),
                            title: Text(
                                "Name: ${userApplication[index].fullName}"),
                            subtitle: Column(
                              children: [
                                Text(userApplication[index].admNumber),
                              ],
                            ),
                            trailing: const Icon(LineAwesomeIcons.angle_right),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("No Pending Applications"),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
