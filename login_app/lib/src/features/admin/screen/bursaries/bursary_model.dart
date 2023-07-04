import 'package:cloud_firestore/cloud_firestore.dart';

class BursaryModel {
  final String? id;
  final String title;
  final String description;
  final DateTime deadline;
  bool isClicked;

  BursaryModel({
    this.id,
    required this.title,
    required this.description,
    required this.deadline,
    this.isClicked = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "Title": title,
      "Description": description,
      "Deadline": Timestamp.fromDate(deadline),
      "IsClicked": isClicked,
    };
  }

  factory BursaryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BursaryModel(
      id: document.id,
      title: data["Title"],
      description: data["Description"],
      deadline: (data["Deadline"] as Timestamp).toDate(),
      isClicked: data["IsClicked"] ?? false,
    );
  }
}
