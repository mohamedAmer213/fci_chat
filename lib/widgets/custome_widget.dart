import 'package:flutter/material.dart';

InputDecoration textFormFieldDecoration(String hintText,String labelText) {
 return InputDecoration(
    fillColor: Colors.blue,
    hintText: hintText,
    labelText: labelText,
  );
}

AppBar customAppBar=AppBar(
  title: Text('FciChat',style: TextStyle(color: Colors.black),),
  centerTitle: true,
  backgroundColor: Colors.purple[200],
  elevation: 0,
);

BoxDecoration customSignInButtonDecoration({Color color,}){
  return BoxDecoration(
      color: color,
    borderRadius: BorderRadius.all(Radius.circular(20)),
    border: Border.all(
      color: Colors.white,
      width: 1.5,
    )
  );
}

TextStyle customSignInTextStyle({Color fontColor=Colors.white}){
  return TextStyle(color: fontColor,fontSize: 20,wordSpacing: 1.5,letterSpacing: 1.25);
}
