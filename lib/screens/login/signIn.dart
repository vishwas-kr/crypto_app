import 'package:crypto/constants.dart';
import 'package:crypto/screens/login/signUp.dart';
import 'package:crypto/screens/login/success.dart';
import 'package:crypto/services/firebase_auth_methods.dart';
import 'package:crypto/widgets/f&g_button.dart';
import 'package:crypto/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isSelected = true;
  bool notVisible = true;
  bool signInType = true;
  final TextEditingController emailPasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController mobilePasswordController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = true;
    notVisible = true;
    signInType = true;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailPasswordController.dispose();
    mobileController.dispose();
    mobilePasswordController.dispose();
  }

  void loginUser() async {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: emailController.text,
          password: emailPasswordController.text,
          context: context,
        );
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SuccessSignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(height);
    print(width);
    return Scaffold(
      backgroundColor: kBlack,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(
                flex: 10,
              ),
              Container(
                height: height * 0.050,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: kDarkBlack, borderRadius: BorderRadius.circular(12)),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = true;
                            print("Sign In: $isSelected");
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth / 2,
                          decoration: isSelected
                              ? BoxDecoration(
                                  color: kBlack,
                                  borderRadius: BorderRadius.circular(10),
                                )
                              : null,
                          child: Center(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  color: isSelected ? kWhite : kGrey,
                                  fontFamily: "MYRIADPRO"),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSelected = false;
                            print("Sign Up: $isSelected");
                          });
                        },
                        child: Container(
                          width: constraints.maxWidth / 2,
                          decoration: isSelected
                              ? null
                              : BoxDecoration(
                                  color: kBlack,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                          child: Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  color: isSelected ? kGrey : kWhite,
                                  fontFamily: "MYRIADPRO"),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
              const Spacer(
                flex: 12,
              ),
              // Sign UP Text
              isSelected
                  ? const Text(
                      "Sign in",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 32,
                      ),
                    )
                  : const Text(
                      "Sign up",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 32,
                      ),
                    ),
              const Spacer(
                flex: 5,
              ),
              isSelected ? signInLayout(height) : SignUp(),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  FGButtom(
                    height: height * 0.06,
                    width: width / 2.5,
                    text: "Facebook",
                    image: "images/icons/facebook.png",
                    onTap: () {},
                  ),
                  const Spacer(),
                  FGButtom(
                    height: height * 0.06,
                    width: width / 2.5,
                    text: "Google",
                    image: "images/icons/google.png",
                    onTap: () {
                      context
                          .read<FirebaseAuthMethods>()
                          .signInWithGoogle(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessSignUpScreen()));
                    },
                  )
                ],
              ),
              const Spacer(
                flex: 15,
              ),
              GestureDetector(
                onTap: () {
                  context
                      .read<FirebaseAuthMethods>()
                      .signInAnonymously(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuccessSignUpScreen()));
                },
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage("images/anonymous.png"),
                      height: height * 0.060,
                    ),
                    const Text(
                      "Use anonymous instead?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kGrey, fontFamily: "MYRIADPRO", height: 2),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container signInLayout(double height) {
    return Container(
      height: height / 2.2,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                signInType
                    ? const Text(
                        "Email",
                        style: TextStyle(
                          color: kLightGrey,
                        ),
                      )
                    : const Text(
                        "Mobile Number",
                        style: TextStyle(
                          color: kLightGrey,
                        ),
                      ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (signInType != true) {
                        signInType = true;
                      } else {
                        signInType = false;
                      }
                    });
                    // mobileController.clear();
                  },
                  child: signInType
                      ? const Text(
                          "Sign in with mobile",
                          style: TextStyle(
                            color: kGreen,
                          ),
                        )
                      : const Text(
                          "Sign in with email",
                          style: TextStyle(
                            color: kGreen,
                          ),
                        ),
                )
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            signInType
                ? textField(
                    controller: emailController,
                    hint: "Enter your email",
                  )
                : textField(
                    controller: mobileController,
                    hint: "Enter your mobile number",
                    keybordType: TextInputType.phone),
            const Spacer(
              flex: 2,
            ),
            const Text(
              "Password",
              style: TextStyle(
                color: kLightGrey,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            signInType
                ? textField(
                    controller: emailPasswordController,
                    hint: "Enter your password",
                    obscureText: notVisible,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          if (notVisible != true) {
                            notVisible = true;
                          } else {
                            notVisible = false;
                          }
                        });
                      },
                      child: notVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: kGrey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: kGrey,
                            ),
                    ),
                  )
                : textField(
                    controller: mobilePasswordController,
                    hint: "Enter your password",
                    obscureText: notVisible,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          if (notVisible != true)
                            notVisible = true;
                          else
                            notVisible = false;
                        });
                      },
                      child: notVisible
                          ? const Icon(
                              Icons.visibility_off,
                              color: kGrey,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: kGrey,
                            ),
                    ),
                  ),
            const Spacer(
              flex: 1,
            ),
            const Text(
              "Forgot password?",
              style: TextStyle(
                color: kGreen,
                //fontFamily: "MYRIADPRO",
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            Container(
              height: constraints.maxHeight * 0.13,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                      primary: kGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: kBlack,
                      //fontFamily: "MYRIADPRO",
                      fontSize: 15,
                    ),
                  )),
            ),
            const Spacer(
              flex: 1,
            ),
            const Text(
              "Or login with",
              textAlign: TextAlign.center,
              style: TextStyle(color: kGrey, fontSize: 13),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        );
      }),
    );
  }
}
