class ApplicationModel {
  // -- Family details
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

  ApplicationModel({
    //-- Family Details

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
      //-- Family details
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
}
