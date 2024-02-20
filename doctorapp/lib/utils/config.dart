// constant config
import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  // width and height initialixation
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenWidth = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get hightSize {
    return screenHeight;
  }

// spacing height
  static const spaceSmall = SizedBox(
    height: 10,
  );
  static final spaceMedium = SizedBox(height: 25);
  static final spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  // text form
  static const OutlinedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  static const focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.greenAccent,
      ));

  static const errorborder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.red,
      ));

  static const primarycolor = Colors.greenAccent;
}
