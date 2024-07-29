import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/data/remote/dio_helper.dart';
import 'package:educational_platform/global/localization/locale.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:educational_platform/global/utils/size_app.dart';
import 'package:educational_platform/modules/auth/login/screen/login_screen.dart';
import 'package:educational_platform/modules/auth/register/view/screen/register_screen.dart';
import 'package:educational_platform/modules/details_lesson/view/screen/details_lesson_screen.dart';

import 'package:educational_platform/modules/layout/layout_screen.dart';
import 'package:educational_platform/modules/lesson_card/view/screen/lesson_card_screen.dart';
import 'package:educational_platform/modules/play_video/test11.dart';
import 'package:educational_platform/modules/setting_screen/change_password/view/screen/change_password.dart';
import 'package:educational_platform/modules/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(milliseconds: 50));
  SizeApp.screenSize =
      MediaQueryData.fromView(WidgetsBinding.instance.window).size;
  DioHelper.init();
  await CacheHelper.init();

  runApp(const MyApp());
}

void changeLang({required String codeLang}) {
  Locale locale = Locale(codeLang);
  CacheHelper.saveData(key: LANGUAGE, value: locale.toString());
  Get.updateLocale(locale);
}

language() {
  Locale initialLang = CacheHelper.getData(key: LANGUAGE) == null
      // ? Get.deviceLocale!
      ? const Locale('ar')
      // : Locale(CacheHelper.getData(key: LANGUAGE));
      : const Locale('ar');
  return initialLang;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final token = CacheHelper.getData(key: TOKEN);
    print(token);
    // changeLang(codeLang: 'ar');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocaleApp(),
      locale: language(),

      title: 'Flutter Demo',

      // home: RegisterScreen(),

      home: token == null ? const SplashScreen() : const LayoutScreen(),

    );
  }
}
