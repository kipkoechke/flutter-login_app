import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApplicationFormModel {
  final String? uid;
  // Application status
  final String status;
  // Location details
  final String subCounty;
  final String ward;
  final String location;
  final String subLocation;
  final String village;

  // Personal details
  final String fullName;
  final String nationalId;
  final String admNumber;
  final String phoneNo;

  // School details
  final String institutionCounty;
  final String institutionAddress;
  final String institutionName;
  final String institutionBankAccountNo;
  final String bankName;
  final String bankBranch;
  final String bankCode;

  // Family details
  final String fatherName;
  final String fatherNationalId;
  final String fatherOccupation;
  final String fatherPhoneNumber;
  final String fatherDisability;
  final String ifFatherDisable;

  final String motherName;
  final String motherNationalId;
  final String motherOccupation;
  final String motherPhoneNumber;
  final String motherDisability;
  final String ifMotherDisable;

  final String guardianName;
  final String guardianNationalId;
  final String guardianOccupation;
  final String guardianPhoneNumber;
  final String guardianDisability;
  final String ifGuardianDisable;

  ApplicationFormModel({
    this.uid,
    // Application status
    required this.status,
    // Location details
    required this.subCounty,
    required this.ward,
    required this.location,
    required this.subLocation,
    required this.village,

    // Personal details
    required this.fullName,
    required this.nationalId,
    required this.admNumber,
    required this.phoneNo,

    // School details
    required this.institutionCounty,
    required this.institutionAddress,
    required this.institutionName,
    required this.institutionBankAccountNo,
    required this.bankName,
    required this.bankBranch,
    required this.bankCode,

    // Family details
    required this.fatherName,
    required this.fatherNationalId,
    required this.fatherOccupation,
    required this.fatherPhoneNumber,
    required this.fatherDisability,
    required this.ifFatherDisable,
    required this.motherName,
    required this.motherNationalId,
    required this.motherOccupation,
    required this.motherPhoneNumber,
    required this.motherDisability,
    required this.ifMotherDisable,
    required this.guardianName,
    required this.guardianNationalId,
    required this.guardianOccupation,
    required this.guardianPhoneNumber,
    required this.guardianDisability,
    required this.ifGuardianDisable,
  });

  toJson() {
    return {
      "uid": FirebaseAuth.instance.currentUser!.uid,
      // Application status
      "Status": status,
      // Location details
      "Sub County": subCounty,
      "Ward": ward,
      "Location": location,
      "Sub Location": subLocation,
      "Village": village,

      // Personal details
      "Full Name": fullName,
      "National Id": nationalId,
      "Registration Number": admNumber,
      "Phone Number": phoneNo,

      // School details
      "Institution's County": institutionCounty,
      "Institution's Address": institutionAddress,
      "Institution's Name": institutionName,
      "Institution's Bank Account No": institutionBankAccountNo,
      "Bank Name": bankName,
      "Bank Branch": bankBranch,
      "Bank Code": bankCode,

      // Family details
      "Father Name": fatherName,
      "Father National Id": fatherNationalId,
      "Father Occupation": fatherOccupation,
      "Father Phone Number": fatherPhoneNumber,
      "Father Disability": fatherDisability,
      "If father is disable": ifFatherDisable,
      "Mother Name": motherName,
      "Mother National Id": motherNationalId,
      "Mother Occupation": motherOccupation,
      "Mother Phone Number": motherPhoneNumber,
      "Mother Disability": motherDisability,
      "If mother is disable": ifMotherDisable,
      "Guardian Name": guardianName,
      "Guardian National Id": guardianNationalId,
      "Guardian Occupation": guardianOccupation,
      "Guardian Phone Number": guardianPhoneNumber,
      "Guardian Disability": guardianDisability,
      "If guardian is disable": ifGuardianDisable,
    };
  }

  //-- Mapping user fetched from firebase to usermodel
  factory ApplicationFormModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ApplicationFormModel(
      uid: document.id,
      // APplication status
      status: data["Status"],
      //-- Location details
      subCounty: data["Sub County"],
      ward: data["Ward"],
      location: data["Location"],
      subLocation: data["Sub Location"],
      village: data["Village"],

      //-- personal details
      fullName: data["Full Name"],
      nationalId: data["National Id"],
      admNumber: data["Registration Number"],
      phoneNo: data["Phone Number"],

      //-- school details
      institutionCounty: data["Institution's County"],
      institutionAddress: data["Institution's Address"],
      institutionName: data["Institution's Name"],
      institutionBankAccountNo: data["Institution's Bank Account No"],
      bankName: data["Bank Name"],
      bankBranch: data["Bank Branch"],
      bankCode: data["Bank Code"],

      //-- family details
      fatherName: data["Father Name"],
      fatherNationalId: data["Father National Id"],
      fatherOccupation: data["Father Occupation"],
      fatherPhoneNumber: data["Father Phone Number"],
      fatherDisability: data["Father Disability"],
      ifFatherDisable: data["If father is disable"],
      motherName: data["Mother Name"],
      motherNationalId: data["Mother National Id"],
      motherOccupation: data["Mother Occupation"],
      motherPhoneNumber: data["Mother Phone Number"],
      motherDisability: data["Mother Disability"],
      ifMotherDisable: data["If mother is disable"],
      guardianName: data["Guardian Name"],
      guardianNationalId: data["Guardian National Id"],
      guardianOccupation: data["Guardian Occupation"],
      guardianPhoneNumber: data["Guardian Phone Number"],
      guardianDisability: data["Guardian Disability"],
      ifGuardianDisable: data["If guardian is disable"],
    );
  }
}
