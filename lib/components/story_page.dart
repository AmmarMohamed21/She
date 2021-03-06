import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class StoryPage extends StatelessWidget {
  final String imageURL;
  final String name;
  final String title;
  final String story;

  StoryPage({this.name, this.title, this.imageURL, this.story});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  radius: 80.0,
                  foregroundImage: NetworkImage(imageURL),
                  backgroundImage: AssetImage('assets/pp.png'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
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
