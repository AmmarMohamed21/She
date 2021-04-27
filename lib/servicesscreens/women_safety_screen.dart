import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:she/constants.dart';
import '../components/main_app_bar.dart';

class WomenSafetyScreen extends StatelessWidget {
  static const String id = 'women_safety_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Women Safety', context: context),
      body: DefaultTabController(
        length: 3,
        child: TabBar(
          indicatorColor: kLightPrimaryColor,
          labelColor: kPrimaryText,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.newspaper),
                  Text('Blogs'),
                ],
              ),
              // icon: Icon(FontAwesomeIcons.newspaper),
              // text: 'Blogs',
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.video),
                  Text('Videos'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(FontAwesomeIcons.ban),
                  Text('Report'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
