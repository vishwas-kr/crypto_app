import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/iconButton.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;
    print("Box Height${height / 1.6}");
    return Scaffold(
      backgroundColor: kDarkBlack,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 150,
              padding: const EdgeInsets.only(
                  left: 18, right: 18, bottom: 16, top: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kGreen.withOpacity(0.1), kBlack.withOpacity(0.1)],
                    stops: [0.01, 0.6],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: kGrey,
                            size: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Menu",
                        style: TextStyle(
                            fontSize: 17,
                            color: kWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: kWhite,
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              height: 40,
                              width: 40,
                              child: Image.network(
                                "https://img.icons8.com/color-glass/48/000000/rick-sanchez.png",
                                height: 42,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            "User 1234",
                            style: TextStyle(
                                fontSize: 17,
                                color: kWhite,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ID: 1234567890",
                            style: TextStyle(
                              fontSize: 12,
                              color: kGrey,
                            ),
                          )
                        ],
                      ),
                      const Spacer(
                        flex: 10,
                      ),
                      Container(
                        height: 30,
                        width: width * 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: kGreen,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: kBlack,
                                fontFamily: "MYRIADPRO",
                                fontSize: width * 14,
                              ),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                // height: height / 1.6,
                height: 600,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Common",
                        style: TextStyle(
                            color: kLightGrey,
                            fontSize: constraints.maxWidth / 22),
                      ),
                      // const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconButtons(
                            image: "images/icons/Transfer.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Transfer",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/Deposit.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Deposit",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/Orders.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Orders",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/referal.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Referal",
                            onTap: () {},
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "Trade",
                        style: TextStyle(
                            color: kLightGrey,
                            fontSize: constraints.maxWidth / 22),
                      ),
                      // const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconButtons(
                            image: "images/icons/Convert.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Convert",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/Spot.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Spot",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/margin.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Margin",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/Grid.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Grid Trading",
                            onTap: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          iconButtons(
                            image: "images/icons/Grid.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Grid Trading",
                            onTap: () {},
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Text(
                        "Finance",
                        style: TextStyle(color: kLightGrey, fontSize: 18),
                      ),
                      // const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconButtons(
                            image: "images/icons/savings.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Savings",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/staking.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Staking",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/pay.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Pay",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/loan.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Crypto Loan",
                            onTap: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconButtons(
                            image: "images/icons/pool.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Pool",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/eth.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "ETH 2.0",
                            onTap: () {},
                          ),
                          iconButtons(
                            image: "images/icons/launchpad.png",
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth / 5,
                            text: "Launchpad",
                            onTap: () {},
                          ),
                          SizedBox(
                            width: constraints.maxWidth / 5,
                          )
                        ],
                      ),
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
