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
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              // height: height / 1.5,
              // width: width / 1.4,
              // fit: BoxFit.cover,
            ),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style:
                  const TextStyle(fontFamily: "MYRIADPRO", color: kLightGrey),
            )
          ],
        ),
      ));
}
