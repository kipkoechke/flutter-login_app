import 'package:flutter/material.dart';
import 'package:login_app/src/constants/colors.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Portal'),
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
              const ListTile(
                title: Text('Dashboard'),
              ),
              const ListTile(
                title: Text('Beneficiaries'),
              ),
              const ListTile(
                title: Text('Applications'),
              ),
              const ListTile(
                title: Text('Bursaries'),
              ),
              const ListTile(
                title: Text('Disbursements'),
              ),
              const ListTile(
                title: Text('Sub-Counties'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
