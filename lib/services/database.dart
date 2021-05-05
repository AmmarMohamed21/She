import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Stream<QuerySnapshot> getStream(String collectionName) {
    return firestore.collection(collectionName).snapshots();
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

  void addIncident(String title, String incidentDate, String description) {
    firestore.collection('incidents').add({
      'title': title,
      'incidentDate': incidentDate,
      'description': description,
      'userID': loggedInUser.uid
    });
  }

  bool isUserSignedIn() {
    if (_auth.currentUser == null) return false;
    setLoggedInUser();
    return true;
  }
}
