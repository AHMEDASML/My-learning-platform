 import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../main.dart';

class LocalController extends GetxController {
  String selectedLanguage = 'ar';

  @override
  void onInit() {
    selectedLanguage = CacheHelper.getData(key: LANGUAGE) ?? 'ar';
    super.onInit();
  }

  void changeLang({required String codeLang}) {
    Locale locale = Locale(codeLang);
    CacheHelper.saveData(key: LANGUAGE, value: locale.toString());
    Get.updateLocale(locale);
    update();
  }
}

