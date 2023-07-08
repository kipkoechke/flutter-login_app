import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/admin/screen/applications/allocation_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class ApprovedApplicationScreen extends StatelessWidget {
  const ApprovedApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApprovedApplicationController());
    final allocate = Get.put(AllocationController());
    final decline = Get.put(DeclinedApplicationsController());
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
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(4),
          child: StreamBuilder<List<ApplicationFormModel>>(
            stream: controller.getApprovedApplication(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<ApplicationFormModel> userApplication = snapshot.data!;
                  if (userApplication.isEmpty) {
                    return const Center(
                      child: Text("No Approved Applications"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: userApplication.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              useSafeArea: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                child: Card(
                                  //margin: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      const ListTile(
                                        title: Text('Location Details'),
                                      ),
                                      ListTile(
                                        title: const Text('Sub County'),
                                        subtitle: Text(
                                            userApplication[index].subCounty),
                                      ),
                                      ListTile(
                                        title: const Text('Ward'),
                                        subtitle:
                                            Text(userApplication[index].ward),
                                      ),
                                      ListTile(
                                        title: const Text('Location'),
                                        subtitle: Text(
                                            userApplication[index].location),
                                      ),
                                      ListTile(
                                        title: const Text('Sub Location'),
                                        subtitle: Text(
                                            userApplication[index].subLocation),
                                      ),
                                      ListTile(
                                        title: const Text('Village'),
                                        subtitle: Text(
                                            userApplication[index].village),
                                      ),
                                      const Divider(),
                                      const ListTile(
                                        title: Text('Personal Details'),
                                      ),
                                      ListTile(
                                        title: const Text('Full Name'),
                                        subtitle: Text(
                                            userApplication[index].fullName),
                                      ),
                                      ListTile(
                                        title: const Text('National ID'),
                                        subtitle: Text(
                                            userApplication[index].nationalId),
                                      ),
                                      ListTile(
                                        title: const Text('Admission Number'),
                                        subtitle: Text(
                                            userApplication[index].admNumber),
                                      ),
                                      ListTile(
                                        title: const Text('Phone Number'),
                                        subtitle: Text(
                                            userApplication[index].phoneNo),
                                      ),
                                      const Divider(),
                                      const ListTile(
                                        title: Text('School Details'),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Institution\'s County'),
                                        subtitle: Text(userApplication[index]
                                            .institutionCounty),
                                      ),
                                      ListTile(
                                        title: const Text(
                                            'Institution\'s Address'),
                                        subtitle: Text(userApplication[index]
                                            .institutionAddress),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Institution\'s Name'),
                                        subtitle: Text(userApplication[index]
                                            .institutionName),
                                      ),
                                      ListTile(
                                        title: const Text(
                                            'Institution\'s Bank Account No'),
                                        subtitle: Text(userApplication[index]
                                            .institutionBankAccountNo),
                                      ),
                                      ListTile(
                                        title: const Text('Bank Name'),
                                        subtitle: Text(
                                            userApplication[index].bankName),
                                      ),
                                      ListTile(
                                        title: const Text('Bank Branch'),
                                        subtitle: Text(
                                            userApplication[index].bankBranch),
                                      ),
                                      ListTile(
                                        title: const Text('Bank Code'),
                                        subtitle: Text(
                                            userApplication[index].bankCode),
                                      ),
                                      const Divider(),
                                      const ListTile(
                                        title: Text('Family Details'),
                                      ),
                                      ListTile(
                                        title: const Text('Father Name'),
                                        subtitle: Text(
                                            userApplication[index].fatherName),
                                      ),
                                      ListTile(
                                        title: const Text('Father National ID'),
                                        subtitle: Text(userApplication[index]
                                            .fatherNationalId),
                                      ),
                                      ListTile(
                                        title: const Text('Father Occupation'),
                                        subtitle: Text(userApplication[index]
                                            .fatherOccupation),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Father Phone Number'),
                                        subtitle: Text(userApplication[index]
                                            .fatherPhoneNumber),
                                      ),
                                      ListTile(
                                        title: const Text('Father Disability'),
                                        subtitle: Text(userApplication[index]
                                            .fatherDisability),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('If Father is Disable'),
                                        subtitle: Text(userApplication[index]
                                            .ifFatherDisable),
                                      ),
                                      ListTile(
                                        title: const Text('Mother Name'),
                                        subtitle: Text(
                                            userApplication[index].motherName),
                                      ),
                                      ListTile(
                                        title: const Text('Mother National ID'),
                                        subtitle: Text(userApplication[index]
                                            .motherNationalId),
                                      ),
                                      ListTile(
                                        title: const Text('Mother Occupation'),
                                        subtitle: Text(userApplication[index]
                                            .motherOccupation),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Mother Phone Number'),
                                        subtitle: Text(userApplication[index]
                                            .motherPhoneNumber),
                                      ),
                                      ListTile(
                                        title: const Text('Mother Disability'),
                                        subtitle: Text(userApplication[index]
                                            .motherDisability),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('If Mother is Disable'),
                                        subtitle: Text(userApplication[index]
                                            .ifMotherDisable),
                                      ),
                                      ListTile(
                                        title: const Text('Guardian Name'),
                                        subtitle: Text(userApplication[index]
                                            .guardianName),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Guardian National ID'),
                                        subtitle: Text(userApplication[index]
                                            .guardianNationalId),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Guardian Occupation'),
                                        subtitle: Text(userApplication[index]
                                            .guardianOccupation),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Guardian Phone Number'),
                                        subtitle: Text(userApplication[index]
                                            .guardianPhoneNumber),
                                      ),
                                      ListTile(
                                        title:
                                            const Text('Guardian Disability'),
                                        subtitle: Text(userApplication[index]
                                            .guardianDisability),
                                      ),
                                      ListTile(
                                        title: const Text(
                                            'If Guardian is Disable'),
                                        subtitle: Text(userApplication[index]
                                            .ifGuardianDisable),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    TextEditingController
                                                        amountController =
                                                        TextEditingController();

                                                    return AlertDialog(
                                                      title: const Text(
                                                          'Allocate Amount'),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          TextField(
                                                            controller:
                                                                amountController,
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  'Amount',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            String
                                                                allocatedAmount =
                                                                amountController
                                                                    .text;
                                                            // Validate the entered amount
                                                            if (allocatedAmount
                                                                .isNotEmpty) {
                                                              // Parse the amount to a numeric value (you can customize this based on your requirements)
                                                              double amount =
                                                                  double.tryParse(
                                                                          allocatedAmount) ??
                                                                      0.0;

                                                              // Perform the allocation logic
                                                              ApplicationFormModel
                                                                  application =
                                                                  userApplication[
                                                                      index];
                                                              // Update the application with the allocated amount
                                                              application
                                                                      .allocatedAmount =
                                                                  amount;
                                                              allocate
                                                                  .allocateAmount(
                                                                      application
                                                                          .id!,
                                                                      amount);
                                                              // Save the updated application or perform any other necessary actions

                                                              // Close the dialog
                                                              Get.back();
                                                            } else {
                                                              // Show an error message if the amount is not entered
                                                              Get.snackbar(
                                                                  'Error',
                                                                  'Please enter the amount to allocate');
                                                            }
                                                          },
                                                          child: const Text(
                                                              'Allocate'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          child: const Text(
                                                              'Cancel'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: const Text('Allocate'),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () {
                                                decline.declineApplication(
                                                    userApplication[index].id!);
                                                Get.back();
                                              },
                                              child: const Text('Reject'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Card(
                            child: ListTile(
                              // iconColor: Colors.blue,
                              // tileColor: Colors.blue.withOpacity(0.1),
                              leading: const Icon(LineAwesomeIcons.user_1),
                              title: Text(
                                  "Name: ${userApplication[index].fullName}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Reg No: ${userApplication[index].admNumber}",
                                  ),
                                  Text(
                                    "Institution: ${userApplication[index].institutionName}",
                                  ),
                                ],
                              ),
                              trailing:
                                  const Icon(LineAwesomeIcons.angle_right),
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center();
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
