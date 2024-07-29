import 'package:educational_platform/global/utils/images_file.dart';
import 'package:flutter/cupertino.dart';

Widget logoAppIcon({
  double? height,
  double? width,
    String? urlImage,
}) {
  return Center(
    child: Image.asset( urlImage ?? ImagesApp.logoApp2,
        height: height ?? 85, width: width ?? 85),
  );
}
