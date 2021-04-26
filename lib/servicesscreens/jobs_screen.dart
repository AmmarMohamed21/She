import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';
import '../components/jobs_stream.dart';

class JobsScreen extends StatelessWidget {
  static const String id = 'jobs_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Jobs', context: context),
      body: JobsStream(
        collectionName: 'jobs',
      ),
    );
  }
}
