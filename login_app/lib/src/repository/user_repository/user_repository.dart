import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/admin/dashboard/admin_dashboard.dart';
import 'package:login_app/src/features/admin/screen/bursaries/bursary_model.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:login_app/src/features/student/application/screens/student_dashboard/student_dashboard.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final _authRepo = Get.put(AuthenticationRepository());

  //-- Create a new bursary as the admin
  Future<void> createBursary(BursaryModel bursary) async {
    await _db.collection("Bursaries").add(bursary.toJson()).then((_) {
      Get.snackbar(
        'Success',
        'The bursary has been created',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar(
        'Error',
        'Failed to create the bursary',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      throw error;
    });
  }

  //-- Fetch all bursaries
  Future<List<BursaryModel>> getBursaries() async {
    final snapshot = await _db.collection("Bursaries").get();
    final bursaries =
        snapshot.docs.map((doc) => BursaryModel.fromSnapshot(doc)).toList();
    return bursaries;
  }

  //-- Update bursary details
  Future<void> updateBursary(
    String bursaryId,
    String updatedTitle,
    String updatedDescription,
    DateTime updatedDeadline,
  ) async {
    try {
      await _db.collection("Bursaries").doc(bursaryId).update({
        "Title": updatedTitle,
        "Description": updatedDescription,
        "Deadline": Timestamp.fromDate(updatedDeadline),
      });
      Get.snackbar(
        'Success',
        'The bursary has been updated',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to update the bursary',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      rethrow;
    }
  }

  //-- Delete a bursary
  Future<void> deleteBursary(String bursaryId) async {
    try {
      await _db.collection("Bursaries").doc(bursaryId).delete();
      Get.snackbar(
        'Success',
        'The bursary has been deleted',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (error) {
      Get.snackbar(
        'Error',
        'Failed to delete the bursary',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      rethrow;
    }
  }

  //-- Store sign up details
  Future<void> createUser(UserModel user) async {
    try {
      await _authRepo.createUserWithEmailAndPassword(user);
      final userUid = FirebaseAuth.instance.currentUser?.uid;
      if (userUid != null) {
        final userRef = _db.collection("Users").doc(userUid);
        final docSnapshot = await userRef.get();
        if (docSnapshot.exists) {
          Get.snackbar(
            'Signup Failed',
            'An account already exists for that email.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );
          // Handle the case where the user already exists
          return;
        } else {
          await userRef.set(user.toJson()).whenComplete(() {
            Get.snackbar(
              'Success',
              'Your account has been created',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            );
            if (user.email == 'admin@gmail.com') {
              Get.offAll(() => AdminDashboardScreen());
            } else {
              Get.offAll(() => const StudentDashboardScreen());
            }
          });
        }
      }
    } catch (error) {
      Get.snackbar(
        'Error',
        'Something went wrong. Try again',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      rethrow;
    }
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

  //-- Store application form details in Firestore
  Future<void> createApplication(ApplicationFormModel application) async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    // Check if the user has already submitted an application
    final querySnapshot = await _db
        .collection('Applications')
        .where('uid', isEqualTo: userUid)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // User has already submitted an application
      Get.snackbar('Error', 'You have already submitted an application',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      return;
    }

    // Proceed with the application submission
    await _db.collection("Applications").add(application.toJson()).then((_) {
      Get.snackbar(
        'Success',
        'Your application has been submitted',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
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

  //-- Fetching all the applications
  Future<List<ApplicationFormModel>> allApplications() async {
    final snapshot = await _db.collection("Applications").get();
    final userApplication =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).toList();
    return userApplication;
  }

  //-- Fetch the total number of all the users applications as the admin
  Future<int> allApplicationsCount() async {
    final snapshot = await _db.collection("Applications").get();

    return snapshot.docs.length;
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

  //-- Fetch the total number of all the pending users applications as the admin
  Future<int> pendingApplicationsCount() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Status", isEqualTo: 'Pending')
        .get();

    return snapshot.docs.length;
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

  //-- Fetch the total number of all the approved users applications as the admin
  Future<int> approvedApplicationsCount() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Status", isEqualTo: 'Approved')
        .get();

    return snapshot.docs.length;
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

  //-- Fetch the total number of all the declined users applications as the admin
  Future<int> declinedApplicationsCount() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Status", isEqualTo: 'Declined')
        .get();

    return snapshot.docs.length;
  }

  //-- Fetch reason for the declined  applications as the admin
  Future<String> declineReason() async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    final snapshot = await _db
        .collection("Applications")
        .where("uid", isEqualTo: userUid)
        .get();
    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).single;
    return userData.declineReason;
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

  //-- Fetch allocation status for a signed-in user
  Future<String> getAllocationStatus() async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    final snapshot = await _db
        .collection("Applications")
        .where("uid", isEqualTo: userUid)
        .get();
    if (snapshot.docs.isNotEmpty) {
      final userData =
          snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).single;
      return userData.status!;
    }
    return 'No Application';
  }

  //-- Update user application status to approved as the admin
  Future<void> approveUserApplication(String id) async {
    await _db
        .collection("Applications")
        .doc(id)
        .update({
          "Status": "Approved",
        })
        .whenComplete(
          () => Get.snackbar(
            'Success',
            'Approved application with ID: $id',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError((error, stackTrace) {
          () => Get.snackbar(
              "Error", 'Failed to approve application with ID: $id',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
          throw (error);
        });
  }

  //-- Update user application status to declined as the admin
  Future<void> declineUserApplication(String id, String reason) async {
    await _db
        .collection("Applications")
        .doc(id)
        .update({
          "Status": "Declined",
          "Decline Reason": reason,
        })
        .whenComplete(
          () => Get.snackbar(
            'Declined',
            'Rejected application with ID: $id',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green,
          ),
        )
        .catchError((error, stackTrace) {
          () => Get.snackbar(
              'Error', 'Failed to reject application with ID: $id',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
          throw (error);
        });
  }

  //-- Allocate amount to approved user application as the admin
  Future<void> allocateUserFunds(String id, double amount) async {
    await _db
        .collection("Applications")
        .doc(id)
        .update({
          "Amount": amount,
        })
        .whenComplete(() => Get.snackbar(
              'Success',
              'Allocated $amount funds to application with ID: $id',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green,
            ))
        .catchError((error, stackTrace) {
          Get.snackbar(
              "Error", 'Failed to allocate funds to application with ID: $id',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
          throw error;
        });
  }

  //-- Fetch allocated amount as the admin
  Future<List<ApplicationFormModel>> allocatedApplications() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Amount", isGreaterThanOrEqualTo: 4000.00)
        .where("Amount", isLessThan: 20000.00)
        .get();
    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<double> totalAllocatedAmount() async {
    double total = 0;
    final snapshot = await _db
        .collection("Applications")
        .where("Amount", isGreaterThanOrEqualTo: 4000.00)
        .where("Amount", isLessThan: 20000.00)
        .get();
    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).toList();
    for (var element in userData) {
      total += element.amount!;
    }

    return total;
  }

  //-- Fetch the total number of all the declined users applications as the admin
  Future<int> allocatedApplicationsCount() async {
    final snapshot = await _db
        .collection("Applications")
        .where("Amount", isGreaterThanOrEqualTo: 4000.00)
        .where("Amount", isLessThan: 20000.00)
        .get();

    return snapshot.docs.length;
  }

  //-- Fetch allocated amount for a signed-in user
  Future<double> getAllocatedAmount() async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;
    final snapshot = await _db
        .collection("Applications")
        .where("uid", isEqualTo: userUid)
        .where("Amount", isGreaterThanOrEqualTo: 4000.00)
        .where("Amount", isLessThan: 20000.00)
        .get();

    final userData =
        snapshot.docs.map((e) => ApplicationFormModel.fromSnapshot(e)).single;
    return userData.amount!;
  }
}
