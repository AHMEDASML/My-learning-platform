import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget iconAppWidgetLesan(
    {  void Function()? onPressed,
    required IconData icon,
    Color? color,double? size}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3),
    child: GestureDetector(
      onTap:onPressed ,

      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),

            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                const Color(0xffD9D9D9),
                const Color(0xffD9D9D9).withOpacity(0.2),


                // const Color(0xffD9D9D9),

              ],
            ),

          ),
          child:  Icon(icon, color: color ?? Colors.black.withOpacity(0.8),size: 20,),
        ),
      ),
    ),
  );
}
