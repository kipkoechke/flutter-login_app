import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class DeclinedApplicationsScreen extends StatelessWidget {
  const DeclinedApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DeclinedApplicationsController());
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
        ),
        body: Card(
          //padding: const EdgeInsets.all(bDefaultSize),

          //-- Fetching data for all users
          child: StreamBuilder<List<ApplicationFormModel>>(
            stream: controller.getDeclinedApplication(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  //-- Fetching data for all users
                  List<ApplicationFormModel> userApplication = snapshot.data!;
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
                                margin: const EdgeInsets.all(10),
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
                                      subtitle:
                                          Text(userApplication[index].location),
                                    ),
                                    ListTile(
                                      title: const Text('Sub Location'),
                                      subtitle: Text(
                                          userApplication[index].subLocation),
                                    ),
                                    ListTile(
                                      title: const Text('Village'),
                                      subtitle:
                                          Text(userApplication[index].village),
                                    ),
                                    const Divider(),
                                    const ListTile(
                                      title: Text('Personal Details'),
                                    ),
                                    ListTile(
                                      title: const Text('Full Name'),
                                      subtitle:
                                          Text(userApplication[index].fullName),
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
                                      subtitle:
                                          Text(userApplication[index].phoneNo),
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
                                      title:
                                          const Text('Institution\'s Address'),
                                      subtitle: Text(userApplication[index]
                                          .institutionAddress),
                                    ),
                                    ListTile(
                                      title: const Text('Institution\'s Name'),
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
                                      subtitle:
                                          Text(userApplication[index].bankName),
                                    ),
                                    ListTile(
                                      title: const Text('Bank Branch'),
                                      subtitle: Text(
                                          userApplication[index].bankBranch),
                                    ),
                                    ListTile(
                                      title: const Text('Bank Code'),
                                      subtitle:
                                          Text(userApplication[index].bankCode),
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
                                      title: const Text('Father Phone Number'),
                                      subtitle: Text(userApplication[index]
                                          .fatherPhoneNumber),
                                    ),
                                    ListTile(
                                      title: const Text('Father Disability'),
                                      subtitle: Text(userApplication[index]
                                          .fatherDisability),
                                    ),
                                    ListTile(
                                      title: const Text('If Father is Disable'),
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
                                      title: const Text('Mother Phone Number'),
                                      subtitle: Text(userApplication[index]
                                          .motherPhoneNumber),
                                    ),
                                    ListTile(
                                      title: const Text('Mother Disability'),
                                      subtitle: Text(userApplication[index]
                                          .motherDisability),
                                    ),
                                    ListTile(
                                      title: const Text('If Mother is Disable'),
                                      subtitle: Text(userApplication[index]
                                          .ifMotherDisable),
                                    ),
                                    ListTile(
                                      title: const Text('Guardian Name'),
                                      subtitle: Text(
                                          userApplication[index].guardianName),
                                    ),
                                    ListTile(
                                      title: const Text('Guardian National ID'),
                                      subtitle: Text(userApplication[index]
                                          .guardianNationalId),
                                    ),
                                    ListTile(
                                      title: const Text('Guardian Occupation'),
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
                                      title: const Text('Guardian Disability'),
                                      subtitle: Text(userApplication[index]
                                          .guardianDisability),
                                    ),
                                    ListTile(
                                      title:
                                          const Text('If Guardian is Disable'),
                                      subtitle: Text(userApplication[index]
                                          .ifGuardianDisable),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text('Approve'),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: OutlinedButton(
                                            onPressed: () {
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
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: Card(
                            child: ListTile(
                              iconColor: Colors.blue,
                              tileColor: Colors.blue.withOpacity(0.1),
                              leading: const Icon(LineAwesomeIcons.user_1),
                              title: Text(
                                  "Name: ${userApplication[index].fullName}"),
                              subtitle: Column(
                                children: [
                                  // Text(userApplicationData.phoneNo),
                                  Text(userApplication[index].admNumber),
                                ],
                              ),
                              trailing:
                                  const Icon(LineAwesomeIcons.angle_right),
                            ),
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
