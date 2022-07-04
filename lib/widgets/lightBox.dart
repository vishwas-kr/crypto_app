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
      height: height / 12,
      margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
          color: Color(0xffF1F4F6), borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: width / 8,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(backgroundImage))),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  image,
                )
              ],
            ),
          ),
          SizedBox(
            width: width / 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                heading,
                style: const TextStyle(fontFamily: "MYRIADPRO", color: kBlack),
              ),
              Text(
                subHeading,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 13, fontFamily: "MYRIADPRO", color: kGrey),
              )
            ],
          ),
          const Spacer(),
          InkWell(
            child: Container(
              height: height / 20,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0xffE3E8ED),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: kGrey,
                size: 18,
              ),
            ),
            onTap: onTap,
          )
        ],
      ),
    );
  }
}
