import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class IconTextButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;
  IconTextButton({this.label, this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kDarkPrimaryColor),
          minimumSize: MaterialStateProperty.all<Size>(Size(50, 50)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
