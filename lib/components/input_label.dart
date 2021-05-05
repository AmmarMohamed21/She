import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String label;

  InputLabel({this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
