import 'package:flutter/material.dart';
import 'package:login_app/src/features/admin/screen/applications/approved/approved_applications_controller.dart';

class TotalNumberOfApprovedApplications extends StatelessWidget {
  const TotalNumberOfApprovedApplications({
    super.key,
    required this.approvedApplicationsController,
  });

  final ApprovedApplicationController approvedApplicationsController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: approvedApplicationsController.getApprovedApplicationsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final approvedApplicationsCount = snapshot.data!;
          return Text(
            'Approved Applications: $approvedApplicationsCount',
            style: const TextStyle(fontSize: 16),
          );
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: const TextStyle(fontSize: 16),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
