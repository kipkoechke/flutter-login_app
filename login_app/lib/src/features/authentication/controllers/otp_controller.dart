import 'package:get/get.dart';
import 'package:login_app/src/features/student/application/screens/student_home_page/application_screen.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified
        ? Get.offAll(
            () => const HomePage(),
          )
        : Get.back();
  }
}
