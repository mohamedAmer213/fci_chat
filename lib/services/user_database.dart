import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDatabase {
  Random random=Random();
  int documentNumber=Random().nextInt(100);
  //we need to make some methods ua_amer
  uploadUserData(String username,String email) async {
  await  Firestore.instance.collection('users').document('$documentNumber').setData({
    'userName':username,
    'email':email,
  });
  }

}
