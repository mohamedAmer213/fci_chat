import 'package:fci_chat/views/conversions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fci_chat/widgets/custome_widget.dart';
import 'package:fci_chat/services/amer_firebase_authentication.dart';
import 'package:fci_chat/services/user_database.dart';
class RegisterNow extends StatefulWidget {
  @override
  _RegisterNowState createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  UserDatabase _userDatabase=UserDatabase();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AmerFirebaseAuthentication _amerFirebaseAuthentication =
      AmerFirebaseAuthentication();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  submitForm() async {
    if (_formKey.currentState.validate() && passwordController.text.trim()==confirmPasswordController.text.trim()) {
      FirebaseUser user = await _amerFirebaseAuthentication.RegisterNow(
          emailController.text, passwordController.text);
      print(user.email);
     Navigator.pushNamed(context, 'conversions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: SvgPicture.asset('assets/icons/signup.svg'),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'enterUserName';
                        }
                        return null;
                      },
                      decoration:
                          textFormFieldDecoration('YourUserName', "userName"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'enterEmail';
                        }
                        return null;
                      },
                      decoration: textFormFieldDecoration('YourEmail', "email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      obscureText: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'enterPassword';
                          }
                          return null;
                        },
                        decoration:
                            textFormFieldDecoration('Password', "password"),
                        keyboardType: TextInputType.text),
                    TextFormField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value.isEmpty ) {
                          return 'enterSomeText';
                        }if(passwordController.text.trim()!=confirmPasswordController.text.trim()){
                          return 'password does not match';
                        }
                        return null;
                      },
                      decoration:
                          textFormFieldDecoration('ConfirmPassword', "confirm"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.purple)),
                    color: Colors.purple.shade100,
                    child: Text('singIn'),
                    onPressed: () {
                      submitForm();
                      _userDatabase.uploadUserData(userNameController.text, emailController.text);

                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
