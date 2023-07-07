import 'package:flutter/material.dart';
import 'package:login_app/src/features/admin/screen/applications/pending/pending_applications_controller.dart';

class TotalNumberOfPendingApplications extends StatelessWidget {
  const TotalNumberOfPendingApplications({
    super.key,
    required this.pendingApplicationsController,
  });

  final PendingApplicationsController pendingApplicationsController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: pendingApplicationsController.getPendingApplicationsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final pendingApplicationsCount = snapshot.data!;
          return Text(
            'Pending Applications: $pendingApplicationsCount',
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
