import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/components/button_app.dart';
import 'package:educational_platform/global/components/dived_widget.dart';
import 'package:educational_platform/global/components/icon_app_widget.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/modules/auth/register/view/widget/item_reg.dart';
import 'package:educational_platform/modules/details_lesson/controller/details_controller.dart';
import 'package:educational_platform/modules/lesson_card/controller/lesson_card_controller.dart';
import 'package:educational_platform/modules/lesson_card/view/widget/card_distributors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonCardScreen extends StatefulWidget {
  final int id;

  const LessonCardScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<LessonCardScreen> createState() => _LessonCardScreenState();
}

class _LessonCardScreenState extends State<LessonCardScreen> {
  final TextEditingController _codeController = TextEditingController();
  final LessonCardController lessonCardController =
      Get.put(LessonCardController());
  RxBool isLoadingButton = false.obs;

  void _subscribeLesson() {
    String code = _codeController.text;
    if (code.length == 8) {
      // Start loading
      isLoadingButton.value = true;

      // Execute the subscription logic
      lessonCardController
          .subscribeLesson(
        context: context,
        code: code,
        id: widget.id,
      )
          .then((result) {
        if (result) {}
      });

      // Stop loading after the operation completes
      lessonCardController.isLoading.listen((loading) {
        if (!loading) {
          isLoadingButton.value = false;
        }
      });
    } else {
      // Show a message or alert the user if the code is not valid
      Get.snackbar(
        'خطا',
        'الرجاء إدخال رمز اشتراك صالح.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: const AppBarApp(
        text: 'تعبئة بطاقة الدرس',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Container(

                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffD9D9D9)

                ),



                child:   Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [

                    const Text(
                      'ادخل رمز الاشتراك للمتابعة',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF055C9D),
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),


                    const Text(
                      'ستجد رمز الاشتراك خلف البطاقة , يتكون الرمز من 8 حروف وأرقام',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF0E86D4),
                        fontSize: 13,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextField(
                      controller: _codeController,
                      maxLength: 8,
                      style: const TextStyle(
                        fontSize: 18, // Larger text for better readability
                      ),
                      decoration: InputDecoration(

                        hintText: 'ادخل كود الاشتراك',
                        suffixIcon: Icon(Icons.vpn_key, color: ColorManager.app6),
                        // Custom icon color
                        filled: true,
                        // Fill color enabled
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                            BorderSide(color: Color(0xff055C9D), width: 2),
                        ),
                      ),
                    ),




                    const SizedBox(height: 10),
                    Obx(() {
                      return isLoadingButton.value
                          ? Center(
                        child: loadingAppWidget(),
                      )
                          : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: buttonApp(

                          onTap: _subscribeLesson,
                          borderRadius: 10,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: ColorManager.app7,
                          text: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                'متابعة',
                                style: TextStyle(
                                  color: Colors.white,
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
                    }),





                  ],),
                ),
              ),










              const SizedBox(height: 30),

              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'يمكنك شراء البطاقة من الموزعين أدناه',
                  style: TextStyle(
                    color: Color(0xFF055C9D),
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              const CardDistributors(),
              const CardDistributors(),
            ],
          ),
        ),
      ),
    );
  }
}
