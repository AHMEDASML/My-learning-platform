import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/components/text_widgt/text_app_slime.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/layout/page_screen/search/view/screen/search_screen.dart';
import 'package:flutter/material.dart';

class ViewAllTeachersScreen extends StatefulWidget {
  const ViewAllTeachersScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllTeachersScreen> createState() => _ViewAllTeachersScreenState();
}

class _ViewAllTeachersScreenState extends State<ViewAllTeachersScreen> {
  final searchController = TextEditingController();

  // بيانات تجريبية للأساتذة
  final List<Teacher> teachers = [
    Teacher(
        name: "أحمد محمود",
        subject: "الرياضيات",
        imageUrl: ImagesApp.test1,
        coursePrice: "100\$"),
    Teacher(
        name: "أحمد محمود",
        subject: "الرياضيات",
        imageUrl: ImagesApp.test1,
        coursePrice: "100\$"),
    Teacher(
        name: "أحمد محمود",
        subject: "الرياضيات",
        imageUrl: ImagesApp.test1,
        coursePrice: "100\$"),
    Teacher(
        name: "أحمد محمود",
        subject: "الرياضيات",
        imageUrl: ImagesApp.test1,
        coursePrice: "100\$"),
    Teacher(
        name: "سارة علي",
        subject: "الفيزياء",
        imageUrl: ImagesApp.test1,
        coursePrice: "120\$"),
    // أضف المزيد من الأساتذة حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarApp(text: 'جميع المحتوى',),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: buildSearchBox(searchController: searchController),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                final teacher = teachers[index];
                return Card(
                  color: ColorManager.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black45,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(teacher.imageUrl),
                    ),
                    title: textSlime(
                        text: teacher.name,

                        sizeFont: 20,
                        fontWeight: FontWeight.w600),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textSlime(
                            text: teacher.subject,

                            sizeFont: 18),
                        textSlime(
                            text: teacher.coursePrice,

                            sizeFont: 16,
                            fontWeight: FontWeight.w800),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Teacher {
  final String name;
  final String subject;
  final String imageUrl;
  final String coursePrice;

  Teacher(
      {required this.name,
      required this.subject,
      required this.imageUrl,
      required this.coursePrice});
}
