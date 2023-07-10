import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/admin/screen/allocation/allocated_users_controller.dart';
import 'package:login_app/src/features/student/application/models/application_form_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';

class AllocatedApplicationScreen extends StatelessWidget {
  const AllocatedApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allocated = Get.put(AllocatedUsersController());

    Future<void> generatePDF() async {
      //final pw.Document pdf = pw.Document();

      var myTheme = pw.ThemeData.withFont(
        base: pw.Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-Regular.ttf")),
        bold: pw.Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-Bold.ttf")),
        italic: pw.Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-Italic.ttf")),
        boldItalic: pw.Font.ttf(
            await rootBundle.load("assets/fonts/OpenSans-BoldItalic.ttf")),
      );

      var pdf = pw.Document(
        theme: myTheme,
      );

      pdf.addPage(pw.Page(
        build: (pw.Context context) {
          return pw.ListView.builder(
            itemCount: allocated.userData.length,
            itemBuilder: (context, index) {
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "Name: ${allocated.userData[index].fullName}",
                  ),
                  pw.Text(
                      "Institution: ${allocated.userData[index].institutionName}"),
                  pw.Text("Reg No: ${allocated.userData[index].admNumber}"),
                  pw.Text("Amount: ${allocated.userData[index].amount}"),
                  pw.Divider(),
                ],
              );
            },
          );
        },
      ));

      var directory = await getApplicationDocumentsDirectory();
      await directory.create(recursive: true);
      var filePath = join(directory.path, 'allocated_applications.pdf');
      final file = File(filePath);

      //final file = File('allocated_applications.pdf');
      await file.writeAsBytes(await pdf.save());
      OpenFile.open(filePath);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            "Beneficiaries",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: generatePDF,
              icon: const Icon(Icons.download),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(4),
          //-- Fetching data for all users
          child: StreamBuilder<List<ApplicationFormModel>>(
            stream: allocated.getAllocatedUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  allocated.userData = snapshot.data!;
                  double totalAmount = 0;
                  for (var user in allocated.userData) {
                    totalAmount += user.amount!;
                  }

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Total Amount Allocated: $totalAmount',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: allocated.userData.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                child: ListTile(
                                  iconColor: Colors.blue,
                                  tileColor: Colors.blue.withOpacity(0.1),
                                  title: Text(
                                      "Name: ${allocated.userData[index].fullName}"),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Institution: ${allocated.userData[index].institutionName}"),
                                      Text(
                                          "Reg No: ${allocated.userData[index].admNumber}"),
                                      Text(
                                          "Amount: ${allocated.userData[index].amount}"),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong. Try again"),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
