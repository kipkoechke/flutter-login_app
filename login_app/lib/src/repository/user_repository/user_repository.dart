import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final _authRepo = Get.put(AuthenticationRepository());

  //-- Store data in the firestore
  Future<void> createUser(UserModel user) async {
    await _authRepo.createUserWithEmailAndPassword(user);
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    await _db
        .collection("Users")
        .doc(userUid)
        .set(user.toJson())
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

  //-- Fetch data from the firestore for a single user using email
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  //-- Fetch data for all the users
  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  //-- Store application form details in firestore
  Future<void> createApplication(ApplicationFormModel application) async {
    // final userUid = FirebaseAuth.instance.currentUser?.uid;
    await _db
        .collection("Applications")
        // .doc(userUid)
        .add(application.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Success',
            'Your application has been submitted',
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

  //-- Fetch data using uid for a single user
  Future<ApplicationFormModel> getUserApplicationDetails(String uid) async {
    final snapshot =
        await _db.collection("Applications").where("uid", isEqualTo: uid).get();
    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<ApplicationFormModel>> allApplications() async {
    final snapshot = await _db.collection("Applications").get();
    final userApplication =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).toList();
    return userApplication;
  }

  //-- Fetch data for all the pending users applications as the admin
  Future<List<ApplicationFormModel>> pendingApplications() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Status", isEqualTo: 'Pending')
        .get();
    final userApplication =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).toList();
    return userApplication;
  }

  //-- Fetch data for all the approved users applications as the admin
  Future<List<ApplicationFormModel>> approvedApplication() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Status", isEqualTo: 'Approved')
        .get();
    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).toList();
    return userData;
  }

  //-- Fetch data for all the declined users applications as the admin
  Future<List<ApplicationFormModel>> declinedApplication() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Status", isEqualTo: 'Declined')
        .get();
    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).toList();
    return userData;
  }

  //-- Fetch data for single user as the admin
  Future<ApplicationFormModel> adminGetUserApplicationDetails(
      String uid) async {
    final snapshot =
        await _db.collection("Applications").where("uid", isEqualTo: uid).get();
    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).single;
    return userData;
  }

  //-- Update user application status to approved as the admin
  Future<void> approveUserApplication(String id) async {
    await _db.collection("Applications").doc(id).update({
      "Status": "Approved",
    }).then((_) {
      Get.snackbar('Success', 'Approved application with ID: $id');
      print("Your application id is:" '$id');
    }).catchError((error) {
      Get.snackbar("Error", 'Failed to approve application with ID: $id');
      print("Your application id is:" '$id');

      throw (error);
    });
  }

  //-- Update user application status to declined as the admin
  Future<void> declineUserApplication(String id) async {
    await _db.collection("Applications").doc(id).update({
      "Status": "Declined",
    }).then((_) {
      Get.snackbar('Declined', 'Rejected application with ID: $id');
      print("Your application id is:" '$id');
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to reject application with ID: $id');
      print("Your application id is:" '$id');

      throw (error);
    });
  }
}
