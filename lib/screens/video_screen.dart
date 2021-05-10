import 'package:flutter/material.dart';
import 'package:she/services/video_player.dart';
import '../components/main_app_bar.dart';

class VideoScreen extends StatelessWidget {
  static const String id = 'video_screen';
  final String title;
  final String videoURL;

  VideoScreen({this.title, this.videoURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Video', context: context),
      body: VideoPlayer(
        videoURL: videoURL,
      ),
    );
  }
}
