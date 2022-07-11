import 'package:crypto/constants.dart';
import 'package:crypto/screens/home/pages/activity_page.dart';
import 'package:crypto/screens/home/pages/market_page.dart';
import 'package:crypto/screens/home/pages/trade_page.dart';
import 'package:crypto/screens/home/pages/wallet_page.dart';
import 'package:crypto/screens/notification/notification_screen.dart';
import 'package:crypto/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ternav_icons/ternav_icons.dart';

import 'pages/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final screens = const [
    HomePage(),
    MarketPage(),
    TradePage(),
    ActivityPage(),
    WalletPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.01,
        backgroundColor: kDarkBlack,
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
            },
            child: Image.asset("images/icons/notification.png"),
          )
        ],
      ),
      // bottomNavigationBar: _buildBottomBar(),
      body: Stack(children: [
        IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        Align(alignment: Alignment.bottomCenter, child: _buildBottomBar())
      ]),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 76,
      margin: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          backgroundColor: kBlack,
          selectedItemColor: kGreen,
          selectedLabelStyle:
              const TextStyle(fontFamily: "MYRIADPRO", fontSize: 15),
          unselectedItemColor: kGrey,
          unselectedLabelStyle:
              const TextStyle(fontFamily: "MYRIADPRO", fontSize: 13),
          items: [
            BottomNavigationBarItem(
              icon: Icon(TernavIcons.bold.home_2),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(TernavIcons.bold.bag),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: Icon(TernavIcons.bold.dollar),
              label: 'Trade',
            ),
            BottomNavigationBarItem(
              icon: Icon(TernavIcons.bold.note),
              label: "Activity",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                TernavIcons.bold.wallet,
              ),
              label: "Wallet",
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
