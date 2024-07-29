import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/components/text_widgt/text_app_slime.dart';
import 'package:educational_platform/global/components/text_widgt/text_bold_app.dart';
 import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:flutter/material.dart';

class TeacherPageScreen extends StatefulWidget {
  const TeacherPageScreen({Key? key}) : super(key: key);

  @override
  State<TeacherPageScreen> createState() => _TeacherPageScreenState();
}

class _TeacherPageScreenState extends State<TeacherPageScreen> {
  // Dummy list of courses for demonstration
  final List<String> courses = [
    "Mathematics 101",
    "Physics for Beginners",
    "Advanced Algebra",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      // appBar: AppBarApp(
      //
      //
      //   text: 'حساب الاستاذ',
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [

            Image.asset(ImagesApp.backgroundAccount,fit: BoxFit.fill,

              width: MediaQuery.of(context).size.width,
              height: 200,),



            Padding(
              padding: const EdgeInsets.only(top: 120,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,

                children: [









                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        const Padding(
                          padding: EdgeInsets.only(top: 70,right: 10,left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'الأستاذ : محمد الطويل',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF055C9D),
                                  fontSize: 17,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w500,
                                  height: 0,

                                ),
                              ),


                              Text(
                                'المادة المدرسة : الرياضيات',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF0E86D4),
                                  fontSize: 12,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w400,

                                ),
                              ),


                            ],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: CircleAvatar(
                            backgroundColor: ColorManager.app2,
                            radius: 60,
                            backgroundImage: const NetworkImage(
                                "https://via.placeholder.com/150"), // Placeholder image
                          ),
                        ),
                      ],
                    ),



                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        SizedBox(height: 10,),
                      Text(
                        'حول الأستاذ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w700,


                        ),
                      ),
                        SizedBox(height: 10,),



                      Text(
                        'هذا النص وهمي نقديم خدمات متنوعة تشمل حقن التجميل والملء، والعلاج بالليزر، وجراحات التجميل، وإجراءات تجديد البشرة. يستخدم مهاراته وخبرته لتقديم استشارات فردية للمرضى ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 14,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,

                        ),
                      ),
                        SizedBox(height: 10,),

                      Text(
                        'الدورات المقدمة',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w700,

                        ),
                      ),
                    ],),
                  ),


                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    // to disable ListView's scrolling
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xffF2F7FD)
                          ),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Image.asset(ImagesApp.noLearn,height: 60,width: 69,),
                              ),


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Text(
                                      'اسم المادة: ${courses[index]}',
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Color(0xFF055C9D),
                                        fontSize: 14,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),


                                    Text(
                                      'تفاصيل المادة: تحتوي على 6  دروس   ',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF0E86D4),
                                        fontSize: 12,
                                        fontFamily: 'Tajawal',
                                        fontWeight: FontWeight.w400,

                                      ),
                                    ),
                                  ],
                                ),
                              ),


                              Text(
                                '\$999,500',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF68BBE3),
                                  fontSize: 11,
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w700,

                                ),
                              ),




                            ],
                          ),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
