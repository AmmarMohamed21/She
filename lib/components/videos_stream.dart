import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'loading_circle.dart';
import 'video_card.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'video_card.dart';

class VideosStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Provider.of<Database>(context, listen: false).getStream('videos'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: LoadingCircle(),
          );
        }
        final videos = snapshot.data.docs;
        List<VideoCard> videoCards = [];
        for (var video in videos) {
          final videoCard = VideoCard(
            title: video.data()['title'],
            videoURL: video.data()['videoURL'],
            length: video.data()['length'],
            thumbnail: video.data()['thumbnail'],
          );
          videoCards.add(videoCard);
        }
        return ListView(
          children: videoCards,
        );
      },
    );
  }
}
