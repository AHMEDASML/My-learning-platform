
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingAppWidget(){
  return const Padding(
    padding: EdgeInsets.all(30.0),
    child: Center(child: SpinKitCircle(
      color: Color(0xff055C9D),
      size: 70.0,
    )),
  );
}

