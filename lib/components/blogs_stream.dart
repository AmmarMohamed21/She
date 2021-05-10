import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import '../components/loading_circle.dart';
import 'blog_card.dart';

class BlogsStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Provider.of<Database>(context, listen: false).getStream('blogs'),
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
