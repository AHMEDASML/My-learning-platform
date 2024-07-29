import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/cupertino.dart';

Widget divedApp({required BuildContext context, Color? color, required double height,  double? width}) {
  return Container(
    decoration: BoxDecoration(

borderRadius: BorderRadius.circular(30),
      color: color ?? ColorManager.white,
    ),
    width:  width ?? 72,

    height: height,
  );
}
