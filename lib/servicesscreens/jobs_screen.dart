import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../components/main_app_bar.dart';
import 'package:she/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/jobs_card.dart';

class JobsScreen extends StatefulWidget {
  static const String id = 'jobs_screen';
  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Jobs', context: context),
      body: ListView(
        children: [
          JobCard(
            jobImageURL:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
            jobTitle: 'Machine Learning Performance Engineer',
            company: 'Google',
            location: 'Banqiao District, New Taipei City, Taiwan',
          ),
          JobCard(
            jobImageURL:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
            jobTitle: 'AI Consultant, Google Cloud Professional Services',
            company: 'Google',
            location: 'Mexico City, CDMX, Mexico',
          ),
          JobCard(
            jobImageURL:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
            jobTitle: 'Data Scientist, Ads Measurement Research',
            company: 'Google',
            location: 'Zürich Switzerland',
          ),
          JobCard(
            jobImageURL:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
            jobTitle: 'Machine Learning Performance Engineer',
            company: 'Google',
            location: 'Banqiao District, New Taipei City, Taiwan',
          ),
          JobCard(
            jobImageURL:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Logo_of_YouTube_%282015-2017%29.svg/1280px-Logo_of_YouTube_%282015-2017%29.svg.png',
            jobTitle:
                'Business Intelligence Analyst, Analytics & Decision Support',
            company: 'Youtube',
            location: 'San Bruno, CA, USA',
          ),
          JobCard(
            jobImageURL:
                'https://seeklogo.com/images/V/vodafone-logo-7C457D9356-seeklogo.com.png',
            jobTitle: 'CRM Analyst',
            company: 'Vodafone',
            location: 'Cairo, Egypt',
          ),
        ],
      ),
    );
  }
}
