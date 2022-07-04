import 'package:crypto/constants.dart';
import 'package:crypto/services/firebase_auth_methods.dart';
import 'package:crypto/widgets/iconButton.dart';
import 'package:crypto/widgets/lightBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      backgroundColor: kDarkBlack,
      appBar: AppBar(
        elevation: 0.01,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Material(
              color: kWhite,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsets.all(4.0),
                  height: 42,
                  width: 42,
                  child: Image.network(
                    "https://img.icons8.com/color-glass/48/000000/rick-sanchez.png",
                    height: 42,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            child: Image.asset("images/icons/search.png"),
          ),
          InkWell(
            child: Image.asset("images/icons/scanner.png"),
          ),
          InkWell(
            child: Image.asset("images/icons/notification.png"),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height / 4,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: LayoutBuilder(builder: (BuildContext context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconButtons(
                        image: "images/icons/Deposit.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "Deposit",
                        onTap: () {},
                      ),
                      iconButtons(
                        image: "images/icons/referal.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "Referal",
                        onTap: () {},
                      ),
                      iconButtons(
                        image: "images/icons/Grid.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "Grid Trading",
                        onTap: () {},
                      ),
                      iconButtons(
                        image: "images/icons/margin.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "Margin",
                        onTap: () {},
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconButtons(
                        image: "images/icons/launchpad.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "Launchpad",
                        onTap: () {},
                      ),
                      iconButtons(
                        image: "images/icons/savings.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "Savings",
                        onTap: () {},
                      ),
                      iconButtons(
                        image: "images/icons/swap.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "Liquid Swap",
                        onTap: () {},
                      ),
                      iconButtons(
                        image: "images/icons/more.png",
                        height: constraints.maxHeight * 0.4,
                        width: constraints.maxWidth / 5,
                        text: "More",
                        onTap: () {},
                      )
                    ],
                  )
                ],
              );
            }),
          ),
          Expanded(
              child: Container(
            color: kWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                lighBox(
                  height: height,
                  width: width,
                  backgroundImage: "images/icons/box.png",
                  image: "images/icons/rocket.png",
                  heading: "P2P Trading",
                  subHeading: "Bank Transfer, Paypal",
                  onTap: () {},
                ),
                lighBox(
                  height: height,
                  width: width,
                  backgroundImage: "images/icons/box.png",
                  image: "images/icons/credit.png",
                  heading: "Credit/Debit card",
                  subHeading: "Visa, Mastercard",
                  onTap: () {},
                ),
              ],
            ),
          )),
          // when user signs anonymously or with phone, there is no email
          if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(user.providerData[0].providerId),
          // display phone number only when user's phone number is not null
          if (user.phoneNumber != null) Text(user.phoneNumber!),
          // uid is always available for every sign in method
          Text(user.uid),
          // display the button only when the user email is not verified
          // or isnt an anonymous user
          Text("${user.uid} Logged in"),
          ElevatedButton(
              onPressed: () {
                context.read<FirebaseAuthMethods>().signOut(context);
              },
              child: const Text("Sign Out")),
          ElevatedButton(
              onPressed: () {
                context.read<FirebaseAuthMethods>().deleteAccount(context);
              },
              child: const Text("Delete"))
        ],
      ),
    );
  }
}
