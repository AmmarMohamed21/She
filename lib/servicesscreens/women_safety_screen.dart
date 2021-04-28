import '../components/blog_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:she/constants.dart';
import '../components/main_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/loading_circle.dart';

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
              Text('3'),
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
