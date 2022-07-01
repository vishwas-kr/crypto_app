import 'package:crypto/constants.dart';
import 'package:crypto/widgets/greenButton.dart';
import 'package:flutter/material.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kBlack,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kGreen.withOpacity(0.4), kBlack.withOpacity(0.1)],
              stops: [0.01, 0.4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 4,
                ),
                Image.asset("images/successful.png"),
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  "Your account has been successfully created!",
                  style: TextStyle(
                      fontSize: 30, color: kWhite, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: greenButton(text: "Get Started", onPressed: () {}),
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
