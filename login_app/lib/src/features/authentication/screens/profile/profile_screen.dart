import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/screens/profile/update_application_data.dart';
import 'package:login_app/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:login_app/src/features/authentication/screens/profile/widgets/profile_menu.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          bProfile,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(bDefaultSize),
          child: Column(
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
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(
                bProfileHeading,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                bProfileSubHeading,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: bMenu1,
                icon: LineAwesomeIcons.cog,
                onPress: () {
                  Get.to(() => const UpdateApplicationData());
                },
              ),
              // ProfileMenuWidget(
              //   title: bMenu2,
              //   icon: LineAwesomeIcons.wallet,
              //   onPress: () {
              //     Get.to(() => const AllApplicationsScreen());
              //   },
              // ),
              // ProfileMenuWidget(
              //   title: bMenu3,
              //   icon: LineAwesomeIcons.user_check,
              //   onPress: () {
              //     Get.to(const UserManagementScreen());
              //   },
              // ),
              const Divider(),
              // const SizedBox(height: 10),
              // ProfileMenuWidget(
              //   title: bMenu4,
              //   icon: LineAwesomeIcons.info,
              //   onPress: () {},
              // ),
              ProfileMenuWidget(
                title: bMenu5,
                icon: LineAwesomeIcons.alternate_sign_out,
                endIcon: false,
                onPress: () {
                  AuthenticationRepository.instance.logOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
