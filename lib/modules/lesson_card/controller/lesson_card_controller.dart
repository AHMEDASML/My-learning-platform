import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:educational_platform/global/components/show_toast_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonCardController extends GetxController {
  RxBool isLoading = false.obs;
  final String? _token = CacheHelper.getData(key: TOKEN);

  Future<bool> subscribeLesson({
    required BuildContext context,
    required String code,
    required int id,
  }) async {
    isLoading.value = true;

    var headers = {
      'Authorization': 'Bearer $_token',
    };

    // Prepare data for Dio request
    final data = json.encode({'code': code});

    var dio = Dio();
    try {
      var response = await dio.request(
        'https://munastiedu.com/api/subscribe/$id',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        // Successful subscription
        print(json.encode(response.data));
        showToastApp(
          text: 'تمت عملية الشراء بنجاح',
          color: ColorManager.green,
        );
        Get.back(result: true);
        return true;
      } else if (response.statusCode == 400) {
        // Bad request or invalid code
        showToastApp(
          text: 'الرمز المدخل غير صالح',
          color: Colors.red.shade600,
        );
        return false;

      } else {
        // Handle other errors
        showToastApp(
          text: 'خطأ: ${response.statusMessage}',
          color: Colors.red.shade600,
        );
        return false;
      }
    } on DioError catch (e) {
      // Network error or other issues
      String errorMessage;
      if (e.response != null) {
        errorMessage = 'خطأ في الاتصال: ${e.response!.statusMessage}';
        return false;
      } else {
        errorMessage = 'خطأ غير متوقع في الاتصال بالشبكة';
        return false;
      }
      showToastApp(
        text: errorMessage,
        color: Colors.red.shade600,
      );
    } finally {
      isLoading.value = false;
      return false;
    }
  }
}
