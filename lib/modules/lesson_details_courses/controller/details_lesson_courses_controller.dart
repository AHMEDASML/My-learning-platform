import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:educational_platform/global/components/show_toast_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:educational_platform/modules/lesson_details_courses/model/details_lesson_courses_model.dart';
import 'package:get/get.dart';

class DetailsLessonCoursesController extends GetxController {
  RxBool isFavouriteLoading = false.obs;
  final Dio _dio = Dio();
  final String? _token = CacheHelper.getData(key: TOKEN);
  RxBool loading = false.obs;

  final int courseId;

  DetailsLessonCoursesController({required this.courseId});

  DetailsLessonCoursesModel? detailsLessonCoursesModel;

  @override
  void onInit() {
    fetchDetailsData('https://munastiedu.com/api/details_lesson/$courseId',
        (data) => detailsLessonCoursesModel = data);
    super.onInit();
  }

  void _setLoading(bool status) {
    loading.value = status;
    update();
  }

  Future<void> fetchDetailsData(
      String url, Function(DetailsLessonCoursesModel) onSuccess) async {
    if (_token == null) {
      showToastApp(text: 'Token not found');
      return;
    }

    try {
      _setLoading(true);
      var headers = {'Authorization': 'Bearer $_token'};
      var response = await _dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(json.encode(response.data)); // Consider removing for production
        onSuccess(DetailsLessonCoursesModel.fromJson(response.data));
        _setLoading(false);
      } else {
        print('Error: ${response.statusMessage}'); // Consider using a logger
      }
    } catch (e) {
      showToastApp(text: 'Error: $e');
    } finally {
      _setLoading(false);
    }
  }
}
