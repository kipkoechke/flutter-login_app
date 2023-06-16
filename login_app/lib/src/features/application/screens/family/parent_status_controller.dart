import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ParentStatus {
  bothAlive,
  fatherAlive,
  motherAlive,
  bothDeceased,
  fatherDeceased,
  motherDeceased,
  singleParent,
}

class ParentStatusController extends GetxController {
  var selectedParentStatus = ParentStatus.bothAlive.obs;
}

class ParentStatusDropdown extends GetView<ParentStatusController> {
  const ParentStatusDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<ParentStatus>(
        value: controller.selectedParentStatus.value,
        onChanged: (ParentStatus? value) {
          if (value != null) {
            controller.selectedParentStatus.value = value;
          }
        },
        items: ParentStatus.values.map((status) {
          return DropdownMenuItem<ParentStatus>(
            value: status,
            child: Text(getParentStatusText(status)),
          );
        }).toList(),
        decoration: const InputDecoration(
          labelText: 'Parent Status',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  String getParentStatusText(ParentStatus status) {
    switch (status) {
      case ParentStatus.bothAlive:
        return 'Both Parents Alive';
      case ParentStatus.fatherAlive:
        return 'Father Alive';
      case ParentStatus.motherAlive:
        return 'Mother Alive';
      case ParentStatus.bothDeceased:
        return 'Both Parents Deceased';
      case ParentStatus.fatherDeceased:
        return 'Father Deceased';
      case ParentStatus.motherDeceased:
        return 'Mother Deceased';
      case ParentStatus.singleParent:
        return 'Single Parent';
    }
  }
}
