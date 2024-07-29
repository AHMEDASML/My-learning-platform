import 'package:educational_platform/global/utils/color_app.dart';

import 'package:flutter/material.dart';

Widget textSlime(
    {required String text,
    double? sizeFont,
    FontWeight? fontWeight,
    Color? color}) {
  return Text(text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: 16,
        fontFamily: 'Tajawal',
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 1,
      ));
}
