import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:educational_platform/global/components/show_toast_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/color_app.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:educational_platform/modules/details_lesson/model/details_course_model.dart';
import 'package:educational_platform/modules/details_lesson/model/is_favourite_model.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxBool isFavouriteLoading = false.obs;
  final Dio _dio = Dio();
  final String? _token = CacheHelper.getData(key: TOKEN);
  RxBool loading = false.obs;

  final int courseId;
  DetailsController({required this.courseId});

  DetailsCourseModel? detailsCourseModel;
  IsFavouriteModel? isFavouriteModel;
  @override
  void onInit() {
    fetchDetailsData('https://munastiedu.com/api/details_course/$courseId',
        (data) => detailsCourseModel = data);
    super.onInit();
  }



  Future<void> setFavourite(int courseId) async {
    isFavouriteLoading.value = true;

    var headers = {
      'Authorization': 'Bearer $_token'
    };
    try {
      var response = await _dio.post(
        'https://munastiedu.com/api/set_favourite/$courseId',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print("Favourite status updated");




        isFavouriteModel = IsFavouriteModel.fromJson(response.data);

        showToastApp(text: isFavouriteModel!.data==true? 'تم اضافتها الى المفضلة': 'تم الحذف من المفضلة',color: ColorManager.app6);

        fetchDetailsData('https://munastiedu.com/api/details_course/$courseId',
                (data) {
              detailsCourseModel = data;
              update(); // تحديث البيانات في الواجهة
            });


      } else {
        print("Error setting favourite: ${response.statusMessage}");
      }
    } catch (e) {
      print("Error setting favourite: $e");
    } finally {
      isFavouriteLoading.value = false;
    }
  }




  void _setLoading(bool status) {
    loading.value = status;
    update();
  }

  Future<void> fetchDetailsData(
      String url, Function(DetailsCourseModel) onSuccess) async {
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
        onSuccess(DetailsCourseModel.fromJson(response.data));
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
