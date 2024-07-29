import 'package:educational_platform/global/common/functions_app.dart';
import 'package:educational_platform/global/common/loading_app.dart';
import 'package:educational_platform/global/components/app_bar_app.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/images_file.dart';
import 'package:educational_platform/modules/details_lesson/view/screen/details_lesson_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/search_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final SearchControllerApp searchCont = Get.put(SearchControllerApp());

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String searchQuery = searchController.text;
    if (searchQuery.length > 2) {
      searchCont.fetchSearchData(searchQuery);
      // searchCont.fetchSearchData('vvveee');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarApp(
        text: 'خيارات البحث',
      ),
      backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            buildSearchBox(searchController: searchController),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'مشاهدة:',
                    style: TextStyle(
                      color: Color(0xFF8D9091),
                      fontSize: 12,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'نتائج البحث',
                    style: TextStyle(
                      color: Color(0xFF444444),
                      fontSize: 12,
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),

            // زبط مربع البحث
            Expanded(
              child: Obx(() {
                if (searchCont.loading.value) {
                  return Center(child: loadingAppWidget());
                }

                if (searchCont.searchResults.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(ImagesApp.logoApp3)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Center(
                        child: Text(
                          'لا يوجد اي نتيجة بحث ',
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontSize: 16,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  itemCount: searchCont.searchResults.length,
                  itemBuilder: (context, index) =>
                      buildCard(searchCont.searchResults[index]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(Datum datum) {
    return GestureDetector(
      onTap: () {
        navigateTo(
            context,
            DetailsLessonScreen(
              idDetails: datum.id,
            ));
      },
      child:

      Stack(
        children: [
          Container(
            height: 117,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(datum.logo),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.green),
          ),
          Container(
            width: 150,
            height: 117,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color(0xffD9D9D9),
                  const Color(0xffD9D9D9),
                  const Color(0x81d9d9d9).withOpacity(0.9)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '\$999,500',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF68BBE3),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0.17,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'اللغة العربية',
                      style: TextStyle(
                        color: Color(0xFF055C9D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                      "الأستاذ : ${datum.nameMaster}",
                      style: const TextStyle(
                        color: Color(0xFF055C9D),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "الدورة : ${datum.nameCourse}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFF444444),
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w400,
                        height: 0.19,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSearchBox({required TextEditingController searchController}) {
  return Column(
    children: [
      SizedBox(
        width: 318,
        height: 40,
        child: Stack(
          children: [
            Container(
              width: 318,
              height: 40,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFD9D9D9),
                    const Color(0xffD9D9D9).withOpacity(0.6),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.4),
                    width: 0.3,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 12,
              child: SizedBox(
                width: 288,
                height: 16,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'بحث .',
                          hintStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Color(0xFF055C9D),
                          fontSize: 13,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          searchController.clear(); // مسح النص
                        },
                        child: Icon(
                            size: 18, Icons.clear, color: ColorManager.app7))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
