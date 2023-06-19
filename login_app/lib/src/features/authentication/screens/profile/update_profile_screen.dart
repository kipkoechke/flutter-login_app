import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/profile_controller.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          bEditProfile,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(bDefaultSize),

//-- Fetching data for all users
          // child: FutureBuilder<List<UserModel>>(
          //   future: controller.getAllUser(),
/**
 * This is for fetching data for single user
 */
          child: FutureBuilder(
            future: controller.getUserdata(),

            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  //-- Fetching data for all users

                  // List<UserModel> userData = snapshot.data!;
                  // return ListView.builder(
                  //   itemCount: userData.length,
                  //   itemBuilder: (context, index) {
                  //     return Column(
                  //       children: [
                  //         ListTile(
                  //           iconColor: Colors.blue,
                  //           tileColor: Colors.blue.withOpacity(0.1),
                  //           leading: const Icon(LineAwesomeIcons.user_1),
                  //           title: Text("Name: ${userData[index]}"),
                  //           subtitle: Column(
                  //             children: [
                  //               Text(userData[index].phoneNo),
                  //               Text(userData[index].email),
                  //             ],
                  //           ),
                  //         ),
                  //         const SizedBox(height: 10),
                  //       ],
                  //     );
                  //   },
                  // );

/**
 * This is for fetching data for single user
 */
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(bProfileImage),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: bPrimaryColor,
                              ),
                              child: const Icon(
                                LineAwesomeIcons.camera,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.fullName,
                              decoration: const InputDecoration(
                                  label: Text(bFullName),
                                  prefixIcon:
                                      Icon(Icons.person_outline_rounded)),
                            ),
                            const SizedBox(height: bFormHeight - 20.0),
                            TextFormField(
                              initialValue: userData.email,
                              decoration: const InputDecoration(
                                  label: Text(bEmail),
                                  prefixIcon: Icon(Icons.email)),
                            ),
                            const SizedBox(height: bFormHeight - 20.0),
                            TextFormField(
                              initialValue: userData.phoneNo,
                              decoration: const InputDecoration(
                                  label: Text(bPhoneNo),
                                  prefixIcon: Icon(Icons.phone)),
                            ),
                            const SizedBox(height: bFormHeight - 20.0),
                            TextFormField(
                              initialValue: userData.password,
                              decoration: const InputDecoration(
                                  label: Text(bPassword),
                                  prefixIcon: Icon(Icons.fingerprint)),
                            ),
                            const SizedBox(height: bFormHeight),
                            SizedBox(
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => const UpdateProfileScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: bPrimaryColor,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: const Text(
                                  bEditProfile,
                                  style: TextStyle(color: bDarkColor),
                                ),
                              ),
                            ),
                            const SizedBox(height: bFormHeight),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: bJoined,
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                        text: bJoinedAt,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    shape: const StadiumBorder(),
                                    side: BorderSide.none,
                                  ),
                                  child: const Text(bDelete),
                                ),
                              ],
                            ),
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
