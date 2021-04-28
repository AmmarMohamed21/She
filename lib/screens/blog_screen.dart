import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';
import 'package:she/constants.dart';

class BlogScreen extends StatelessWidget {
  static const String id = 'blog_screen';
  final String title;
  final String imageURL;
  final String body;

  BlogScreen({this.title, this.imageURL, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Blog', context: context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Image(
              image: NetworkImage(imageURL),
            ),
            SizedBox(
              height: 20.0,
            ),
            kInformationDivider,
            SizedBox(
              height: 20.0,
            ),
            Text(
              body,
              style: TextStyle(fontSize: 16.0, color: kPrimaryText),
            ),
          ],
        ),
      ),
    );
  }
}
