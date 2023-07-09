import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class DeclinedApplicationsController extends GetxController {
  static DeclinedApplicationsController get instance => Get.find();

  final String title = 'Declined Applications';
  final _userRepo = Get.put(UserRepository());

  declineApplication(String id, String reason) async {
    await _userRepo.declineUserApplication(id, reason);
  }

  Future<String> getDeclineReason() async {
    return await _userRepo.declineReason();
  }

  //-- Retrieves user application data
  Stream<List<ApplicationFormModel>> getDeclinedApplication() {
    return _userRepo.declinedApplication().asStream();
  }

  Stream<int> getDeclinedApplicationsCount() {
    return _userRepo.declinedApplicationsCount().asStream();
  }

  void showDeclineReasonDialog(String applicationId) {
    String reason = '';

    Future.delayed(Duration.zero, () {
      Get.dialog(
        AlertDialog(
          title: const Text('Decline Reason'),
          content: TextField(
            onChanged: (value) {
              reason = value;
            },
            decoration: const InputDecoration(
              hintText: 'Enter reason here',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final DeclinedApplicationsController declineController =
                    Get.find();
                declineController.declineApplication(applicationId, reason);
                Get.back();
              },
              child: const Text('Decline'),
            ),
          ],
        ),
      );
    });
  }

}
