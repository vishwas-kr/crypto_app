import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpBox(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: MediaQuery.of(context).size.width / 7.5,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: kLightGrey,
        style: const TextStyle(
            color: kWhite, fontSize: 18, fontWeight: FontWeight.bold),
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            isDense: true,
            filled: true,
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
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
