import 'package:flutter/material.dart';
import 'package:she/constants.dart';

class InformationList extends StatelessWidget {
  final String title;
  final List<dynamic> values;

  List<Text> valuesList() {
    List<Text> textList = [];
    if (values == null) {
      return textList;
    }
    for (String value in values) {
      if (value != null)
        textList.add(Text(
          value,
          style: TextStyle(
            color: kPrimaryText,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ));
    }
    return textList;
  }

  InformationList({this.title, this.values});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            color: kPrimaryText,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: valuesList(),
          ),
        ),
      ],
    );
  }
}
