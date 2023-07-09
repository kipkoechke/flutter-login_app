import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/admin/screen/applications/allocation_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/admin/widgets/row_display.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/fcm_repository/fcm_repository.dart';

class ApprovedApplicationScreen extends StatelessWidget {
  const ApprovedApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApprovedApplicationController());
    final allocate = Get.put(AllocationController());
    final decline = Get.put(DeclinedApplicationsController());
    final fcm = Get.put(FCMController());
    final deviceToken = fcm.deviceToken;
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
                                      Card(
                                        child: Column(children: [
                                          const ListTile(
                                            title: Text('Location Details'),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RowDisplay(
                                                keyy: "Sub County",
                                                valuee: userApplication[index]
                                                    .subCounty,
                                              ),
                                              RowDisplay(
                                                keyy: "Ward",
                                                valuee:
                                                    userApplication[index].ward,
                                              ),
                                              RowDisplay(
                                                keyy: "Location",
                                                valuee: userApplication[index]
                                                    .location,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RowDisplay(
                                                  keyy: "Sub Location",
                                                  valuee: userApplication[index]
                                                      .subLocation),
                                              RowDisplay(
                                                  keyy: "Village",
                                                  valuee: userApplication[index]
                                                      .village)
                                            ],
                                          )
                                        ]),
                                      ),
                                      const Divider(),
                                      Card(
                                        child: Column(
                                          children: [
                                            const ListTile(
                                              title: Text('Personal Details'),
                                            ),
                                            Row(
                                              children: [
                                                RowDisplay(
                                                    keyy: "Full Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .fullName),
                                                RowDisplay(
                                                    keyy: "National ID",
                                                    valuee:
                                                        userApplication[index]
                                                            .nationalId),
                                                RowDisplay(
                                                    keyy: "Admission Number",
                                                    valuee:
                                                        userApplication[index]
                                                            .admNumber),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Phone Number",
                                                    valuee:
                                                        userApplication[index]
                                                            .phoneNo)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Card(
                                        child: Column(
                                          children: [
                                            const ListTile(
                                              title: Text('School Details'),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy:
                                                        "Institution's County",
                                                    valuee:
                                                        userApplication[index]
                                                            .institutionCounty),
                                                RowDisplay(
                                                    keyy:
                                                        "Institution's Address",
                                                    valuee: userApplication[
                                                            index]
                                                        .institutionAddress),
                                                RowDisplay(
                                                    keyy: "Institution's Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .institutionName)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy:
                                                        "Institution's Bank Account No",
                                                    valuee: userApplication[
                                                            index]
                                                        .institutionBankAccountNo),
                                                RowDisplay(
                                                    keyy: "Bank Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .bankName)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Bank Branch",
                                                    valuee:
                                                        userApplication[index]
                                                            .bankBranch),
                                                RowDisplay(
                                                    keyy: "Bank Code",
                                                    valuee:
                                                        userApplication[index]
                                                            .bankCode)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Card(
                                        child: Column(
                                          children: [
                                            const ListTile(
                                              title: Text('Father Details'),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: " Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .fatherName),
                                                RowDisplay(
                                                    keyy: " National ID",
                                                    valuee:
                                                        userApplication[index]
                                                            .fatherNationalId),
                                                RowDisplay(
                                                    keyy: "Disabled",
                                                    valuee:
                                                        userApplication[index]
                                                            .ifFatherDisable)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: " Occupation",
                                                    valuee:
                                                        userApplication[index]
                                                            .fatherOccupation),
                                                RowDisplay(
                                                    keyy: " Phone Number",
                                                    valuee:
                                                        userApplication[index]
                                                            .fatherPhoneNumber),
                                                RowDisplay(
                                                    keyy: "Disability",
                                                    valuee:
                                                        userApplication[index]
                                                            .fatherDisability)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          children: [
                                            const Text("Mother Details"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherName),
                                                RowDisplay(
                                                    keyy: "National ID",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherNationalId),
                                                RowDisplay(
                                                    keyy: "Occupation",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherOccupation)
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Phone",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherPhoneNumber),
                                                RowDisplay(
                                                    keyy: "Disability",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherDisability)
                                              ],
                                            ),
                                            ListTile(
                                              title: const Text(
                                                  'If Mother is Disable'),
                                              subtitle: Text(
                                                  userApplication[index]
                                                      .ifMotherDisable),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          children: [
                                            const Text("Guardian Details"),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .guardianName),
                                                RowDisplay(
                                                    keyy: "ID",
                                                    valuee: userApplication[
                                                            index]
                                                        .guardianNationalId),
                                                RowDisplay(
                                                    keyy: "Occupation",
                                                    valuee:
                                                        userApplication[index]
                                                            .guardianOccupation)
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                RowDisplay(
                                                    keyy: "Phone",
                                                    valuee: userApplication[
                                                            index]
                                                        .guardianPhoneNumber),
                                                RowDisplay(
                                                    keyy: "Disability",
                                                    valuee:
                                                        userApplication[index]
                                                            .guardianDisability)
                                              ],
                                            ),
                                            ListTile(
                                              title: const Text(
                                                  'If Guardian is Disable'),
                                              subtitle: Text(
                                                  userApplication[index]
                                                      .ifGuardianDisable),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Card(
                                        child: Row(
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
                                                                // Parse the amount to a numeric value
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
                                                                allocate.allocateAmount(
                                                                    application
                                                                        .id!,
                                                                    amount);
                                                                // Send allocation notification
                                                                fcm.sendFundsAllocatedNotification(
                                                                    deviceToken!);
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
                                                  decline
                                                      .showDeclineReasonDialog(
                                                          userApplication[index]
                                                              .id!);
                                                  fcm.sendApplicationDeclinedNotification(
                                                      deviceToken!);
                                                  Get.back();
                                                },
                                                child: const Text('Reject'),
                                              ),
                                            )
                                          ],
                                        ),
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
