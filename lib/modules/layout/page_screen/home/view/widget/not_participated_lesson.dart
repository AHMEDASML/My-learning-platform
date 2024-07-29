import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:flutter/material.dart';

class NotParticipatedLesson extends StatelessWidget {
  const NotParticipatedLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.white),
          color: const Color(0xffE4F0F4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                width: 128,
                height: 89,
                ImagesApp.noLearn,
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              'اشترك الأن',
              style: TextStyle(
                color: Color(0xFF055C9D),
                fontSize: 16,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
