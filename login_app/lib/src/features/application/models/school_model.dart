class SchoolModel {
  //-- School details

  final String institutionCounty;
  final String institutionAddress;
  final String institutionName;
  final String institutionBankAccountNo;
  final String bankName;
  final String bankBranch;
  final String bankCode;

  SchoolModel({
    required this.institutionCounty,
    required this.institutionAddress,
    required this.institutionName,
    required this.institutionBankAccountNo,
    required this.bankName,
    required this.bankBranch,
    required this.bankCode,
  });

  toJson() {
    return {
      //-- School details
      "Institution's County": institutionCounty,
      "Institution's Address": institutionAddress,
      "Institution's Name": institutionName,
      "Institution's Bank Account No": institutionBankAccountNo,
      "Bank Name": bankName,
      "Bank Branch": bankBranch,
      "Bank Code": bankCode,
    };
  }
}
