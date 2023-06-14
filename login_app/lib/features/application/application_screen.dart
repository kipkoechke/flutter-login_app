import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Application Form'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        drawer: Container(),
        body: Center(
          child: Text(
            'Bursary Application Form',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
