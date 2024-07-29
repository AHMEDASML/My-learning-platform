import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/details_lesson/view/screen/details_lesson_screen.dart';
import 'package:educational_platform/modules/lesson_details_courses/controller/details_lesson_courses_controller.dart';
import 'package:educational_platform/modules/lesson_details_courses/model/details_lesson_courses_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsLessonCoursesScreen extends StatefulWidget {
  final int idDetails;

  const DetailsLessonCoursesScreen({Key? key, required this.idDetails})
      : super(key: key);

  @override
  State<DetailsLessonCoursesScreen> createState() =>
      _DetailsLessonCoursesScreenState();
}

class _DetailsLessonCoursesScreenState
    extends State<DetailsLessonCoursesScreen> {
  late final DetailsLessonCoursesController con;

  @override
  void initState() {
    super.initState();
    con = Get.put(DetailsLessonCoursesController(courseId: widget.idDetails));
  }

  @override
  void dispose() {
    Get.delete<DetailsLessonCoursesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<DetailsLessonCoursesController>();
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: const AppBarApp(
          text: 'تفاصيل المادة ',
        ),
        body: Obx(() {
          if (con.loading.isTrue) {
            return Center(child: loadingAppWidget());
          }

          var course = con.detailsLessonCoursesModel;
          if (course == null) return const Center(child: Text('No data'));

          return Container(
            color: ColorManager.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const SizedBox(height: 20),

                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(ImagesApp.logoApp3)),
                  ),
                  const SizedBox(height: 20),

                  if (course.data.isNotEmpty)
                    ...course.data
                        .map((datum) => CourseDetailWidget(courseDetail: datum))
                        .toList()
                  else
                    const Center(child: Text('No course details available')),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CourseDetailWidget extends StatelessWidget {
  final Datum courseDetail;

  const CourseDetailWidget({Key? key, required this.courseDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: InkWell(
        onTap: () {
          navigateTo(
              context,
              DetailsLessonScreen(
                idDetails: courseDetail.id,
              ));
        },
        child: Card(
          shadowColor: const Color(0xff055C9D).withOpacity(0.6),
          elevation: 4,
          child: Stack(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: courseDetail.cover,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset(
                      ImagesApp.noLearn,
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      ImagesApp.noLearn,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: 160,
                height: 140,
                decoration:   BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [
                      const Color(0xffD9D9D9),
                      const Color(0xffD9D9D9),

                      const Color(0xffD9D9D9).withOpacity(0.8),
                      // const Color(0xffD9D9D9),

                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        courseDetail.price,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Color(0xFF68BBE3),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        courseDetail.nameLesson,
                        style: const TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 12,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "الأستاذ : ${courseDetail.nameMaster}",
                        style: const TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "الدورة : ${courseDetail.nameCourse}",
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF444444),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
