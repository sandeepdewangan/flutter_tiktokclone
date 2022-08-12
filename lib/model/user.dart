import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String username;
  String profilePhoto;
  String email;

  User({
    required this.uid,
    required this.username,
    required this.profilePhoto,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
      profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      username: snapshot['username'],
    );
  }
}
