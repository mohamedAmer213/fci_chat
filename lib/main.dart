import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fci_chat/views/conversions.dart';
import 'package:fci_chat/views/signIn.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

//here we will write some common used variables across the complete application ua_amer solved
bool rememberMe=false;
var usersRef=Firestore.instance.collection('users');
String userId='';
main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //
  // SharedPreferences _sharedPreferences=await SharedPreferences.getInstance();
  // if(_sharedPreferences.getBool('rememberMe')==true){
  //   runApp(SecondWidget());
  // }else{
  //   runApp(fciChat());
  // }

  SharedPreferences _sharedPreferences=await  SharedPreferences.getInstance();
  /// this is the most important part of the application because at the First time of installing the
  /// application the isAuth variable will equal null because we didn't have any value passed to the isAuth
  /// from CheckedBox ua_amer solved
  bool isAuth=_sharedPreferences.getBool('isAuthenticated')??false;

  // runApp(isAuth?Conversions():fciChat());
  runApp(fciChat());
  print('Amer could solve this problem solved ');
  print(isAuth);
}

// ignore: camel_case_types
class fciChat extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    routes: {
      'conversions':(context)=>Conversions(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: signIn(),
  );
  }
}
class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

