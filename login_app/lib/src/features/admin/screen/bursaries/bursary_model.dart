import 'package:cloud_firestore/cloud_firestore.dart';

class BursaryModel {
  final String? id;
  final String title;
  final String description;
  final DateTime deadline;

  BursaryModel({
    this.id,
    required this.title,
    required this.description,
    required this.deadline,
  });

  Map<String, dynamic> toJson() {
    return {
      "Title": title,
      "Description": description,
      "Deadline": Timestamp.fromDate(deadline),
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
    );
  }
}
