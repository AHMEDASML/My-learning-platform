import 'package:educational_platform/global/components/button_app.dart';
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/details_lesson/model/details_course_model.dart';
import 'package:flutter/material.dart';

class ItemDetailsLesson extends StatelessWidget {
  final ListVideo video;
  final void Function()? onTap;

  const ItemDetailsLesson({Key? key, required this.video, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  ImagesApp.noLearn,
                  height: 60,
                  fit: BoxFit.fill,
                  width: 70,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      video.title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF055C9D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Text(
                    //   video.,
                    //   textAlign: TextAlign.right,
                    //   style: TextStyle(
                    //     color: Color(0xFF808080),
                    //     fontSize: 12,
                    //     fontFamily: 'Tajawal',
                    //     fontWeight: FontWeight.w400,
                    //     height: 0,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            buttonApp(
              onTap: onTap,
              borderRadius: 8,
              height: 30,
              width: 72,
              color: ColorManager.app7,
              text: const Text(
                'إبدأ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
