import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/admin/controller/admin_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(bDefaultSize),
          child: StreamBuilder(
            stream: controller.userApplicationData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.waiting) {
                final userApplicationData =
                    snapshot.data as ApplicationFormModel;
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    ListTile(
                      iconColor: Colors.blue,
                      tileColor: Colors.blue.withOpacity(0.1),
                      leading: const Icon(LineAwesomeIcons.user_1),
                      title: Text("Name: ${userApplicationData.fullName}"),
                      subtitle: Column(
                        children: [
                          // Text(userApplicationData.phoneNo),
                          Text(userApplicationData.admNumber),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Form(
                            child: Column(
                              children: [
                                const Text('Applicant location details'),
                                TextFormField(
                                  initialValue: userApplicationData.subCounty,
                                  decoration: const InputDecoration(
                                      labelText: bSubCounty),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.ward,
                                  decoration:
                                      const InputDecoration(labelText: bWard),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.location,
                                  decoration: const InputDecoration(
                                      labelText: bLocation),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.subLocation,
                                  decoration: const InputDecoration(
                                      labelText: bSubLocation),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.village,
                                  decoration: const InputDecoration(
                                      labelText: bVillage),
                                ),
                                const SizedBox(height: 10),
                                const Text('Applicant personal details:'),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.fullName,
                                  decoration: const InputDecoration(
                                      labelText: bFullName),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.admNumber,
                                  decoration: const InputDecoration(
                                      labelText: bAdmNumber),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.gender,
                                  decoration:
                                      InputDecoration(labelText: bGender!),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: DateFormat('yyyy-MM-dd')
                                      .format(userApplicationData.dateOfBirth!),
                                  decoration: InputDecoration(
                                      labelText: bDateOfBirth.toString()),
                                ),
                                const Text('Applicant school details:'),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      userApplicationData.institutionName,
                                  decoration: const InputDecoration(
                                      labelText: binstitutionName),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      userApplicationData.institutionAddress,
                                  decoration: const InputDecoration(
                                      labelText: binstitutionAddress),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData
                                      .institutionBankAccountNo,
                                  decoration: const InputDecoration(
                                      labelText: binstitutionBankAccountNo),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.bankName,
                                  decoration: const InputDecoration(
                                      labelText: bbankName),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.bankBranch,
                                  decoration: const InputDecoration(
                                      labelText: bbankBranch),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue: userApplicationData.bankCode,
                                  decoration: const InputDecoration(
                                      labelText: bbankCode),
                                ),
                                const SizedBox(height: 10),
                                const Text('Applicant family details:'),
                                TextFormField(
                                  initialValue: userApplicationData.fatherName,
                                  decoration: const InputDecoration(
                                      labelText: bFatherName),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      userApplicationData.fatherNationalId,
                                  decoration: const InputDecoration(
                                      labelText: bFatherNationalid),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      userApplicationData.fatherPhoneNumber,
                                  decoration: const InputDecoration(
                                      labelText: bFatherPhoneNo),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      userApplicationData.fatherOccupation,
                                  decoration: const InputDecoration(
                                      labelText: bFatherOccupation),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  initialValue:
                                      userApplicationData.fatherDisability,
                                  decoration: InputDecoration(
                                      labelText: bFatherDisable),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(LineAwesomeIcons.angle_right),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              } else {
                return const Center(
                  child: Text("No data found."),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
