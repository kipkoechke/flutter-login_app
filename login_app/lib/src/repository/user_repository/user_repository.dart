import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/application/models/family_model.dart';
import 'package:login_app/src/features/application/models/location_model.dart';
import 'package:login_app/src/features/application/models/personal_model.dart';
import 'package:login_app/src/features/application/models/school_model.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

//-- Store data in the firestore
  // Future<void> createUser(UserModel user) async {
  //   final userUid = FirebaseAuth.instance.currentUser?.uid;
  //   await _db
  //       .collection("Users")
  //       .doc(userUid)
  //       .set(user.toJson())
  //       .whenComplete(
  //         () => Get.snackbar(
  //           'Success',
  //           'Your account has been created',
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.green.withOpacity(0.1),
  //           colorText: Colors.green,
  //         ),
  //       )
  //       .catchError((error, stackTrace) {
  //     Get.snackbar('Error', 'Something went wrong. Try again',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red);
  //     throw error;
  //   });
  // }

//-- Fetch data from the firestore
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  //-- Application logic
  Future<void> createApplication(ApplicationFormModel application) async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    await _db
        .collection("Applications")
        .doc(userUid)
        .set(application.toJson())
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
  }
  //-- Family details
  Future<void> createFamily(FamilyModel family) async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    await _db
        .collection("Applications")
        .doc(userUid)
        .collection("family")
        .add(family.toJson())
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
  }

  Future<void> createLocation(LocationModel location) async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    await _db
        .collection("Applications")
        .doc(userUid)
        .collection("location")
        .add(location.toJson())
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
  }

  Future<void> createSchool(SchoolModel school) async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    await _db
        .collection("Applications")
        .doc(userUid)
        .collection("school")
        .add(school.toJson())
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
  }

  Future<void> createPersonal(PersonalModel personal) async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    await _db
        .collection("Applications")
        .doc(userUid)
        .collection("personal")
        .add(personal.toJson())
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
  }
}
