import 'package:cached_network_image/cached_network_image.dart';
import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/auth/register/view/widget/item_reg.dart';
import 'package:educational_platform/modules/details_lesson/view/screen/details_lesson_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/my_lessons/controller/my_lessons_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../model/favourite_courses_model.dart';

// استبدل بمسار حزمة النصوص المخصصة والصور في مشروعك
// import 'package:educational_platform/global/components/text_app_slime.dart';
// import 'package:educational_platform/global/utils/images_file.dart';

class MyFavoritesScreen extends StatefulWidget {
  const MyFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen> {

  final MyLessonsController controller = Get.put(MyLessonsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: const AppBarApp(
        text: 'المفضلة',
      ),
      body: Column(
        children: [

          Expanded(
            child: Obx(() {
              if (controller.loading.isTrue) {
                return Center(child: loadingAppWidget());
              }

              var courses = controller.favouriteCoursesModel?.data;
              return ListView.builder(
                itemCount: courses!.favouriteCourses.length,
                itemBuilder: (context, index) {
                  final course = courses.favouriteCourses[index];
                  return MyFavoritesItem(course: course);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}


class MyFavoritesItem extends StatelessWidget {
  final FavouriteCourse course;
  const MyFavoritesItem({Key? key, required this.course}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(
            context,
            DetailsLessonScreen(
              idDetails: course.id,
            ));
      },
      child: SizedBox(
        height: 110,
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: course.cover,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => loadingAppWidget(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    course.nameCourse,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(FontAwesomeIcons.heart),
              ],
            ),
          ),
        ),
      ),
    );
  }
}