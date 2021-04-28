import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:she/constants.dart';
import 'package:she/screens/blog_screen.dart';

class BlogCard extends StatelessWidget {
  final String title;
  final String body;
  final String imageURL;
  BlogCard({this.title, this.body, this.imageURL});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(
              title: title,
              body: body,
              imageURL: imageURL,
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
              Image(
                image: NetworkImage(imageURL),
              ),
              SizedBox(
                height: 8.0,
              ),
              ExpandablePanel(
                header: Text(
                  title,
                  style: TextStyle(
                    color: kPrimaryText,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                expanded: Text(
                  body,
                  style: TextStyle(
                    color: kSecondaryText,
                    fontSize: 15.0,
                  ),
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
