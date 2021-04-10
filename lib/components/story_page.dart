import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class StoryPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String title;
  final String story;

  StoryPage({this.name, this.title, this.imagePath, this.story});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(imagePath),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: kLightPrimaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: kInformationDivider,
          ),
          Text(
            story,
            style: TextStyle(
              fontSize: 17.0,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
