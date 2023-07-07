import 'package:flutter/material.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users_controller.dart';

class TotalNumberOfBeneficiaries extends StatelessWidget {
  const TotalNumberOfBeneficiaries({
    super.key,
    required this.allocatedUsersController,
  });

  final AllocatedUsersController allocatedUsersController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: allocatedUsersController.getAllocatedUsersCount(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final allocatedUsersCount = snapshot.data!;
          return Text(
            'Total Beneficiaries: $allocatedUsersCount',
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
