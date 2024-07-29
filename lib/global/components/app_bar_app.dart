import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/material.dart';

class AppBarApp extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const AppBarApp({Key? key, required this.text}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(


      centerTitle: false, // تعديل هذا لتمكين محاذاة النص والأيقونة بجانب بعضهما
      title: Row(
        children: [
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).pop();
          //   },
          //   child: Container(
          //     width: 36,
          //     height: 36,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       border: Border.all(color: const Color(0xFF055C9D), width: 1.5),
          //       color: Colors.transparent,
          //     ),
          //
          //     child: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF055C9D)),
          //   ),
          // ),
          const SizedBox(width: 10),

          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF444444),
              fontSize: 15,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),



        ],
      ),
      backgroundColor: ColorManager.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
