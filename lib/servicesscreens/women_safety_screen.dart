import 'package:flutter/cupertino.dart';
import 'package:she/components/IconTextTab.dart';
import 'package:she/components/blogs_stream.dart';
import 'package:she/components/image_container.dart';
import 'package:she/components/videos_stream.dart';
import 'package:she/screens/report_screen.dart';
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
        child: Scaffold(
          appBar: TabBar(
            indicatorColor: kLightPrimaryColor,
            labelColor: kPrimaryText,
            tabs: [
              IconTextTab(
                label: 'Blogs',
                icon: FontAwesomeIcons.newspaper,
              ),
              IconTextTab(
                label: 'Videos',
                icon: FontAwesomeIcons.video,
              ),
              IconTextTab(
                label: 'Report',
                icon: FontAwesomeIcons.ban,
              ),
            ],
          ),
          body: TabBarView(
            children: [
              BlogsStream(),
              VideosStream(),
              ReportScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
