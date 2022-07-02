// import 'package:crypto/constants.dart';
// import 'package:crypto/screens/login/success.dart';
// import 'package:crypto/widgets/appBar.dart';
// import 'package:crypto/widgets/greenButton.dart';
// import 'package:crypto/widgets/otpBox.dart';
// import 'package:flutter/material.dart';

// class VerificationCode extends StatefulWidget {
//   const VerificationCode(
//       {
//       // required TextEditingController boxOne,
//       // required TextEditingController boxTwo,
//       // required TextEditingController boxThree,
//       // required TextEditingController boxFour,
//       // required TextEditingController boxFive,
//       // required TextEditingController boxSix,
//       Key? key})
//       : super(key: key);

//   @override
//   State<VerificationCode> createState() => _VerificationCodeState();
// }

// class _VerificationCodeState extends State<VerificationCode> {
//   final TextEditingController _BoxdOne = TextEditingController();
//   final TextEditingController _BoxTwo = TextEditingController();
//   final TextEditingController _BoxThree = TextEditingController();
//   final TextEditingController _BoxFour = TextEditingController();
//   final TextEditingController _BoxFive = TextEditingController();
//   final TextEditingController _BoxSix = TextEditingController();

//   String? _otp;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: kBlack,
//         resizeToAvoidBottomInset: false,
//         appBar: CustomAppBar("Verification"),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 "Enter your code",
//                 style: TextStyle(
//                     fontSize: 30, color: kWhite, fontWeight: FontWeight.bold),
//               ),
//               const Spacer(),
//               const Text(
//                 "Please type the code we sent to",
//                 style: TextStyle(
//                     fontSize: 16, color: kLightGrey, fontFamily: "MYRIADPRO"),
//               ),
//               const Text(
//                 "+1234567890",
//                 style: TextStyle(
//                     fontSize: 16,
//                     color: kGreen,
//                     fontFamily: "MYRIADPRO",
//                     height: 1.5),
//               ),
//               const Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   OtpBox(_BoxdOne, true),
//                   OtpBox(_BoxTwo, false),
//                   OtpBox(_BoxThree, false),
//                   OtpBox(_BoxFour, false),
//                   OtpBox(_BoxFive, false),
//                   OtpBox(_BoxSix, false)
//                 ],
//               ),
//               const Text(
//                 "Resend code (30)",
//                 textAlign: TextAlign.center,
//                 style:
//                     TextStyle(color: kGrey, fontFamily: "MYRIADPRO", height: 3),
//               ),
//               const Text(
//                 "Resend link",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: kGreen,
//                   fontFamily: "MYRIADPRO",
//                 ),
//               ),
//               const Spacer(
//                 flex: 3,
//               ),
//               greenButton(
//                 text: "Continue",
//                 onPressed: () {
//                   setState(() {
//                     _otp = _BoxdOne.text +
//                         _BoxTwo.text +
//                         _BoxThree.text +
//                         _BoxFour.text +
//                         _BoxFive.text +
//                         _BoxSix.text;
//                   });
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => SuccessSignUpScreen()));
//                 },
//               ),
//               const Spacer(
//                 flex: 20,
//               )
//             ],
//           ),
//         ));
//   }
// }
