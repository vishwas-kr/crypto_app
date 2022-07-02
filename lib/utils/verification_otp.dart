import 'package:crypto/widgets/appBar.dart';
import 'package:crypto/widgets/greenButton.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constants.dart';

void showOtpScreen({
  required BuildContext context,
  required TextEditingController otpController,
  required VoidCallback onPressed,
}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Material(
        child: SafeArea(
            child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: kBlack,
          child: Column(
            children: [
              CustomAppBar("Verification"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Enter your code",
                      style: TextStyle(
                          fontSize: 30,
                          color: kWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Please type the code we sent to provided number",
                      style: TextStyle(
                          fontSize: 16,
                          color: kLightGrey,
                          fontFamily: "MYRIADPRO"),
                    ),
                    // const Text(
                    //   "+1234567890",
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       color: kGreen,
                    //       fontFamily: "MYRIADPRO",
                    //       height: 1.5),
                    // ),
                    // const Spacer(
                    //   flex: 3,
                    // ),
                    const SizedBox(
                      height: 30,
                    ),

                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      textStyle: const TextStyle(
                          color: kWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      pinTheme: PinTheme(
                        activeColor: kDarkBlack,
                        inactiveColor: kDarkBlack,
                        selectedFillColor: kDarkBlack,
                        selectedColor: kLightGrey,
                        inactiveFillColor: kDarkBlack,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: 44,
                        fieldWidth: MediaQuery.of(context).size.width / 7.5,
                        activeFillColor: kDarkBlack,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: kBlack,
                      autoFocus: true,
                      enableActiveFill: true,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      keyboardType: TextInputType.number,
                      controller: otpController,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },
                      appContext: context,
                    ),
                    const Text(
                      "Resend code (30)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kGrey, fontFamily: "MYRIADPRO", height: 3),
                    ),
                    const Text(
                      "Resend link",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kGreen,
                        fontFamily: "MYRIADPRO",
                      ),
                    ),
                    // const Spacer(
                    //   flex: 3,
                    // ),
                    const SizedBox(
                      height: 30,
                    ),

                    greenButton(text: "Submit", onPressed: onPressed),
                    // const Spacer(
                    //   flex: 20,
                    // )
                  ],
                ),
              ),
            ],
          ),
        )),
      );
    },
    // builder: (context) => Dialog(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   elevation: 0,
    //   backgroundColor: Colors.transparent,
    //   child: Container(
    //     //height: MediaQuery.of(context).size.height / 2,
    //     decoration: BoxDecoration(
    //         color: kBlack, borderRadius: BorderRadius.circular(12)),
    //     child: Column(
    //       children: [
    //         const Text(
    //           "Enter your code",
    //           style: TextStyle(
    //               fontSize: 30, color: kWhite, fontWeight: FontWeight.bold),
    //         ),
    //         const Spacer(),
    //         const Text(
    //           "Please type the code we sent to",
    //           style: TextStyle(
    //               fontSize: 16, color: kLightGrey, fontFamily: "MYRIADPRO"),
    //         ),
    //         const Text(
    //           "+1234567890",
    //           style: TextStyle(
    //               fontSize: 16,
    //               color: kGreen,
    //               fontFamily: "MYRIADPRO",
    //               height: 1.5),
    //         ),
    //         PinCodeTextField(
    //           length: 6,
    //           obscureText: false,
    //           animationType: AnimationType.fade,
    //           pinTheme: PinTheme(
    //             shape: PinCodeFieldShape.box,
    //             borderRadius: BorderRadius.circular(10),
    //             fieldHeight: 44,
    //             fieldWidth: MediaQuery.of(context).size.width / 7.5,
    //             activeFillColor: kLightGrey,
    //           ),
    //           animationDuration: const Duration(milliseconds: 300),
    //           backgroundColor: kBlack,
    //           enableActiveFill: true,
    //           controller: otpController,
    //           onCompleted: (v) {
    //             debugPrint("Completed");
    //           },
    //           onChanged: (value) {},
    //           beforeTextPaste: (text) {
    //             return true;
    //           },
    //           appContext: context,
    //         ),
    //         greenButton(text: "Submit", onPressed: onPressed)
    //       ],
    //     ),
    //   ),
    // ),
  );
}
