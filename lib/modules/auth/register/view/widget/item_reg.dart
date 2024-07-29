import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/modules/view_all_teachers/view/view_all_teachers_screen.dart';
import 'package:flutter/material.dart';

Widget itemRegister(
    {required String text,
    required String text2,
    Color? color,
    required BuildContext context}) {
  return GestureDetector(

    onTap: (){
      // navigateTo(context, const ViewAllTeachersScreen());
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            // navigateTo(context, const ViewAllTeachersScreen());
          },

          child: TextBoldApp(
            text: text,
            color: color ?? const Color(0xFF0E86D4),
            sizeFont: 14,
            fontWeight: FontWeight.w700,
          ),
        ),

        GestureDetector(
          onTap: (){
            // navigateTo(context, const ViewAllTeachersScreen());
          },
          child: const SizedBox(
            width: 10,
          ),
        ),



        GestureDetector(
          onTap: (){
            // navigateTo(context, const ViewAllTeachersScreen());
          },
          child: TextBoldApp(
            text: text2,
            color: color ?? const Color(0xFF0E86D4),
            sizeFont: 14,
            fontWeight: FontWeight.w700,
          ),
        )

      ],
    ),
  );
}
