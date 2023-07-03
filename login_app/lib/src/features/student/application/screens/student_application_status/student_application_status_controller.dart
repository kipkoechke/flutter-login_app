import 'package:get/get.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class StudentApplicationStatusController extends GetxController {
  static StudentApplicationStatusController get instance => Get.find();
  var status = ''.obs;

  final _userRepo = Get.put(UserRepository());

  Future<String> displayAllocationStatus() async {
    final allocationStatus = await _userRepo.getAllocationStatus();
    if (allocationStatus == 'No Application') {
      // Display appropriate message for no application
      return ("You have not submitted any application.");
    } else if (allocationStatus == 'Pending') {
      // Display appropriate message for pending application
      return ("Your application is pending review.");
    } else if (allocationStatus == 'Approved') {
      // Display appropriate message for approved application
      return ("Congratulations! Your application has been approved.");
    } else if (allocationStatus == 'Declined') {
      // Display appropriate message for declined application
      return ("Sorry, your application has been declined.");
    } else {
      // Handle any other status if needed
      return ("Unknown application status: $allocationStatus");
    }
  }
}
