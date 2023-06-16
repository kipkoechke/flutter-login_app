import 'package:flutter/material.dart';

enum ParentStatus {
  bothAlive,
  fatherAlive,
  motherAlive,
  bothDeceased,
  fatherDeceased,
  motherDeceased,
  singleParent,
}

class ParentStatusDropdown extends StatefulWidget {
  const ParentStatusDropdown({Key? key}) : super(key: key);

  @override
  State<ParentStatusDropdown> createState() => _ParentStatusDropdownState();
}

class _ParentStatusDropdownState extends State<ParentStatusDropdown> {
  ParentStatus? selectedParentStatus;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ParentStatus>(
      value: selectedParentStatus,
      onChanged: (ParentStatus? value) {
        setState(() {
          selectedParentStatus = value;
        });
      },
      items: ParentStatus.values.map((status) {
        return DropdownMenuItem<ParentStatus>(
          value: status,
          child: Text(getParentStatusText(status)),
        );
      }).toList(),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.family_restroom_rounded),
        labelText: 'Parent Status',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
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
