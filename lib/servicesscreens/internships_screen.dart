import 'package:flutter/material.dart';
import '../components/main_app_bar.dart';
import '../components/jobs_card.dart';

class InternshipsScreen extends StatefulWidget {
  static const String id = 'internships_screen';
  @override
  _InternshipsScreenState createState() => _InternshipsScreenState();
}

class _InternshipsScreenState extends State<InternshipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'Internships', context: context),
      body: ListView(
        children: [
          JobCard(
            jobImageURL:
                'https://media-exp1.licdn.com/dms/image/C4E0BAQGMf2S5oM84FQ/company-logo_200_200/0/1611066356544?e=1626307200&v=beta&t=kkpc1XHPg2Odc4-80lqpagn9skBcYWITbZDFYgm3DcA',
            jobTitle: 'Brand Management Internship',
            company: 'Procter & Gamble',
            location: 'Cairo, Egypt',
          ),
          JobCard(
            jobImageURL:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
            jobTitle: 'Student Training in Engineering Program (STEP) 2021',
            company: 'Google',
            location: 'Seoul, Korea',
          ),
          JobCard(
            jobImageURL:
                'https://media-exp1.licdn.com/dms/image/C4D0BAQEJd9iXSB3aTQ/company-logo_200_200/0/1604441643356?e=1626307200&v=beta&t=OMczOO4YoLFf-5eRz9JE6uM0ByAwaT4CU0514bEnZ00',
            jobTitle: 'Intern in Criminal Justice',
            company: 'United Nations',
            location: 'Cairo, Egypt',
          ),
          JobCard(
            jobImageURL:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
            jobTitle: 'Sales and Marketing Apprenticeship',
            company: 'Google',
            location: 'Paris, France',
          ),
          JobCard(
            jobImageURL:
                'https://media-exp1.licdn.com/dms/image/C4E0BAQHd5Km8_W6GVA/company-logo_200_200/0/1614178926580?e=1626307200&v=beta&t=ZGKhBeHfe_MLW9H1j17VQNCp0EFqV1iNptVlivgFa1A',
            jobTitle: 'Undergrad Software Engineer Intern',
            company: 'Dell',
            location: 'Cairo, Egypt',
          ),
        ],
      ),
    );
  }
}
