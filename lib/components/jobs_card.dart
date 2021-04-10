import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class JobCard extends StatelessWidget {
  final String jobImageURL;
  final String jobTitle;
  final String company;
  final String location;

  JobCard({this.jobImageURL, this.jobTitle, this.company, this.location});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImage(jobImageURL),
                ),
              ),
              SizedBox(
                width: 7.0,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      company,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      location,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.bookmark_border,
                size: 25.0,
                color: kDarkPrimaryColor,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: kInformationDivider,
        ),
      ],
    );
  }
}
