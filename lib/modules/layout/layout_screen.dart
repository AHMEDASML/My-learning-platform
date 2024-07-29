import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/modules/layout/page_screen/home/view/screen/home_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/my_lessons/view/my_lessons_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/search/view/screen/search_screen.dart';
import 'package:educational_platform/modules/layout/page_screen/setting/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    super.initState();
    secureScreen();
  }

  Future<void> secureScreen() async {
    // This line will prevent screenshots and screen recordings
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  int visit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(


        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(20)),
        child: CurvedNavigationBar(
          backgroundColor: ColorManager.white,
          color: const Color(0xffD9D9D9).withOpacity(0.64),
          buttonBackgroundColor: const Color(0xff055C9D),
          items: [
            _buildNavItem(Icons.home_outlined, 'الرئيسية', 0),
            _buildNavItem(Icons.search, 'البحث', 1),
            _buildNavItem(Icons.favorite, 'المفضلة', 2),
            _buildNavItem(Icons.settings, 'الاعدادات', 3),
          ],
          onTap: (index) => setState(() => visit = index),
        ),
      ),
      body: _getCurrentPage(),
    );
  }

  CurvedNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    return CurvedNavigationBarItem(
      labelStyle: const TextStyle(
        color: Color(0xFF055C9D),
        fontSize: 16,
        fontFamily: 'Tajawal',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
      child: Icon(icon,
          size: 22,
          color: visit == index ?  Colors.white :  const Color(0xff055C9D)),
      label: label,
    );
  }

  Widget _getCurrentPage() {
    switch (visit) {
      case 0:
        return const HomeScreen();

      case 1:
        return const SearchScreen();
      case 2:
        return const MyFavoritesScreen();
      case 3:
        return const SettingScreen();
      default:
        return Container();
    }
  }
}
