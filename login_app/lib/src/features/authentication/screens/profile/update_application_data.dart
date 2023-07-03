import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/profile_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class UpdateApplicationData extends StatelessWidget {
  const UpdateApplicationData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(bDefaultSize),
          child: StreamBuilder(
            stream: controller.getUserApplicationData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  ApplicationFormModel userApplicationData =
                      snapshot.data!;
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Form(
                        child: Column(
                          children: [
                            const Text('Applicant location details'),
                            TextFormField(
                              initialValue: userApplicationData.subCounty,
                              decoration: const InputDecoration(
                                  label: Text(bSubCounty)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.ward,
                              decoration:
                                  const InputDecoration(label: Text(bWard)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.location,
                              decoration:
                                  const InputDecoration(label: Text(bLocation)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.subLocation,
                              decoration: const InputDecoration(
                                  label: Text(bSubLocation)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.village,
                              decoration:
                                  const InputDecoration(label: Text(bVillage)),
                            ),
                            const SizedBox(height: 10),
                            const Text('Applicant personal details:'),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.fullName,
                              decoration:
                                  const InputDecoration(label: Text(bFullName)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.admNumber,
                              decoration: const InputDecoration(
                                  label: Text(bAdmNumber)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              // controller: _controller.gender,
                              decoration:
                                  const InputDecoration(label: Text(bGender)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              // controller: _controller.dateOfBirth,
                              decoration: const InputDecoration(
                                  label: Text(bDateOfBirth)),
                            ),
                            const Text('Applicant school details:'),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.institutionName,
                              decoration: const InputDecoration(
                                  label: Text(binstitutionName)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue:
                                  userApplicationData.institutionAddress,
                              decoration: const InputDecoration(
                                  label: Text(binstitutionAddress)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue:
                                  userApplicationData.institutionBankAccountNo,
                              decoration: const InputDecoration(
                                  label: Text(binstitutionBankAccountNo)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.bankName,
                              decoration:
                                  const InputDecoration(label: Text(bbankName)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.bankBranch,
                              decoration: const InputDecoration(
                                  label: Text(bbankBranch)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue: userApplicationData.bankCode,
                              decoration:
                                  const InputDecoration(label: Text(bbankCode)),
                            ),
                            const SizedBox(height: 10),
                            const Text('Applicant family details:'),
                            TextFormField(
                              initialValue: userApplicationData.fatherName,
                              decoration: const InputDecoration(
                                  label: Text(bFatherName)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue:
                                  userApplicationData.fatherNationalId,
                              decoration: const InputDecoration(
                                  label: Text(bFatherNationalid)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue:
                                  userApplicationData.fatherPhoneNumber,
                              decoration: const InputDecoration(
                                  label: Text(bFatherPhoneNo)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue:
                                  userApplicationData.fatherOccupation,
                              decoration: const InputDecoration(
                                  label: Text(bFatherOccupation)),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              initialValue:
                                  userApplicationData.fatherDisability,
                              decoration: const InputDecoration(
                                  label: Text(bFatherDisable)),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong. Try again"),
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
