class LocationModel {
  //-- Location details
  final String subCounty;
  final String ward;
  final String location;
  final String subLocation;
  final String village;


  LocationModel({
    //-- Location details

    required this.subCounty,
    required this.ward,
    required this.location,
    required this.subLocation,
    required this.village,
  
  });

  toJson() {
    return {
      // Location details
      "Sub COunty": subCounty,
      "Ward": ward,
      "Location": location,
      "Sub Location": subLocation,
      "Village": village,
    };
  }
}
