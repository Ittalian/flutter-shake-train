import 'package:flutter/material.dart';

class RouteTileRow extends StatelessWidget {
  final String departStation;
  final String arrivalStation;

  const RouteTileRow({
    super.key,
    required this.departStation,
    required this.arrivalStation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(departStation),
        const Text('～'),
        Text(arrivalStation),
      ],
    );
  }
}
