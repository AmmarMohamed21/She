import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance; //to be refactored later
User loggedInUser;

class UserData extends ChangeNotifier {
  Map<String, dynamic> data = {
    "location": "",
    "birthdate": "",
    "Education": {
      "major": "",
      "university": "",
    },
    "interests": []
  };

  String newInterest;

  void updateData(String newLocation, String newBirthdate, Map newEducation,
      List newInterests) {
    data["location"] = newLocation;
    data["birthdate"] = newBirthdate;
    data["Education"] = newEducation;
    data["interests"] = newInterests;

    notifyListeners();
  }

  void addInterest() {
    if (newInterest != null) {
      data["interests"].add(newInterest);
      newInterest = null;
    }
  }

  void deleteInterest(String interest) {
    data["interests"].remove(interest);
    final _auth = FirebaseAuth.instance;
    User user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
    }
    firestore
        .collection('users')
        .doc(loggedInUser.uid)
        .update({"interests": data["interests"]});
    notifyListeners();
  }

  Map<String, dynamic> getData() {
    return data;
  }
}
