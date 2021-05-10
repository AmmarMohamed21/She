import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'authentication.dart';

class Database extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  Map<String, dynamic> userData = {
    "location": "",
    "birthdate": "",
    "Education": {
      "major": "",
      "university": "",
    },
    "interests": []
  };

  String newInterest;

  List<Asset> chosenImages = [];
  List<String> imagesURL = [];

  void updateUserData(String newLocation, String newBirthdate, Map newEducation,
      List newInterests) {
    userData["location"] = newLocation;
    userData["birthdate"] = newBirthdate;
    userData["Education"] = newEducation;
    userData["interests"] = newInterests;

    notifyListeners();
  }

  void addInterest() {
    if (newInterest != null) {
      userData["interests"].add(newInterest);
      newInterest = null;
    }
  }

  void deleteInterest(String interest) {
    userData["interests"].remove(interest);
    User user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
    firestore
        .collection('users')
        .doc(loggedInUser.uid)
        .update({"interests": userData["interests"]});
    notifyListeners();
  }

  Map<String, dynamic> getUserData() {
    return userData;
  }

  void setLoggedInUser() {
    User user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
  }

  Future<QuerySnapshot> getStream(String collectionName) {
    return firestore.collection(collectionName).get();
  }

  Future<void> getUserFirebaseData() async {
    String userID = loggedInUser.uid;
    var document = await firestore.collection('users').doc(userID).get();
    if (document.data() == null) {
      firestore.collection('users').doc(userID).set(userData);
      document = await firestore.collection('users').doc(userID).get();
    } else {
      updateUserData(document.data()['location'], document.data()['birthdate'],
          document.data()['Education'], document.data()['interests']);
    }
  }

  Future<void> updateUserFirebaseData() async {
    String userID = loggedInUser.uid;
    firestore.collection('users').doc(userID).update(getUserData());
  }

  Future<void> addIncident(String incidentDate, String description) async {
    try {
      await uploadImages();
      await firestore.collection('incidents').add({
        'incidentDate': incidentDate,
        'description': description,
        'images': imagesURL,
        'userID': loggedInUser.uid
      });
      chosenImages = [];
      imagesURL = [];
    } catch (e) {
      return false;
    }
  }

  bool isUserSignedIn() {
    if (_auth.currentUser == null) return false;
    setLoggedInUser();
    return true;
  }

  Future<void> uploadImages() async {
    imagesURL = [];
    for (Asset asset in chosenImages) {
      ByteData byteData = await asset.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("incidentsImages/" +
              loggedInUser.uid +
              "/" +
              DateTime.now().toString() +
              ".jpg");
      try {
        firebase_storage.UploadTask uploadTask = ref.putData(imageData);
        await uploadTask.whenComplete(() async {
          String url = await ref.getDownloadURL();
          imagesURL.add(url);
        });
      } catch (e) {}
    }
  }
}
