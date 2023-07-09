import 'package:flutter/material.dart';
import 'package:login_app/src/features/student/application/controllers/student_details_controller.dart';

class TotalNumberOfAllApplications extends StatelessWidget {
  const TotalNumberOfAllApplications({
    super.key,
    required this.allApplicationsController,
  });

  final StudentDetailsController allApplicationsController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: allApplicationsController.getAllApplicationsCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final allApplicationsCount = snapshot.data!;
          return SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 0,
              child: ListTile(
                title: const Text(
                  'Applications',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '$allApplicationsCount',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
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
