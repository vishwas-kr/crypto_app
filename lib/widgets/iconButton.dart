import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';

InkWell iconButtons({
  required String image,
  required double height,
  required double width,
  required String text,
  required VoidCallback onTap,
}) {
  return InkWell(
      child: SizedBox(
    height: height,
    width: width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        Text(
          text,
          style: const TextStyle(fontFamily: "MYRIADPRO", color: kLightGrey),
        )
      ],
    ),
  ));
}
