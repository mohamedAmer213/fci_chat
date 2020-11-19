import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userName;
  String email;
  String password;

  User({this.userName, this.email, this.password});

  // this is instead of the convenient constructor ua_amer
  factory User.fromMap(DocumentSnapshot doc) {
    return User(
      userName: doc['userName'].toString(),
      email: doc['email'].toString(),
      password: doc['password'].toString(),
    );
  }
}
