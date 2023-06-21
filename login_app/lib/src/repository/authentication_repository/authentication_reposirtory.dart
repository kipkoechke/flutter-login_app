import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/admin/dashboard/admin_dashboard.dart';
import 'package:login_app/src/features/application/application_screen.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  int? resendToken;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SplashScreen());
    } else if (user.email == 'admin@admin.com') {
      Get.offAll(() => const AdminDashboardScreen());
    } else {
      Get.offAll(() => const ApplicationScreen());
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId.value == verificationId;
        this.resendToken == resendToken;
      },
      timeout: const Duration(seconds: 30),
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'The provided phone number is not valid.');
          Get.back();
        } else {
          Get.snackbar('Error', 'Something went wrong. Try again.');
          Get.back;
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
          verificationId: verificationId.value, smsCode: otp),
    );
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    try {
      final credentials = await _auth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password!)
          .whenComplete(
            () => Get.snackbar(
              'Success',
              'Your account has been created',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            ),
          )
          .catchError((error, stackTrace) {
        Get.snackbar('Error', 'Something went wrong. Try again',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        throw error;
      });
      FirebaseFirestore.instance
          .collection("Users")
          .doc(credentials.user!.uid)
          .set(user.toJson());

      firebaseUser.value != null
          ? Get.offAll(() => const ApplicationScreen())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (_) {}
  }

  Future<void> logOut() async => await _auth.signOut();
}
