import 'package:cloud_firestore/cloud_firestore.dart';

class BursaryModel {
  final String? id;
  final String title;
  final DateTime deadline;

  BursaryModel({
    this.id,
    required this.title,
    required this.deadline,
  });

  Map<String, dynamic> toJson() {
    return {
      "Title": title,
      "Deadline": Timestamp.fromDate(deadline),
    };
  }

  factory BursaryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return BursaryModel(
      id: document.id,
      title: data["Title"],
      deadline: (data["Deadline"] as Timestamp).toDate(),
    );
  }
}
