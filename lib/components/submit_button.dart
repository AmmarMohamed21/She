import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({this.onPressed, this.text});
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor)),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
    );
  }
}
