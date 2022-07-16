import 'package:crypto/constants.dart';
import 'package:crypto/screens/login/signIn.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<OnBoardingScreen> {
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height / 815;
    double _width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      backgroundColor: kBlack,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [kGreen.withOpacity(0.4), kBlack.withOpacity(0.1)],
              stops: [0.01, 0.4],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: <Widget>[
                makePage(
                    image: "images/onboarding/on1.png",
                    title: Strings.stepTwoTitle,
                    content: Strings.stepTwoContent),
                makePage(
                    image: "images/onboarding/on2.png",
                    title: Strings.stepThreeTitle,
                    content: Strings.stepThreeContent),
                makePage(
                  image: "images/onboarding/on3.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: _height * 165),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
            Positioned(
                bottom: 90,
                child: SizedBox(
                  height: _height * 54,
                  width: _width * 120,
                  child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex < 2) {
                          _pageController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: kGreen,
                          shadowColor: kGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: currentIndex != 2
                          ? Text(
                              "Next",
                              style: TextStyle(fontSize: 14, color: kBlack),
                            )
                          : Text(
                              "Get Started",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, color: kBlack),
                            )),
                )),
          ],
        ),
      ),
    );
  }

  Widget makePage({image, title, content}) {
    double _height = MediaQuery.of(context).size.height / 815;
    double _width = MediaQuery.of(context).size.width / 375;
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              ///image
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  image,
                  height: _height * 300,
                  width: _width * 300,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),

          ///heading text
          Text(
            
            title,
            style: TextStyle(
              color: kWhite,
              fontSize: _width * 14,
            ),
          ),
          SizedBox(
            height: 20,
          ),

          ///Sub heading text
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kGrey,
              fontSize: _width * 12,
              fontFamily: "MYRIADPRO",
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 7,
      width: isActive ? 32 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color:
              isActive ? Color(0xff3E474F) : Color.fromARGB(19, 241, 244, 246),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

///Contains Text Of onboarding screens can be changed as per requirement.

class Strings {
  static var stepOneTitle = "Trade anytime anywhere";
  static var stepOneContent =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.";
  static var stepTwoTitle = "Save and invest at the same time";
  static var stepTwoContent =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.";
  static var stepThreeTitle = "Transact fast and easy";
  static var stepThreeContent =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.";
}
