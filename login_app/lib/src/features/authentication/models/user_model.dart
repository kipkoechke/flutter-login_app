import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String? password;
  final String? deviceToken;

  UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    this.password,
    this.deviceToken = "",
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone Number": phoneNo,
      "Device Token": deviceToken,
    };
  }

  //-- Mapping user fetched from firebase to usermodel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      phoneNo: data["Phone Number"],
      password: data["Password"],
      deviceToken: data["Device Token"],
    );
  }
}
