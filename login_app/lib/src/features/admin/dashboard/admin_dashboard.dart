import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/features/admin/all_applications.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users.dart';
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_screen.dart';
import 'package:login_app/src/features/admin/screen/bursaries/new_bursary.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Portal'),
          actions: [
            IconButton(
              onPressed: () {
                AuthenticationRepository.instance.logOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      bSecondaryColor,
                      bPrimaryColor.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.dashboard_customize_rounded,
                      size: 48,
                      color: bSecondaryColor,
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Text('Bursary Management')
                  ],
                ),
              ),
              ListTile(
                title: const Text('Dashboard'),
                onTap: () {
                  Get.to(() => const AllApplicationsScreen());
                },
              ),
              ListTile(
                title: const Text('Beneficiaries'),
                onTap: () {
                  Get.to(const AllocatedApplicationScreen());
                },
              ),
              ListTile(
                title: const Text('Applications'),
                onTap: () {
                  Get.to(ApplicationStatusScreen());
                },
              ),
              ListTile(
                title: const Text('Bursaries'),
                onTap: () {
                  Get.to(() => NewBursaryScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
