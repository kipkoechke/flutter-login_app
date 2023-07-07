import 'package:flutter/material.dart';
import 'package:login_app/src/features/admin/screen/applications/declined/declined_applications_controller.dart';

class TotalNumberOfDeclinedApplications extends StatelessWidget {
  const TotalNumberOfDeclinedApplications({
    super.key,
    required this.declinedApplicationsController,
  });

  final DeclinedApplicationsController declinedApplicationsController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: declinedApplicationsController.getDeclinedApplicationsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final declinedApplicationsCount = snapshot.data!;
          return Text(
            'Declined Applications: $declinedApplicationsCount',
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
