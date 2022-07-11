import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(
                      fontSize: 16, color: kWhite, fontWeight: FontWeight.bold),
                ),
                Icon(
                  TernavIcons.lightOutline.filter,
                  color: kWhite,
                )
              ],
            ),
            Center(
              child: Column(
                children: [
                  Image.asset("images/no_notifi.png"),
                  const Text(
                    "You hve no notifications",
                    style: TextStyle(
                        fontSize: 16,
                        color: kWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Withdrawal Successful 🟡",
                        style: TextStyle(
                          color: kLightGrey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "You have successfully withdrawed lorem ipsum dolor sit",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "MYRIADPRO",
                          color: kGrey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 0.1,
                        color: kWhite,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
