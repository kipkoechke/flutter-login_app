import 'package:flutter/material.dart';

class RowDisplay extends StatelessWidget {
  const RowDisplay({super.key, required this.keyy, required this.valuee});
  final String keyy;
  final String valuee;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyy),
          Text(
            valuee,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
