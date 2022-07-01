import 'package:crypto/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      iconTheme: const IconThemeData(color: kGrey),
      title: Text(
        title,
        style: const TextStyle(
          color: kLightGrey,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
