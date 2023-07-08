import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class AllocatedApplicationScreen extends StatelessWidget {
  const AllocatedApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final allocated = Get.put(AllocatedUsersController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          "Beneficiaries",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(4),
        //-- Fetching data for all users
        child: StreamBuilder<List<ApplicationFormModel>>(
          stream: allocated.getAllocatedUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                //-- Fetching data for all users
                List<ApplicationFormModel> userData = snapshot.data!;
                return ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            child: ListTile(
                              iconColor: Colors.blue,
                              tileColor: Colors.blue.withOpacity(0.1),
                              //leading: const Icon(LineAwesomeIcons.user_1),
                              title: Text("Name: ${userData[index].fullName}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Institution: ${userData[index].institutionName}",
                                  ),
                                  Text(
                                    "Reg No: ${userData[index].admNumber}",
                                  ),
                                  Text(
                                    "Amount: ${userData[index].amount}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
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
    );
  }
}
