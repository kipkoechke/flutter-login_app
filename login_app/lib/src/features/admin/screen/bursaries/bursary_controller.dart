import 'package:get/get.dart';
import 'package:login_app/src/features/admin/model/bursary_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class BursaryController extends GetxController {
  static BursaryController get instance => Get.find();
  final UserRepository _userRepository = Get.put(Get.put(UserRepository()));

  RxList<BursaryModel> bursaries = <BursaryModel>[].obs;

  Future<void> fetchBursaries() async {
    try {
      final DateTime deadline =
          DateTime.now(); // Set the desired deadline for filtering
      final List<BursaryModel> fetchedBursaries =
          await _userRepository.getBursaries(deadline);
      bursaries.value = fetchedBursaries;
    } catch (error) {
      // Handle error
    }
  }

  Future<void> createBursary(String name, DateTime deadline) async {
    try {
      final BursaryModel bursary =
          BursaryModel(title: name, deadline: deadline);
      await _userRepository.createBursary(bursary);
    } catch (error) {
      // Handle error
    }
  }
}
