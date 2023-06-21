import 'package:flutter/material.dart';

class ApplicationDoneScreen extends StatelessWidget {
  const ApplicationDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          " Your application was submited successfully",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
