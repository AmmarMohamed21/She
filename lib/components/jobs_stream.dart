import 'package:flutter/material.dart';
import 'loading_circle.dart';
import 'jobs_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class JobsStream extends StatelessWidget {
  final collectionName;
  JobsStream({this.collectionName});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection(collectionName).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: LoadingCircle(),
          );
        }
        final jobs = snapshot.data.docs;
        List<JobCard> jobCards = [];
        for (var job in jobs) {
          final jobCard = JobCard(
            jobImageURL: job.data()['jobImageURL'],
            jobTitle: job.data()['jobTitle'],
            company: job.data()['company'],
            location: job.data()['location'],
          );
          jobCards.add(jobCard);
        }
        return ListView(
          children: jobCards,
        );
      },
    );
  }
}
