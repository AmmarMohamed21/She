import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';
import 'package:she/constants.dart';
import '../components/story_page.dart';
import '../components/loading_circle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class InspiringStoriesScreen extends StatelessWidget {
  static const String id = 'inspiring_stories_screen';

  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Inspiring Stories', context: context),
      body: StoriesStream(),
    );
  }
}

class StoriesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('inspiringStories').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: LoadingCircle(),
          );
        }
        final stories = snapshot.data.docs;
        List<StoryPage> storyPages = [];
        for (var story in stories) {
          final storyPage = StoryPage(
            name: story.data()['name'],
            title: story.data()['title'],
            imageURL: story.data()['imageURL'],
            story: story.data()['story'],
          );
          storyPages.add(storyPage);
        }
        return PageView(
          children: storyPages,
        );
      },
    );
  }
}
