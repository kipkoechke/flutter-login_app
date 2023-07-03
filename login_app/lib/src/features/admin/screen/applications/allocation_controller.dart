import 'package:get/get.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class AllocationController extends GetxController {
  static AllocationController get instance => Get.find();
  final _userRepo = Get.put(UserRepository());

  allocateAmount(String id, double amount) async {
    await _userRepo.allocateUserFunds(id, amount);
    Get.back();
  }
}
