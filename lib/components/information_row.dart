import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class InformationRow extends StatelessWidget {
  final String title;
  final String value;
  InformationRow({this.title, this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: kPrimaryText,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          value,
          style: TextStyle(
            color: kPrimaryText,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
