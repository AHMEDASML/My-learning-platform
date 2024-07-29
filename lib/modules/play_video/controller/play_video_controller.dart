import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:educational_platform/global/components/show_toast_app.dart';
import 'package:educational_platform/global/data/local/cache_helper.dart';
import 'package:educational_platform/global/utils/key_shared.dart';
import 'package:educational_platform/modules/play_video/model/play_video_model.dart';
import 'package:get/get.dart';

class PlayVideoController extends GetxController {
  final int courseId;

  PlayVideoController({required this.courseId});


  final Dio _dio = Dio();
  final String? _token = CacheHelper.getData(key: TOKEN);
  RxBool loading = false.obs;
  PlayVideoModel? playVideoModel;

  Completer<void> initCompleter = Completer<void>();

  @override
  void onInit() {
    super.onInit();
    fetchDetailsData('https://munastiedu.com/api/play_video/$courseId', (data) {
      playVideoModel = data;
      initCompleter.complete(); // Now using the correctly named completer.

      print('playVideoModel.videoUrl');
      print(playVideoModel?.videoUrl);
    });
  }

  void _setLoading(bool status) {
    loading.value = status;
    update();
  }

  Future<void> fetchDetailsData(
      String url, Function(PlayVideoModel) onSuccess) async {
    if (_token == null) {
      showToastApp(text: 'Token not found');
      initCompleter.complete(); // Completing even in the case of early return.
      return;
    }

    try {
      _setLoading(true);
      var headers = {'Authorization': 'Bearer $_token'};
      var response = await _dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        print(json.encode(response.data)); // Debugging line
        onSuccess(PlayVideoModel.fromJson(response.data));
        update();
      } else {
        showToastApp(text: 'Error: ${response.statusMessage}');
        initCompleter.complete();
      }
    } catch (e) {
      showToastApp(text: 'Error: $e');
    } finally {
      _setLoading(false);
    }
  }
}
