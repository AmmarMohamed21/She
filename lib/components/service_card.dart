import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function tapDetector;
  ServiceCard({this.title, this.icon, this.tapDetector});
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
                  fontSize: 16.0,
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
        decoration: kCardDecoration,
      ),
    );
  }
}
