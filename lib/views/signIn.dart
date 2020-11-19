import 'package:fci_chat/services/amer_firebase_authentication.dart';
import 'package:fci_chat/views/conversions.dart';
import 'package:fci_chat/views/register_now.dart';
import 'package:fci_chat/widgets/custome_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:fci_chat/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

// ignore: camel_case_types
class _signInState extends State<signIn> {

  AmerFirebaseAuthentication _amerFirebaseAuthentication =
  AmerFirebaseAuthentication();

  //we need some things ua_Amer like those
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //we have to dispose the controllers ua_Amer solved this is easy to understand solved.....
  @override
  dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  validateTextField(String value) {
    if (value.isEmpty) {
      return 'EnterSomeValues';
    }
    return null;
  }

  submitForm() async {
    if (_formKey.currentState.validate()) {
      FirebaseUser user = await _amerFirebaseAuthentication
          .signInMethod(emailController.text, passwordController.text)
          .then((value) {
        print(value.email);
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Conversions()));
    }
  }

  //we need to use sharedPreferences for setting some values ua_Amer
  // Future<bool> settingRememberTrue(bool newValue)async{
  //   SharedPreferences _sharedPref=await  SharedPreferences.getInstance();
  //  _sharedPref.setBool('rememberMe',  rememberMe);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset('assets/icons/login.svg'),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          // autovalidate: true,
                            validator: (value) => validateTextField(value),
                            controller: emailController,
                            decoration: textFormFieldDecoration(
                                'EnterYourEmail', 'Email')),
                        TextFormField(
                          obscureText: true,
                          validator: (value) => validateTextField(value),
                          // autovalidate: true,
                          controller: passwordController,
                          decoration: textFormFieldDecoration(
                              'EnterYourPassword', 'Password'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10.0),
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: ()  {
                                  print('your password was reset');
                                  // await _amerFirebaseAuthentication
                                  //      .forgetPassword(emailController.text);

                                },
                                child: Row(
                                  children: [
                                    Checkbox(value: rememberMe, onChanged: (bool value){
                                     setState(() {
                                       rememberMe=!rememberMe;
                                     });
                                    //   settingRememberTrue(rememberMe);
                                    }),
                                    Text(
                                      'RememberMe!',
                                      style: TextStyle(
                                        color: Colors.purple.shade900,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10.0),
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: ()  {
                                  print('your password was reset');
                                 // await _amerFirebaseAuthentication
                                 //      .forgetPassword(emailController.text);

                                },
                                child: Text(
                                  'ForgetPassword?',
                                  style: TextStyle(
                                    color: Colors.purple.shade900,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        GestureDetector(
                          onTap: () async {
                            SharedPreferences _sharePreferences= await SharedPreferences.getInstance();
                            _sharePreferences.setBool('isAuthenticated', rememberMe);
                            // _sharePreferences.setBool('isAuthenticated', rememberMe);

                           //this will check if rememberMe ==null or rememberMe ==false
                            if (_formKey.currentState.validate()) {
                              FirebaseUser user =
                              await _amerFirebaseAuthentication
                                  .signInMethod(emailController.text,
                                  passwordController.text);

                              // print(user.uid.toString());
                              // print(user.email.toString());
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Conversions()));
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 18,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Text(
                              'singIn',
                              style: customSignInTextStyle(),
                            ),
                            decoration: customSignInButtonDecoration(
                                color: Colors.deepPurple),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 18,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Text(
                              'singInWithGoogle',
                              style: customSignInTextStyle(
                                  fontColor: Colors.black),
                            ),
                            decoration: customSignInButtonDecoration(
                              color: Color(0xffFBC580),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(''' Don't have An Account? '''),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterNow()));
                              },
                              child: Text(
                                ''' RegisterNow''',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
