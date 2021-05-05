import 'package:flutter/material.dart';

class IconTextTab extends StatelessWidget {
  final String label;
  final IconData icon;
  IconTextTab({this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          Text(label),
        ],
      ),
    );
  }
}
