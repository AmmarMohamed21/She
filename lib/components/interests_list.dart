import 'package:flutter/material.dart';
import 'package:she/constants.dart';
import 'package:provider/provider.dart';
import '../services/user_data.dart';

class InterestsList extends StatelessWidget {
  final String title;
  final List<dynamic> values;

  List<Widget> valuesList(BuildContext context) {
    List<Widget> interestsList = [];
    if (values == null) {
      return interestsList;
    }
    for (String value in values) {
      if (value != null)
        interestsList.add(
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(215, 215, 215, 1),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: kPrimaryText,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.close,
                    size: 20.0,
                  ),
                  onTap: () {
                    Provider.of<UserData>(context, listen: false)
                        .deleteInterest(value);
                  },
                ),
              ],
            ),
          ),
        );
    }
    return interestsList;
  }

  InterestsList({this.title, this.values});
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: valuesList(context),
          ),
        ),
      ],
    );
  }
}
