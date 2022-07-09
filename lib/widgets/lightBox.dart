import 'package:flutter/material.dart';

import '../constants.dart';

class lighBox extends StatelessWidget {
  const lighBox(
      {Key? key,
      required this.height,
      required this.width,
      required this.backgroundImage,
      required this.image,
      required this.heading,
      required this.subHeading,
      required this.onTap})
      : super(key: key);

  final double height;
  final double width;
  final String backgroundImage;
  final String image;
  final String heading;
  final String subHeading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      //margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          color: const Color(0xffF1F4F6),
          borderRadius: BorderRadius.circular(12)),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          children: [
            Container(
              width: constraints.maxHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(backgroundImage))),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Image.asset(
                    image,
                    height: constraints.maxHeight * 0.9,
                  )
                ],
              ),
            ),
            SizedBox(
              width: constraints.maxWidth / 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                      fontSize: constraints.maxWidth / 24,
                      fontFamily: "MYRIADPRO",
                      color: kBlack),
                ),
                Text(
                  subHeading,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: constraints.maxWidth / 26,
                      fontFamily: "MYRIADPRO",
                      color: kGrey),
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: onTap,
              child: Container(
                height: constraints.maxHeight * 0.6,
                width: constraints.maxWidth / 8,
                decoration: BoxDecoration(
                  color: Color(0xffE3E8ED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: kGrey,
                  size: constraints.maxWidth / 18,
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
