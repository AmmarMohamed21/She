import 'package:flutter/cupertino.dart';
import 'package:she/screens/report_screen.dart';

import '../components/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:she/constants.dart';
import '../components/main_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/loading_circle.dart';
import '../components/icon_text_button.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';

final firestore = FirebaseFirestore.instance;

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
          body: TabBarView(
            children: [
              BlogsStream(),
              Text('2'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't hesitate to report any harassment incident!\nYour details will reach the authorities privately.",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    IconTextButton(
                      label: 'Report by phone call',
                      icon: Icons.call,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              color: Color(0xFF757575),
                              child: Container(
                                padding: const EdgeInsets.all(40.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    IconTextButton(
                                      icon: Icons.call,
                                      label: '01116185647',
                                      onPressed: () {
                                        launch("tel://01116185647");
                                      },
                                    ),
                                    IconTextButton(
                                      icon: Icons.call,
                                      label: '19777',
                                      onPressed: () {
                                        launch("tel://19777");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    IconTextButton(
                      label: 'Report by filling a form',
                      icon: Icons.edit,
                      onPressed: () {
                        Navigator.pushNamed(context, ReportScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('blogs').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: LoadingCircle(),
          );
        }
        final blogs = snapshot.data.docs;
        List<BlogCard> blogCards = [];
        for (var blog in blogs) {
          final blogCard = BlogCard(
            title: blog.data()['title'],
            imageURL: blog.data()['imageURL'],
            body: blog.data()['body'],
          );
          blogCards.add(blogCard);
        }
        return ListView(
          children: blogCards,
        );
      },
    );
  }
}
