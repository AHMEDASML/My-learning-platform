 import 'package:educational_platform/global/utils/color_app.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBoldApp extends StatelessWidget {
  final String text;
  final double? sizeFont;
  final  FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  const TextBoldApp({Key? key, required this.text, this.sizeFont, this.fontWeight, this.color, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      textAlign: textAlign ?? TextAlign.right,
      style: TextStyle(
        fontFamily: 'Tajawal',
        color:color ?? Colors.white,
        fontSize: sizeFont ?? 22,
        fontWeight: FontWeight.bold,
        height: 0.09,
      ),
    );
  }
}


