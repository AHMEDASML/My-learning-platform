import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/components/button_app.dart';
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/text_widgt/text_app_slime.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/details_lesson/controller/details_controller.dart';
import 'package:educational_platform/modules/details_lesson/view/widget/item_detils_lesson.dart';
import 'package:educational_platform/modules/lesson_card/view/screen/lesson_card_screen.dart';
import 'package:educational_platform/modules/play_video/view/screen/play_video_screen.dart';
import 'package:educational_platform/modules/teacher/teacher_page/view/screen/teacher_page_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart'; // For ImageFilter.blur

class DetailsLessonScreen extends StatefulWidget {
  final int idDetails;

  const DetailsLessonScreen({Key? key, required this.idDetails})
      : super(key: key);

  @override
  State<DetailsLessonScreen> createState() => _DetailsLessonScreenState();
}

class _DetailsLessonScreenState extends State<DetailsLessonScreen> {
  late final DetailsController con;

  @override
  void initState() {
    super.initState();
    con = Get.put(DetailsController(courseId: widget.idDetails));
  }

  @override
  void dispose() {
    Get.delete<DetailsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () async {
        Get.delete<DetailsController>();
        return true;
      },
      child: Scaffold(
        body: Obx(() {
          if (con.loading.isTrue) {
            return Center(child: loadingAppWidget());
          }

          var course = con.detailsCourseModel;
          if (course == null) return const Center(child: Text('No data'));

          return SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Image.asset(ImagesApp.backgroundAccount,fit: BoxFit.fill,

                      width: MediaQuery.of(context).size.width,
                      height: 200,),


                    Column(
                      children: [

                        const SizedBox(height: 50,),
                        Text(
                          course.nameLesson,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w700,

                          ),
                        ),

                        const SizedBox(height: 10,),

                        Text(
                          course.nameCourse,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w400,

                          ),
                        ),
                        const SizedBox(height: 20,),



                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [


                            Row(children: [
                              Padding(
                                padding:   const EdgeInsets.symmetric(horizontal: 8),
                                child:  iconAccount(
                                  icon: Icons.favorite_outline_rounded,
                                  isFavouriteLoading: con.isFavouriteLoading.isTrue,
                                  isFavourite: con.detailsCourseModel!.isFavourite,
                                  onTap: () {
                                    if (!con.isFavouriteLoading.isTrue) {
                                      con.setFavourite(widget.idDetails);
                                    }
                                  },
                                ),
                              ),






                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: iconAccount(icon: FontAwesomeIcons.user,onTap: (){
                                  navigateTo(context, const TeacherPageScreen());
                                }),
                              ),

                            ],),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: subscribeButton(onTap: (){
                              navigateTo(context, LessonCardScreen(id: con.detailsCourseModel!.id,));
                            }),
                          ),



                        ],)



                      ],
                    ),
                  ],
                ),



                const SizedBox(height: 30,),

                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6, horizontal: 16),

                  child: TextBoldApp(
                    text: '${course.price}اشتراك  ',
                    color: const Color(0xFF055C9D),
                    sizeFont: 16,
                  ),
                ),



                Column(
                  children: [
                    ...List.generate(course.listVideos.length, (index) {
                      return  course.listVideos[index].isFree== 1 ? ItemDetailsLesson(
                          onTap:  (){
                            navigateTo(context, PlayVideoScreen(videoUrl: course.listVideos[index].id));
                          },
                          video: course.listVideos[index]): Container();
                    }),
                  ],
                ),
                const SizedBox(height: 30,),

                const Text(
                  'يمكنك مشاهدة باقي الدروس عند الاشتراك',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF055C9D),
                    fontSize: 14,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),



              ],
            ),
          );
        }),
      ),
    );
  }
}

Widget subscribeButton({void Function()? onTap  }){
  return GestureDetector(
    onTap: onTap,
    child: Card(
      child: Container(

        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 9),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.39, -0.92),
            end: Alignment(0.39, 0.92),
            colors: [

              Color(0xFFD9D9D9),
              Color(0x0CD9D9D9)

            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x3F5A5A5A),
              blurRadius: 16,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Text(
          'اشترك الآن',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF055C9D),
            fontSize: 15,
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
    ),
  );
}


Widget iconAccount({
  required IconData icon,
  bool? isFavouriteLoading,
  bool? isFavourite,
  void Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color(0xffD9D9D9),
            const Color(0xffD9D9D9).withOpacity(0.1),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F363636),
            blurRadius: 3.30,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: isFavouriteLoading != null && isFavouriteLoading
          ? const CircularProgressIndicator(color: Color(0xFF055C9D))
          : Icon(
        isFavourite != null && isFavourite
            ? Icons.favorite
            : icon,
        color: const Color(0xFF055C9D),
        size: 18,
      ),
    ),
  );
}