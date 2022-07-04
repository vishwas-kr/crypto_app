
import 'package:crypto/utils/showSnackBar.dart';
import 'package:crypto/utils/verification_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/login/success.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // FOR EVERY FUNCTION HERE
  // POP THE ROUTE USING: Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

  // GET USER DATA
  // using null check operator since this method should be called only
  // when the user is logged in
  User get user => _auth.currentUser!;

  // STATE PERSISTENCE STREAM
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  // OTHER WAYS (depends on use case):
  // Stream get authState => FirebaseAuth.instance.userChanges();
  // Stream get authState => FirebaseAuth.instance.idTokenChanges();
  // KNOW MORE ABOUT THEM HERE: https://firebase.flutter.dev/docs/auth/start#auth-state

  // EMAIL SIGN UP
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
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
    }
  }

  // EMAIL LOGIN
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
      if (!user.emailVerified) {
        await sendEmailVerification(context);
        // restrict access to certain things using provider
        // transition to another page instead of home screen
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }

  // GOOGLE SIGN IN
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // if you want to do specific task like storing information in firestore
        // only for new users using google sign in (since there are no two options
        // for google sign in and google sign up, only one as of now),
        // do the following:

        // if (userCredential.user != null) {
        //   if (userCredential.additionalUserInfo!.isNewUser) {}
        // }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // ANONYMOUS SIGN IN
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }

  // PHONE SIGN IN
  Future<void> phoneSignIn(String phoneNumber,
      {required BuildContext context}) async {
    TextEditingController otpController = TextEditingController();
    // FOR ANDROID, IOS
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber",
      //  Automatic handling of the SMS code
      verificationCompleted: (PhoneAuthCredential credential) async {
        // !!! works only on android !!!
        await _auth.signInWithCredential(credential);
      },
      // Displays a message when verification fails
      verificationFailed: (e) {
        showSnackBar(context, e.message!);
      },
      // Displays a dialog box when OTP is sent
      codeSent: ((String verificationId, int? resendToken) async {
        showOtpScreen(
            context: context,
            otpController: otpController,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: otpController.text.trim());

              await _auth.signInWithCredential(credential);
              //Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SuccessSignUpScreen()));
            });
      }),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }
}


// class FirebaseAuthMethods {
//   final FirebaseAuth _auth;
//   FirebaseAuthMethods(this._auth);

//   User get user => _auth.currentUser!;

//   //State Persistance
//   Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

//   //Email Sign Up

//   Future<void> signUpWithEmail({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await sendEmailVerification(context);
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }

//   //Email Login

//   Future<void> loginWithEmail({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       if (!_auth.currentUser!.emailVerified) {
//         await sendEmailVerification(context);
//       } else {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => HomeScreen()));
//       }
//     } on FirebaseException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }

//   // Email Verification

//   Future<void> sendEmailVerification(BuildContext context) async {
//     try {
//       _auth.currentUser!.sendEmailVerification();
//       showSnackBar(context, "Email Verification sent!");
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }

//   //Google Sign in
//   Future<void> signInWithGoogle(BuildContext context) async {
//     try {
//       final GoogleSignInAccount? googleUSer = await GoogleSignIn().signIn();

//       final GoogleSignInAuthentication? googleAuth =
//           await googleUSer?.authentication;

//       if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
//         //Create a new crendential
//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth?.accessToken,
//           idToken: googleAuth?.idToken,
//         );
//         UserCredential userCredential =
//             await _auth.signInWithCredential(credential);
//       }
//     } on FirebaseException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }

//   //Sign in Anonymous
//   Future<void> signInAnonymously(BuildContext context) async {
//     try {
//       _auth.signInAnonymously();
//     } on FirebaseException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }

//   //Phone Number Sign In

//   Future<void> phoneSignIn({
//     required String phoneNumber,
//     required BuildContext context,
//   }) async {
//     TextEditingController otpController = TextEditingController();
//     try {
//       _auth.verifyPhoneNumber(
//           phoneNumber: "+91$phoneNumber",
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await _auth.signInWithCredential(credential);
//           },
//           verificationFailed: (e) {
//             showSnackBar(context, e.message!);
//           },
//           codeSent: ((String verificationId, int? resendToken) async {
//             showOtpScreen(
//                 context: context,
//                 otpController: otpController,
//                 onPressed: () async {
//                   PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                       verificationId: verificationId,
//                       smsCode: otpController.text.trim());

//                   await _auth.signInWithCredential(credential);
//                   // Navigator.pop(context);
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => SuccessSignUpScreen()));
//                 });
//           }),
//           codeAutoRetrievalTimeout: (String verificationId) {});
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }

// // SIGN OUT
//   Future<void> signOut(BuildContext context) async {
//     try {
//       await _auth.signOut();
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!); // Displaying the error message
//     }
//   }

//   // DELETE ACCOUNT
//   Future<void> deleteAccount(BuildContext context) async {
//     try {
//       await _auth.currentUser!.delete();
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!); // Displaying the error message
//       // if an error of requires-recent-login is thrown, make sure to log
//       // in user again and then delete account.
//     }
//   }
// }
