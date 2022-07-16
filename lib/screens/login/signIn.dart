import 'package:crypto/constants.dart';
import 'package:crypto/screens/login/signUp.dart';
import 'package:crypto/screens/login/success.dart';
import 'package:crypto/services/firebase_auth_methods.dart';
import 'package:crypto/widgets/f&g_button.dart';
import 'package:crypto/widgets/loading.dart';
import 'package:crypto/widgets/text_field.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/notifiers/app_notifiers.dart';
import '../../app/routes/app_routes.dart';
import '../../services/local_notification_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isSelected = true;
  bool loading = false;
  final TextEditingController emailPasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController mobilePasswordController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    isSelected = true;

// 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => HomeScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");

          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailPasswordController.dispose();
    mobileController.dispose();
    mobilePasswordController.dispose();
  }

  // void loginUser() async {
  //   context.read<FirebaseAuthMethods>().loginWithEmail(
  //         email: emailController.text,
  //         password: emailPasswordController.text,
  //         context: context,
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var appNotifier = Provider.of<AppNotifiers>(context, listen: true);
    var signInType = appNotifier.signInType;
    var isVisbile = appNotifier.isVisible;
    print(height);
    print(width);
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: kBlack,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Spacer(
                      flex: 10,
                    ),
                    Container(
                      height: height * 0.050,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: kDarkBlack,
                          borderRadius: BorderRadius.circular(12)),
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
                    isSelected
                        ? signInLayout(height, signInType, isVisbile)
                        : SignUp(),
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
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            await context
                                .read<FirebaseAuthMethods>()
                                .signInWithGoogle(context);
                            setState(() {
                              loading = false;
                            });
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRoutes.homeScreenRoute, (route) => false);
                          },
                        )
                      ],
                    ),
                    const Spacer(
                      flex: 15,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        await context
                            .read<FirebaseAuthMethods>()
                            .signInAnonymously(context);

                        setState(() {
                          loading = false;
                        });
                        Navigator.pushNamedAndRemoveUntil(context,
                            AppRoutes.homeScreenRoute, (route) => false);
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
                                color: kGrey,
                                fontFamily: "MYRIADPRO",
                                height: 2),
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

  Container signInLayout(double height, bool _signInType, bool isVisible) {
    return Container(
      height: height / 2.2,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                _signInType
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
                    Provider.of<AppNotifiers>(context, listen: false)
                        .changeSignInUpType();
                  },
                  child: _signInType
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
            _signInType
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
            _signInType
                ? textField(
                    controller: emailPasswordController,
                    hint: "Enter your password",
                    obscureText: isVisible,
                    suffixIcon: InkWell(
                      onTap: () {
                        Provider.of<AppNotifiers>(context, listen: false)
                            .toggleObs();
                      },
                      child: Provider.of<AppNotifiers>(context, listen: false)
                          .switchObsIcon,
                    ),
                  )
                : textField(
                    controller: mobilePasswordController,
                    hint: "Enter your password",
                    obscureText: isVisible,
                    suffixIcon: InkWell(
                      onTap: () {
                        Provider.of<AppNotifiers>(context, listen: false)
                            .toggleObs();
                      },
                      child: Provider.of<AppNotifiers>(context, listen: false)
                          .switchObsIcon,
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
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    await context.read<FirebaseAuthMethods>().loginWithEmail(
                          email: emailController.text,
                          password: emailPasswordController.text,
                          context: context,
                        );
                    loading = false;
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutes.homeScreenRoute, (route) => false);
                  },
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
