import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/application/controllers/locality_details_controller.dart';
import 'package:login_app/src/features/application/models/locality_model.dart';

class LocalityDetailsScreen extends StatelessWidget {
  const LocalityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocalityDetailsController());

    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Locality Details',
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(bDefaultSize),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kindly fill your location details'),
                  TextFormField(
                    controller: controller.subCounty,
                    decoration: const InputDecoration(
                        label: Text(bFullName),
                        prefixIcon: Icon(Icons.person_outline_rounded)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.ward,
                    decoration: const InputDecoration(
                        label: Text(bWard), prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.location,
                    decoration: const InputDecoration(
                        label: Text(bLocation),
                        prefixIcon: Icon(Icons.numbers)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.subLocation,
                    decoration: const InputDecoration(
                        label: Text(bSubLocation),
                        prefixIcon: Icon(Icons.location_city_rounded)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.village,
                    decoration: const InputDecoration(
                        label: Text(bVillage),
                        prefixIcon: Icon(Icons.holiday_village_rounded)),
                  ),
                  const SizedBox(height: bFormHeight - 20.0),
                  TextFormField(
                    controller: controller.chiefName,
                    decoration: const InputDecoration(
                        label: Text(bChiefName),
                        prefixIcon: Icon(Icons.person_2)),
                  ),
                  const SizedBox(height: bFormHeight - 10.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final locality = LocalityModel(
                          //-- Locality details
                          subCounty: controller.subCounty.text.trim(),
                          ward: controller.ward.text.trim(),
                          location: controller.location.text.trim(),
                          subLocation: controller.subLocation.text.trim(),
                          village: controller.village.text.trim(),
                          chiefName: controller.chiefName.text.trim(),
                        );
                        LocalityDetailsController.instance
                            .createLocation(locality);
                      },
                      child: Text(bNext.toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
