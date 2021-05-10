import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

import 'database.dart';

class ImageUploader extends StatefulWidget {
  @override
  _ImageUploaderState createState() => new _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  List<Asset> images = [];
  String _error;

  @override
  void initState() {
    super.initState();
  }

  Row buildImages() {
    if (images != null && images.length > 0)
      return Row(
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return AssetThumb(
            asset: asset,
            width: 50,
            height: 50,
          );
        }),
      );
    else
      return Row(
        children: [
          Text(
            'Upload incident images if available',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
          ),
        ],
      );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = [];
    });
    Provider.of<Database>(context, listen: false).chosenImages = [];
    List<Asset> resultList;
    String error;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        materialOptions: MaterialOptions(
          allViewTitle: "Choose incident Images",
          actionBarColor: "#E91E63",
          actionBarTitleColor: "#FFFFFF",
          lightStatusBar: false,
          statusBarColor: '#C2185B',
          startInAllView: true,
          selectCircleStrokeColor: "#E91E63",
          selectionLimitReachedText: "You can't select any more.",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    Provider.of<Database>(context, listen: false).chosenImages = resultList;
    setState(() {
      images = resultList;
      if (error == null) _error = 'No Error Dectected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildImages(),
            IconButton(
              iconSize: 40.0,
              onPressed: loadAssets,
              icon: Icon(Icons.add_a_photo),
            ),
          ],
        ),
      ],
    );
  }
}
