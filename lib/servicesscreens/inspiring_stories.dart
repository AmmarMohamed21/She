import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';
import 'package:she/constants.dart';
import '../components/story_page.dart';

class InspiringStoriesScreen extends StatefulWidget {
  static const String id = 'inspiring_stories_screen';
  @override
  _InspiringStoriesScreenState createState() => _InspiringStoriesScreenState();
}

class _InspiringStoriesScreenState extends State<InspiringStoriesScreen> {
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Inspiring Stories', context: context),
      body: PageView(
        children: [
          StoryPage(
            name: 'Heba Rashed',
            title: 'Founder of Mersal',
            imagePath: 'assets/heba_rashed.png',
            story:
                'Heba graduated from Faculty of Al Alsun (Linguistics), Ain Shams University. She received her master and 3 diplomas in project management. After 13 years working for the private sector, she volunteered for ten years, to help various charitable organizations, especially the ones involved with supplying medical treatment to poor people. With the experience she gained and the urge to help underprivileged people to receive better health care she worked in a hostile masculine society and fought her way through all the bureaucracy and the society preferences and registered her Charity Foundation on 2015 "Mersal".',
          ),
          StoryPage(
            name: 'Erica Hanson',
            title: 'GDSC Global Lead',
            imagePath: 'assets/erica_hanson.png',
            story:
                'Erica has been at Google for 14 years. She worked across different areas of the business like: sales, operations, and engineering, in different offices like: Mountain View, San Francisco, London, Singapore, and New York. Now, she is part of the engineering org on the Developer Relations team and works with developers across the world. Also, she is leading all the DSCs across the world, which are over 1255 clubs in over 100 countries. She led many events by Google across the world, like: Everest and GBG, and was one of the Geek Girl Meetup Singapore founders.',
          ),
        ],
      ),
    );
  }
}
