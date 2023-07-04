import 'package:get/get.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_model.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class BursaryController extends GetxController {
  final _userRepo = Get.put(UserRepository());

  RxList<BursaryModel> bursaries = <BursaryModel>[].obs;
  bool isClicked = false;

  @override
  void onInit() {
    fetchBursaries();
    super.onInit();
  }

  Future<void> fetchBursaries() async {
    try {
      final List<BursaryModel> fetchedBursaries =
          await _userRepo.getBursaries();
      bursaries.value = fetchedBursaries;
    } catch (error) {
      // Handle error
    }
  }

  Future<void> createBursary(
      String title, String description, DateTime deadline) async {
    try {
      final BursaryModel bursary =
          BursaryModel(
          title: title, description: description, deadline: deadline);
      await _userRepo.createBursary(bursary);
      fetchBursaries();
    } catch (error) {
      // Handle error
    }
  }

  void setBursaryClicked(BursaryModel bursary) {
    bursary.isClicked = true;
  }

  BursaryModel? getSelectedBursary() {
    return bursaries.firstWhereOrNull((bursary) => bursary.isClicked);
  }

}
