import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function tapDetector;
  ReusableCard({this.title, this.icon, this.tapDetector});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapDetector,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: kPrimaryText,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 3.0,
              ),
              Icon(
                icon,
                color: kPrimaryColor,
                size: 100.0,
              ),
            ],
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.pink,
              offset: Offset(0.0, 1.0),
              blurRadius: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}
