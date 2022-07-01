import 'package:crypto/screens/home/home.dart';
import 'package:crypto/utils/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  //Email Sign Up

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Email Login

  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  // Email Verification

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Verification sent!");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //Phone Number Sign In

  // Future<void> phoneSignIn({
  //   required String phoneNumber,
  //   required BuildContext context,
  // }) async {
  //   try {
  //     _auth.verifyPhoneNumber(
  //         phoneNumber: phoneNumber,
  //          verificationCompleted: (PhoneAuthCredential credential){},
  //          //(PhoneAuthCredential credential) async {
  //         //   await _auth.signInWithCredential(credential);
  //         // },
  //         verificationFailed: (e) {
  //           showSnackBar(context, e.message!);
  //         },
  //         codeSent: ((String verificationId, int? resendToken) async {
  //           PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //               verificationId: verificationId, smsCode: "");
  //         }),
  //         codeAutoRetrievalTimeout: (String verificationId) {});
  //   } catch (e) {}
  // }
}
