import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  ImageContainer({this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.fill,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            image: NetworkImage(imageURL),
            //should add loading builder
          ),
        ),
      ),
    );
  }
}
