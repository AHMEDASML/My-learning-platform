import 'package:carousel_slider/carousel_slider.dart';
import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/details_lesson/view/screen/details_lesson_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/home/model/home_model.dart';
import 'package:educational_platform/modules/lesson_details_courses/view/details_lesson_courses_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// تأكد من استيراد العناصر والمكتبات اللازمة لتنفيذ الكود بنجاح

class SliderHomeCourses extends StatelessWidget {
  final List<LatestCourse> latestCourses;

  const SliderHomeCourses({Key? key, required this.latestCourses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: SizedBox(
        height: 220,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.75),
          itemCount: latestCourses.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                navigateTo(
                  context,
                  DetailsLessonCoursesScreen(
                    idDetails: latestCourses[index].id ?? 1,
                  ),
                );
              },
              child: buildCard(latestCourses[index], theme),
            );
          },
        ),
      ),
    );
  }

  Widget buildCard(LatestCourse item, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: Color(0xff055C9D),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffD9D9D9),
                Color(0xffD9D9D9),
                Color(0xffD9D9D9),
                Color(0xffD9D9D9).withOpacity(0.7),
              ],
            ),

            // image: DecorationImage(
            //   image: AssetImage(ImagesApp. ),
            //   fit: BoxFit.fill,
            // ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child:

                Image.network(item.cover,
                    width: double.infinity, height: 140,
                  fit: BoxFit.fill,

                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Image.asset(
                        ImagesApp.noLearn, // Path to your temporary loading image
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      );
                    }
                  },


                ),


              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.nameLesson,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Color(0xFF055C9D),
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Text(
                            '\$999,500',
                            style: TextStyle(
                              color: Color(0xFF055C9D),
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w700,
                              height: 0.17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'الأستاذ :${item.nameMaster}',
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF055C9D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "الدرس :${item.nameLesson}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF055C9D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        height: 0.19,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------------
class SliderHomeLesson extends StatelessWidget {
  final List<LatestLesson> latestLessons;

  const SliderHomeLesson({Key? key, required this.latestLessons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: SizedBox(
        height: 220,
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.75),
          itemCount: latestLessons.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                navigateTo(
                  context,
                  DetailsLessonCoursesScreen(
                    idDetails: latestLessons[index].id ?? 1,
                  ),
                );
              },
              child: buildCard(latestLessons[index], theme),
            );
          },
        ),
      ),
    );
  }

  Widget buildCard(LatestLesson item, ThemeData theme) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: Color(0xff055C9D),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffD9D9D9),
                Color(0xffD9D9D9),
                Color(0xffD9D9D9),
                Color(0xffD9D9D9).withOpacity(0.7),

                // Color(0x7FFFFFFF)
              ],
            ),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Image.network(
                    item.imageLesson,
                    width: double.infinity, height: 140,
                    fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Image.asset(
                        ImagesApp.noLearn, // Path to your temporary loading image
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover,
                      );
                    }
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.nameLesson,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              color: Color(0xFF055C9D),
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Text(
                            // '\$999,500',
                            'المزيد..',
                            style: TextStyle(
                              color: Color(0xFF055C9D),
                              fontSize: 14,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.w700,
                              height: 0.17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'القسم : ${item.nameSection}',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "الدرس : ${item.nameLesson}",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                          height: 0.19,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
