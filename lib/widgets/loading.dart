import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kWhite,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: kGreen,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please wait...",
                style: TextStyle(fontFamily: "MYRIADPRO", fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
