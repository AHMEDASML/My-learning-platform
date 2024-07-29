import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/cupertino.dart';

Widget buttonApp(
    {required Widget text,
    Color? color,
    double? width,
    double? height,
    void Function()? onTap,
    double? borderRadius}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width ?? 100,
      height: height ?? 100,
      decoration: BoxDecoration(

          color: color ?? ColorManager.gray6,
          borderRadius: BorderRadius.circular(borderRadius ?? 10)),
      child: Center(child: text),
    ),
  );
}
