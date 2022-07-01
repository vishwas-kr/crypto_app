import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';

Widget greenButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return Container(
    height: 40,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: kGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: const TextStyle(
            color: kBlack,
            fontFamily: "MYRIADPRO",
            fontSize: 16,
          ),
        )),
  );
}
