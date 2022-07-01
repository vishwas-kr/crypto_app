import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';

Widget textField({
  required TextEditingController controller,
  required String hint,
  //required double height,
  bool obscureText = false,
 TextInputType? keybordType,
  Widget? suffixIcon,
}) {
  return SizedBox(
    //height: height,
    child: TextFormField(
      controller: controller,
      keyboardType: keybordType,
      style: const TextStyle(
        color: kWhite,
      ),
      obscureText: obscureText,
      cursorColor: kLightGrey,
      autofocus: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(color: kGrey, fontSize: 14),
        filled: true,

        suffixIcon: suffixIcon,
        //focusColor: kGrey,
        fillColor: kDarkBlack,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
          borderSide: BorderSide(
            color: kDarkBlack,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            color: kLightGrey,
            // width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
      ),
    ),
  );
}
