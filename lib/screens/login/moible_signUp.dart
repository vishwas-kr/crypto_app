import 'package:crypto/constants.dart';
import 'package:crypto/screens/login/success.dart';
import 'package:crypto/services/firebase_auth_methods.dart';
import 'package:crypto/widgets/appBar.dart';
import 'package:crypto/widgets/greenButton.dart';
import 'package:crypto/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileSignUp extends StatefulWidget {
  const MobileSignUp({Key? key}) : super(key: key);

  @override
  State<MobileSignUp> createState() => _MobileSignUpState();
}

class _MobileSignUpState extends State<MobileSignUp> {
  final TextEditingController signUpMobileController = TextEditingController();

  // void mobileNumberSignIn() {
  //   context.read<FirebaseAuthMethods>().phoneSignIn(
  //       phoneNumber: signUpMobileController.text, context: context);
  //   // Navigator.push(context,
  //   //     MaterialPageRoute(builder: (context) => SuccessSignUpScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar("Sign Up"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Register with mobile",
              style: TextStyle(
                  fontSize: 30, color: kWhite, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Text(
              "Please type your number, then we’ll send a verification code for authentication.",
              style: TextStyle(
                  fontSize: 15, color: kLightGrey, fontFamily: "MYRIADPRO"),
            ),
            const Spacer(
              flex: 3,
            ),
            const Text(
              "Mobile number",
              style: TextStyle(color: kLightGrey, fontFamily: "MYRIADPRO"),
            ),
            const Spacer(),
            textField(
                controller: signUpMobileController,
                hint: "Enter your mobile number",
                keybordType: TextInputType.number),
            const Spacer(
              flex: 3,
            ),
            greenButton(
              text: "Send OTP",
              onPressed: () {
                context
                    .read<FirebaseAuthMethods>()
                    .phoneSignIn(signUpMobileController.text, context: context);
              },
            ),
            const Spacer(
              flex: 25,
            )
          ],
        ),
      ),
    );
  }
}
