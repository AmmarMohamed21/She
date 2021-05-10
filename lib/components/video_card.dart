import 'package:flutter/material.dart';

import 'package:she/constants.dart';
import 'package:she/screens/video_screen.dart';

import 'image_container.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final String videoURL;
  final String thumbnail;
  final String length;
  VideoCard({this.title, this.videoURL, this.thumbnail, this.length});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoScreen(
              title: title,
              videoURL: videoURL,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: kCardDecoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ImageContainer(
                    imageURL: thumbnail,
                  ),
                  Align(
                    alignment: Alignment.center,
                    heightFactor: 4.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.7),
                      radius: 25.0,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: kPrimaryColor,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    heightFactor: 8.2,
                    child: Container(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        length,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kPrimaryText,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
