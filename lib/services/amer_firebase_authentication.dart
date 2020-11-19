import 'package:firebase_auth/firebase_auth.dart';

// we need to type some functions For Authentication ua_Amer
//this is needed for the public use for all  our functions
class AmerFirebaseAuthentication {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInMethod(String email, String password) async {
    /// this method will be used if you already have an account and want to signIn
    try {
      FirebaseUser firebaseUser = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return firebaseUser;
    } catch (exception) {
      print(exception);
    }
  }

  Future<FirebaseUser> signOutMethod(String email, String password) async {
    try {
      FirebaseUser currentUser = await _firebaseAuth.currentUser();
      await _firebaseAuth.signOut();
      return currentUser;
    } catch (e) {
      print(e);
    }
  }

// we need to make method for singIn for the FirstTime
  Future<FirebaseUser> RegisterNow(String email, String password) async {
    //this will be used for creating email and password for the first time
    // and this is equal to signUp which means SUbScribe to our application
    try {
      Future<FirebaseUser> newUser = _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return newUser;
    } catch (except) {
      print(except);
    }
  }

// typing method for forgetting password
  forgetPassword(String email) {
    try {
      _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (exception) {
      print(exception);
    }
  }
}
