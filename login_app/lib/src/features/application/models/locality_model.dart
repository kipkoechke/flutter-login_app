class LocalityModel {
  //-- Locality details
  final String subCounty;
  final String ward;
  final String location;
  final String subLocation;
  final String village;
  final String chiefName;

  LocalityModel({
    //-- Locality details

    required this.subCounty,
    required this.ward,
    required this.location,
    required this.subLocation,
    required this.village,
    required this.chiefName,
  });

  toJson() {
    return {
      // Locality details
      "Sub COunty": subCounty,
      "Ward": ward,
      "Location": location,
      "Sub Location": subLocation,
      "Village": village,
      "Chief Name": chiefName,
    };
  }
}
