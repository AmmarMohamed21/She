import 'package:flutter/material.dart';
import 'package:she/screens/report_form_screen.dart';
import '../components/icon_text_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't hesitate to report any harassment incident!\nYour details will reach the authorities privately.",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          IconTextButton(
            label: 'Report by phone call',
            icon: Icons.call,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    color: Color(0xFF757575),
                    child: Container(
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          IconTextButton(
                            icon: Icons.call,
                            label: '000000000000',
                            onPressed: () {
                              launch("tel://000000000000");
                            },
                          ),
                          IconTextButton(
                            icon: Icons.call,
                            label: '000000',
                            onPressed: () {
                              launch("tel://000000");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          IconTextButton(
            label: 'Report by filling a form',
            icon: Icons.edit,
            onPressed: () {
              Navigator.pushNamed(context, ReportFormScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
