import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/components/logo_app_icon.dart';
import 'package:educational_platform/global/components/text_widgt/text_app_slime.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/auth/register/view/widget/item_reg.dart';
import 'package:educational_platform/modules/layout/page_screen/home/controller/home_controller.dart';
import 'package:educational_platform/modules/layout/page_screen/home/view/widget/carousel_slider_ads_app.dart';
import 'package:educational_platform/modules/layout/page_screen/home/view/widget/not_participated_lesson.dart';
import 'package:educational_platform/modules/layout/page_screen/home/view/widget/slider_home.dart';
import 'package:educational_platform/modules/view_all_teachers/view/view_all_teachers_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cont = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: 0,
          title: Column(
            children: [
              Row(
                children: [
                  textSlime(
                      text: 'المعرف الخاص بك : ',
                      color: const Color(0xFF055C9D),
                      sizeFont: 12,
                      fontWeight: FontWeight.w500),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF055C9D),
                  )
                ],
              ),
            ],
          ),
          actions: [
            // Placeholder for app logo
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: logoAppIcon(urlImage: ImagesApp.logoApp3)),
          ],
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (con) {
              if (con.loading.value) {
                return Container(
                   color:  ColorManager.white,
                    child: Center(child: loadingAppWidget())); // Show loader
              }
              return SingleChildScrollView(
                child: Container(
                  color: ColorManager.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropDawn(
                        id: CacheHelper.getData(key: 'NumberUnified')
                            .toString(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),


                      CarouselSliderAdsApp(
                        ads: con.homeModel!.data.ads,
                      ),


                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: TextBoldApp(
                          text: 'متابعة دروسي',
                          color: Color(0xFF0E86D4),
                          sizeFont: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),


                      con.homeModel!.data.myCourses.isEmpty
                          ? const NotParticipatedLesson()
                          : MyCarouselSlider(
                              courses: con.homeModel!.data.myCourses,
                            ),



                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: itemRegister(

                            context: context,
                            text: 'الدروس المضافة جديثا',
                            text2: 'عرض الكل'),
                      ),



                      SliderHomeLesson(
                        latestLessons: cont.homeModel!.data.latestLessons,
                      ),


                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: itemRegister(
                            context: context,
                            text: 'الكورسات المضافة حديثا',
                            text2: 'عرض الكل'),
                      ),



                      const SizedBox(
                        height: 30,
                      ),
                      SliderHomeCourses(
                        latestCourses: cont.homeModel!.data.latestCourses,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

class DropDawn extends StatelessWidget {
  final String id;

  const DropDawn({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xB5DCDCDC)),
          borderRadius: BorderRadius.circular(2),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1E000000),
            blurRadius: 5,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Text(
        id.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF055C9D),
          fontSize: 15,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
    );
  }
}
