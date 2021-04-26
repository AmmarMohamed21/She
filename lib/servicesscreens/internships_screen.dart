import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';
import '../components/jobs_stream.dart';

class InternshipsScreen extends StatelessWidget {
  static const String id = 'internships_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Internships', context: context),
      body: JobsStream(
        collectionName: 'internships',
      ),
    );
  }
}
