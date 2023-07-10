import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/features/admin/all_applications.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users_controller.dart';
import 'package:login_app/src/features/admin/screen/allocation/total_allocated_users.dart';
import 'package:login_app/src/features/admin/screen/applications/applications_status/application_status_screen.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/total_approved_applications.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/total_declined_applications.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_controller.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/total_pending_applications.dart';
import 'package:login_app/src/features/admin/screen/applications/total_applications.dart';
import 'package:login_app/src/features/admin/screen/bursaries/new_bursary.dart';
import 'package:login_app/src/features/student/application/controllers/student_details_controller.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';
import 'package:pie_chart/pie_chart.dart';

class AdminDashboardScreen extends StatelessWidget {
  AdminDashboardScreen({super.key});
  // State variables for pie chart data
  final Map<String, double> applicationsStatusData = {
    'Pending': 10,
    'Approved': 20,
    'Declined': 5,
  };

  final Map<String, double> allocationData = {
    'Allocated': 15,
    'Unallocated': 10,
  };
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Build pie chart widget
    Widget buildPieChart(Map<String, double> dataMap) {
      return PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartRadius: math.min(size.width / 3.2, 300),
        chartType: ChartType.disc,
        chartValuesOptions: const ChartValuesOptions(
          showChartValues: true,
          showChartValuesInPercentage: true,
        ),
      );
    }

    // final fcm = Get.put(FCMController());
    final pendingApplicationsController =
        Get.put(PendingApplicationsController());
    final approvedApplicationsController =
        Get.put(ApprovedApplicationController());
    final declinedApplicationsController =
        Get.put(DeclinedApplicationsController());
    final allApplicationsController = Get.put(StudentDetailsController());
    final allocatedUsersController = Get.put(AllocatedUsersController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Admin Dashboard',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
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
                      color: Colors
                          .white, // Set the color of the icon in the drawer header
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Text(
                      'Bursary Management',
                      style: TextStyle(
                          color: Colors
                              .white, // Set the color of the text in the drawer header
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Dashboard'),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('All Applications'),
                  onTap: () {
                    Get.to(() => const AllApplicationsScreen());
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Beneficiaries'),
                  onTap: () {
                    Get.to(AllocatedApplicationScreen());
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Applications'),
                  onTap: () {
                    Get.to(ApplicationStatusScreen());
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Bursaries'),
                  onTap: () {
                    Get.to(() => NewBursaryScreen());
                  },
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TotalNumberOfAllApplications(
                      allApplicationsController: allApplicationsController,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TotalNumberOfPendingApplications(
                          pendingApplicationsController:
                              pendingApplicationsController,
                        ),
                        TotalNumberOfApprovedApplications(
                          approvedApplicationsController:
                              approvedApplicationsController,
                        ),
                        TotalNumberOfDeclinedApplications(
                          declinedApplicationsController:
                              declinedApplicationsController,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              // Add pie chart for applications status
              buildPieChart(applicationsStatusData),
              const Divider(),
              Column(
                children: [
                  TotalNumberOfBeneficiaries(
                    allocatedUsersController: allocatedUsersController,
                  ),
                  // Add pie chart for allocation
                  buildPieChart(allocationData),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
