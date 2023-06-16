class PersonalModel {
  //-- Personal details
  final String fullName;
  final String nationalId;
  final String regNumber;
  final String phoneNo;
  // final String dateOfBirth;
  // final String gender;
  // final String regularOrPrivate;

  PersonalModel({
    //-- Personal Details

    required this.fullName,
    required this.nationalId,
    required this.regNumber,
    required this.phoneNo,
    // required this.dateOfBirth,
    // required this.gender,
    // required this.regularOrPrivate,
  });

  toJson() {
    return {
      //-- Personal details
      "Full Name": fullName,
      "National Id": nationalId,
      "Registration Number": regNumber,
      "Phone Number": phoneNo,
      // "Date of Birth": dateOfBirth,
      // "Gender": gender,
      // "Student Status": regularOrPrivate,
    };
  }
}
