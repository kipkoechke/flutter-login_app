import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_controller.dart';
import 'package:login_app/src/common_widgets/row_display.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/fcm_repository/fcm_repository.dart';

class PendingApplicationsScreen extends StatelessWidget {
  const PendingApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PendingApplicationsController());
    final approve = Get.put(ApprovedApplicationController());
    final decline = Get.put(DeclinedApplicationsController());

    final fcm = Get.put(FCMController());
    final deviceToken = fcm.deviceToken;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(
            controller.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(4),

          //-- Fetching data for pending applications
          child: StreamBuilder<List<ApplicationFormModel>>(
            stream: controller.getPendingApplications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<ApplicationFormModel> userApplication = snapshot.data!;
                  if (userApplication.isEmpty) {
                    return const Center(
                      child: Text("No Pending Applications"),
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
                                child: Container(
                                  margin: const EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Card(
                                        child: Column(children: [
                                          const Text('Location Details'),
                                          const Divider(),
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
                                      Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Personal Details'),
                                            const Divider(),
                                            Row(
                                              children: [
                                                RowDisplay(
                                                    keyy: "Full Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .fullName),
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
                                                            .phoneNo),
                                                RowDisplay(
                                                    keyy: "Gender",
                                                    valuee:
                                                        userApplication[index]
                                                            .gender
                                                            .toString()),
                                                RowDisplay(
                                                  keyy: "Date Of Birth",
                                                  valuee: userApplication[index]
                                                      .dateOfBirth
                                                      .toString(),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          children: [
                                            const Text('School Details'),
                                            const Divider(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Institution's Name",
                                                    valuee:
                                                        userApplication[index]
                                                            .institutionName),
                                                RowDisplay(
                                                    keyy:
                                                        "Institution's Address",
                                                    valuee: userApplication[
                                                            index]
                                                        .institutionAddress),
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
                                      Card(
                                        child: Column(
                                          children: [
                                            const Text('Father Details'),
                                            const Divider(),
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
                                                            .fatherDisability
                                                            .toString())
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          children: [
                                            const Text("Mother Details"),
                                            const Divider(),
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
                                                    keyy: "Disabled",
                                                    valuee:
                                                        userApplication[index]
                                                            .ifMotherDisable),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Occupation",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherOccupation),
                                                RowDisplay(
                                                    keyy: "Phone",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherPhoneNumber),
                                                RowDisplay(
                                                    keyy: "Disability",
                                                    valuee:
                                                        userApplication[index]
                                                            .motherDisability
                                                            .toString())
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Guardian Details"),
                                            const Divider(),
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
                                                    keyy: "National ID",
                                                    valuee: userApplication[
                                                            index]
                                                        .guardianNationalId),
                                                RowDisplay(
                                                    keyy: "National ID",
                                                    valuee:
                                                        userApplication[index]
                                                            .ifGuardianDisable),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                RowDisplay(
                                                    keyy: "Occupation",
                                                    valuee: userApplication[
                                                            index]
                                                        .guardianOccupation),
                                                RowDisplay(
                                                    keyy: "Phone",
                                                    valuee: userApplication[
                                                            index]
                                                        .guardianPhoneNumber),
                                                RowDisplay(
                                                    keyy: "Disability",
                                                    valuee:
                                                        userApplication[index]
                                                            .guardianDisability
                                                            .toString())
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                approve.approveApplication(
                                                    userApplication[index].id!);
                                                fcm.sendApplicationApprovedNotification(
                                                    deviceToken!);
                                                Get.back();
                                              },
                                              child: const Text('Approve'),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () {
                                                decline.showDeclineReasonDialog(
                                                    userApplication[index].id!);

                                                // decline.declineApplication(
                                                //     userApplication[index].id!);
                                                fcm.sendApplicationDeclinedNotification(
                                                    deviceToken!);
                                                Get.back();
                                              },
                                              child: const Text('Decline'),
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
                                "Name: ${userApplication[index].fullName}",
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(userApplicationData.phoneNo),
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
                  return Container();
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
